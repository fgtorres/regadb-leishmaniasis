package net.sf.regadb.ui.form.query.querytool;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.regadb.db.Dataset;
import net.sf.regadb.db.Protein;
import net.sf.regadb.db.Transaction;
import net.sf.regadb.db.ViralIsolate;
import net.sf.regadb.db.session.Login;
import net.sf.regadb.io.datasetAccess.DatasetAccessSolver;
import net.sf.regadb.io.exportCsv.ExportToCsv;
import net.sf.regadb.ui.form.query.querytool.fasta.QTFastaExporter;
import net.sf.regadb.util.script.Python;
import net.sf.regadb.util.settings.RegaDBSettings;

import org.hibernate.exception.SQLGrammarException;

import com.pharmadm.custom.rega.queryeditor.ConfigurableWord;
import com.pharmadm.custom.rega.queryeditor.ExporterSelection;
import com.pharmadm.custom.rega.queryeditor.FieldSelection;
import com.pharmadm.custom.rega.queryeditor.FromVariable;
import com.pharmadm.custom.rega.queryeditor.InputVariable;
import com.pharmadm.custom.rega.queryeditor.OutputSelection;
import com.pharmadm.custom.rega.queryeditor.OutputVariable;
import com.pharmadm.custom.rega.queryeditor.Query;
import com.pharmadm.custom.rega.queryeditor.QueryEditor;
import com.pharmadm.custom.rega.queryeditor.Selection;
import com.pharmadm.custom.rega.queryeditor.SelectionStatusList;
import com.pharmadm.custom.rega.queryeditor.TableSelection;
import com.pharmadm.custom.rega.queryeditor.port.QueryStatement;
import com.pharmadm.custom.rega.queryeditor.port.ScrollableQueryResult;
import com.pharmadm.custom.rega.queryeditor.port.hibernate.HibernateStatement;

import eu.webtoolkit.jwt.WFileResource;
import eu.webtoolkit.jwt.WString;

public class QueryToolRunnable implements Runnable {
	private QueryEditor editor;
	private Login originalLogin;
	private String fileName;
	private Status status;
	private File csvFile;
	private File fastaFile;
	private File summaryFile;
	private int numberFastaEntries;
	private String statusMsg = "";
	private QueryStatement statement;
	private Object mutex = new Object();
	private HashMap<String, String> errors;
	private boolean postProcessing;
	private String postProcessingScript;
	
	private HashMap<String, Integer> variablePositions = new HashMap<String, Integer>();
	
	private enum Status {
		WAITING,
		RUNNING,
		FINISHED,
		FAILED,
		CANCELED
	}
	
	private class CsvLine{
	    private StringBuilder line;
	    private int n;
	    
	    public CsvLine(){
	        line = new StringBuilder();
	        n = 0;
	    }
	    
	    public void addField(String f){
	        if(n > 0)
	            line.append(',');
	        line.append('"');
	        line.append((f == null ? "null" : f.replace("\"", "\"\"")));
	        line.append('"');
	        
	        ++n;
	    }
	    
	    public String toString(){
	        return line.toString();
	    }
	}
	
	public QueryToolRunnable(Login login, String fileName, String postProcessingScript, QueryEditor editor) {
		this.fileName = fileName;
		this.postProcessingScript = postProcessingScript;
		this.originalLogin = login;
		this.editor = editor;
		status = Status.WAITING;
		errors = new HashMap<String, String>();
		errors.put("write_error", WString.tr("form.query.querytool.label.status.failed.writeerror").getValue());
		errors.put("memory_error", WString.tr("form.query.querytool.label.status.failed.memoryerror").getValue());
		errors.put("sql_error", WString.tr("form.query.querytool.label.status.failed.sqlerror").getValue());
		errors.put("type_error", WString.tr("form.query.querytool.label.status.failed.typeerror").getValue());
		postProcessing = false;
	}
	
	public boolean isDone() {
		return status == Status.FINISHED;
	}
	
	public boolean isFailed() {
		return status == Status.FAILED;
	}
	
	public CharSequence getStatusText() {
		if (status == Status.RUNNING) {
			return WString.tr("form.query.querytool.label.status.running").getValue() + statusMsg;			
		}
		else if (status == Status.FINISHED) {
			return WString.tr("form.query.querytool.link.result").getValue() + statusMsg;			
		}
		else if (status == Status.FAILED) {
			return WString.tr("form.query.querytool.label.status.failed").getValue() + statusMsg;			
		}
		else if (status == Status.CANCELED) {
			return WString.tr("form.query.querytool.label.status.canceling").getValue() + statusMsg;			
		}
		return WString.tr("form.query.querytool.label.status.initial");
	}

	public void run() {
        csvFile =  getOutputFile();

        if(process()){
            status = Status.FINISHED;
        }
        else{
            status = Status.FAILED;
        }
        
		QueryToolThread.removeQueryThread(fileName);
	}
	
    private File getResultDir(){
        File queryDir = new File(RegaDBSettings.getInstance().getInstituteConfig().getQueryResultDir().getAbsolutePath() + File.separator + "querytool");
        if(!queryDir.exists()){
        	 queryDir.mkdirs();
        }
        return queryDir;
    }
    
    private File getOutputFile() {
        File queryDir = getResultDir();
        return new File(queryDir.getAbsolutePath()  + File.separator + fileName);
    }
	
    public WFileResource getTableDownloadResource(){
    	if (isDone()) {
    		return new WFileResource("application/csv", csvFile.getAbsolutePath(), null);
    	}
    	return null;
    }
    
    public WFileResource getFastaDownloadResource() {
    	if (isDone() && fastaFile != null) {
    		return new WFileResource("application/fasta", fastaFile.getAbsolutePath(), null);
    	}
    	return null;
    }
    
    public File getSummaryFile() {
    	return summaryFile;
    }
	
    private boolean process(){
    	boolean success = false;
    	
    	fastaFile = null;
    	numberFastaEntries = 0;
    	summaryFile = null;
        
    	Login copiedLogin = originalLogin.copyLogin();

        try{
        	Transaction t = copiedLogin.createTransaction();
        	statement = new HibernateStatement(t);
        	
        	// create a copy of the query editor so the user can work on
        	// his query while this thread is running
        	QueryEditor newEditor = (QueryEditor) editor.clone();

        	// do the query with all tables we need fields of selected 
    		// so we can filter based on the objects
    		SelectionStatusList oldList = newEditor.getQuery().getSelectList();
    		SelectionStatusList newList = createSelectionList(oldList);
    		newList.setQuery(newEditor.getQuery());
    		newEditor.getQuery().setSelectList(newList);
    		ScrollableQueryResult result = getQueryResult(newEditor.getQuery(), statement);
			newEditor.getQuery().setSelectList(oldList);
	        status = Status.RUNNING;  
			
            if(result != null){
        		List<Selection> selections = getFlatSelectionList(newList);

        		Set<Dataset> datasets = new HashSet<Dataset>(t.getDatasets());
        		Map<String, Protein> proteins = new HashMap<String, Protein>();
        		for (Protein p : t.getProteins()) 
        			proteins.put(p.getAbbreviation(), p);
        		
	            FileOutputStream os = new FileOutputStream(csvFile);
	            ExportToCsv csvExport = new ExportToCsv();
				Set<Integer> accessiblePatients = getAccessiblePatients(t);
				
				OutputStreamWriter fastaOS = null;
				if (newEditor.getQuery().getFastaExport() != null  
						&& ((QTFastaExporter)newEditor.getQuery().getFastaExport()).getMode() != null) {
					fastaFile = new File(getResultDir().getAbsolutePath()  + File.separator + fileName + ".fasta");
					fastaOS = new OutputStreamWriter(new FileOutputStream(fastaFile));
				}
	          
				
	            os.write(getHeaderLine(selections, newList.getSelectedColumnNames()).getBytes());
	          
	            int lines = 0;
	            int writtenLines = 0;
	            Set<Integer> isolateIds = new HashSet<Integer>();
            	while (!result.isLast() && status != Status.CANCELED) {
            		Object[] o = null;
            		synchronized (mutex) {
                		o = result.get();
					}
            		if (fastaFile != null) {
            			ViralIsolate vi = (ViralIsolate)o[o.length - 1];
            			if(isolateIds.add(vi.getViralIsolateIi()) && DatasetAccessSolver.getInstance().canAccessViralIsolate(vi, new HashSet<Dataset>(), accessiblePatients))
            				numberFastaEntries += ((QTFastaExporter)newEditor.getQuery().getFastaExport()).export(vi, fastaOS, datasets, proteins);
            		}
            		//TODO new HashSet<Dataset>() is a workaround, only accessiblePatients is being used in the end
            		//this access solving stuff is horrible and could use a little rewrite, someday
            		writtenLines+= (processLine(o, t, os, csvExport, selections, new HashSet<Dataset>(), accessiblePatients)?1:0);
            		lines++;
            		statusMsg = " (" + writtenLines + ")";
            	}
	            
            	if (fastaFile != null)
            		fastaOS.close();
	            os.close();
	            
	            postProcess();
	            
        		statusMsg = " (" + writtenLines + ")";
	            success = true;
            }
			statement.close();
            t.clearCache();
        }
        catch(IOException e){
        	statusMsg = ": " + errors.get("write_error");
            e.printStackTrace();
        } catch (OutOfMemoryError e) {
        	statusMsg = ": " + errors.get("memory_error");
			e.printStackTrace();
		} catch (SQLException e) {
        	statusMsg = ": " + errors.get("sql_error");
			e.printStackTrace();
		} catch (IllegalStateException e) {
			statusMsg = ": " + errors.get("sql_error");
			e.printStackTrace();
		} catch (SQLGrammarException e ) {
			statusMsg = ": " + errors.get("sql_error");
			e.printStackTrace();
		}
		catch (ClassCastException e ) {
			statusMsg = ": " + errors.get("type_error");
			e.printStackTrace();
		}		
		catch (Exception e) {
			statusMsg = ": " + e.getMessage();
			e.printStackTrace();
		} finally {
			copiedLogin.closeSession();
		}
        return success;
    }
    
    private void postProcess() throws IOException {
    	if (postProcessingScript == null)
    		return;
    	
    	postProcessing = true;
    	
    	List<String> arguments = new ArrayList<String>();
    	
    	String fastaFileName = fastaFile == null? "" : fastaFile.getAbsolutePath();
    	
    	summaryFile = new File(getResultDir().getAbsolutePath()  + File.separator + fileName + "summary.csv");
    	
    	arguments.add(csvFile.getAbsolutePath());
    	arguments.add(fastaFileName);
    	arguments.add(summaryFile.getAbsolutePath());
    	
    	Python.getInstance().execute(postProcessingScript, "query_tool_post_process", arguments);
    	
    	postProcessing = false;
    }
    

    private Set<Integer> getAccessiblePatients(Transaction t) {
		ScrollableQueryResult result = new HibernateStatement(t).executeScrollableQuery(
				"select pd.id.patient.patientIi from PatientDataset pd where " +
				/*"pd.id.dataset.id in (select ds.id from Dataset ds where ds.settingsUser.uid = '"+ originalLogin.getUid() +"') "+*/
				"pd.id.dataset.id in (select da.id.dataset.id from DatasetAccess da where da.id.settingsUser.uid = '" + originalLogin.getUid() + "')", null);
		Set<Integer> results = new HashSet<Integer>();
		while (!result.isLast()) {
			results.add((Integer) result.get()[0]);
		}
		return results;
	}

	private boolean processLine(Object[] o, Transaction t, FileOutputStream os, ExportToCsv csvExport, List<Selection> selections, Set<Dataset> userDatasets, Set<Integer> accessiblePatients) throws IOException {
		String line = getLine(o, selections, csvExport, userDatasets, accessiblePatients);
		t.clearCache(o);
		if (line != "") {
			os.write(line.getBytes());
			return true;
		}
		return false;
    }
	
    private String getLine(Object[] array, List<Selection> selections, ExportToCsv csvExport, Set<Dataset> userDatasets, Set<Integer> accessiblePatients) {
		boolean lastTableAccess = false;
		
		CsvLine line = new CsvLine();
		
		try{
			for (int j = 0 ; j < selections.size() ; j++) {
				Selection sel = selections.get(j);
				if (sel instanceof TableSelection) {
					lastTableAccess = (csvExport.getCsvLineSwitch(array[j], userDatasets, accessiblePatients) != null);
				}
				else if (sel instanceof FieldSelection
						|| sel instanceof OutputSelection) {
					// if the first element is an outputselection selection list
					// changes made earlier guarantee that it is a static value
					// so it can be outputted regardless of access
					if (array[j]!=null && ( lastTableAccess || j == 0 && selections.get(j) instanceof OutputSelection )) {
						line.addField(array[j].toString());
						
						if(sel instanceof ExporterSelection){
							ExporterSelection xsel = (ExporterSelection)sel;
							Integer i = variablePositions.get(xsel.getExporter().getVariableName());
							if(i != null)
								for(String val : xsel.getExporter().getSelectedValues(array[i]))
									line.addField(val);
						}
					}
					else {
						line.addField(null);
					}
				}
			}
		}
		catch(IllegalAccessException e){
			return "";
		}
		return line.toString() +"\n";
    }

    private ScrollableQueryResult getQueryResult(Query query, QueryStatement statement) throws SQLException, OutOfMemoryError {
		String qstr = query.getQueryString();
		System.err.println(qstr);
		return statement.executeScrollableQuery(qstr, query.getPreparedParameters());
    }
    
    private String getHeaderLine(List<Selection> selections, List<String> columnNames) {
    	variablePositions.clear();
    	
        CsvLine line = new CsvLine();
        for (int i = 0 ; i < selections.size(); i++) {
        	Selection sel = selections.get(i);
        	if (!(sel instanceof TableSelection)) {
        		line.addField(columnNames.get(i));
        		if(sel instanceof ExporterSelection)
        			for(String s : ((ExporterSelection)sel).getExporter().getSelectedColumns())
        				line.addField(s);
        	}
        	else{
        		TableSelection tsel = (TableSelection)selections.get(i);
        		variablePositions.put(tsel.getVariableName(),i);
        	}
        }   
        return line.toString() + "\n";
    }
    
	/** 
	 * Decomposed the composed selection in the given selection status list
     * into their components and puts all the simple selections in a list
     */
    private List<Selection> getFlatSelectionList(SelectionStatusList list) {
		List<Selection> selections = new ArrayList<Selection>();
		for (Selection sel : list.getSelections()) {
			if (sel.isSelected()) {
				selections.add(sel);
			}
			if (sel instanceof TableSelection) {
				for (Selection subSel : sel.getSubSelections()) {
					if (subSel.isSelected()) {
						selections.add(subSel);
					}
				}
			}
		}
		return selections;
	}
    
    /**
     * create a copy of the given {@link SelectionStatusList} where
     * all tables are selected
     * @param list
     * @return
     */
    private SelectionStatusList createSelectionList(SelectionStatusList list) {
		SelectionStatusList selectList = new SelectionStatusList();
    	
		for (Selection  sel : list.getSelections()) {
			Selection clone = null;
			if (sel instanceof TableSelection) {
				clone = new TableSelection((OutputVariable) sel.getObjectSpec(), true);
				
				if (sel.isSelected()) {
					List<Selection> subSelections = new ArrayList<Selection>();
					List<Selection> origSubSelections = new ArrayList<Selection>();
					subSelections.addAll(clone.getSubSelections());
					origSubSelections.addAll(sel.getSubSelections());
					
					
					boolean selected = false;
					for (int i = 0 ; i < origSubSelections.size() ; i++) {
						selected = origSubSelections.get(i).isSelected() || selected;
						subSelections.get(i).setSelected(origSubSelections.get(i).isSelected());
					}
					
//					// select the clone if one of the children is selected
//					if (selected) {
//						clone.setSelected(true);
//					}
				}
				else{
					clone.getSubSelections().clear();
				}
			}
			else if (sel instanceof OutputSelection || sel instanceof ExporterSelection) {
				OutputVariable ovar = (OutputVariable) sel.getObjectSpec();
				TableSelection outputTable = getTableSelectionFromOutputVariable(ovar);
				if (outputTable != null && sel.isSelected()) {
					selectList.getSelections().add(outputTable);
				}
				if(sel instanceof ExporterSelection){
					clone = new ExporterSelection(ovar, sel.isSelected());
					((ExporterSelection)clone).setExporter(((ExporterSelection)sel).getExporter());
				}
				else
					clone = new OutputSelection(ovar, sel.isSelected());
			}
			
			if (clone != null) {
				selectList.getSelections().add(clone);
			}
		}
		return selectList;
    }
    
    
    /**
     * finds the table that is the base of this outputvariable
     * and return a selection of this table
     * @param ovar
     * @return
     */
    private TableSelection getTableSelectionFromOutputVariable(OutputVariable ovar) {
		ConfigurableWord firstWord = ovar.getExpression().getWords().get(0);
		TableSelection outputTable = null;
		if (firstWord instanceof FromVariable) {
			OutputVariable newOvar = new OutputVariable(ovar.getObject());
			newOvar.getExpression().addFromVariable((FromVariable) firstWord);
			outputTable = new TableSelection(newOvar, ((FromVariable) firstWord).getObject());
			outputTable.setSelected(true);
		}
		else if (firstWord instanceof InputVariable) {
			outputTable = getTableSelectionFromOutputVariable(((InputVariable) firstWord).getOutputVariable());
		}
		else if (firstWord instanceof OutputVariable) {
			outputTable = getTableSelectionFromOutputVariable((OutputVariable) firstWord);
		}
		return outputTable;
    }  
    
    public void cancel() {
    	synchronized (mutex) {
        	if (status == Status.RUNNING) {
        		status = Status.CANCELED;
        		statement.cancel();
        	}
		}
    }

	public boolean isRunning() {
		return status == Status.RUNNING;
	}
	
	public boolean isPostprocessing() {
		return postProcessing;
	}

	public int getFastaEntries() {
		return numberFastaEntries;
	}
}
