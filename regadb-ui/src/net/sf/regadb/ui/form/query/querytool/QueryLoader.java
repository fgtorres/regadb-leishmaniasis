package net.sf.regadb.ui.form.query.querytool;

import java.io.IOException;

import net.sf.regadb.db.QueryDefinition;
import net.sf.regadb.io.export.fasta.FastaExporter;
import net.sf.regadb.ui.framework.forms.fields.FileUpload.FileBlob;

import com.pharmadm.custom.rega.queryeditor.Query;
import com.pharmadm.custom.rega.queryeditor.QueryEditorComponent;
import com.pharmadm.custom.rega.savable.DirtinessListener;
import com.pharmadm.custom.rega.savable.Savable;
import com.thoughtworks.xstream.XStream;

public class QueryLoader implements Savable {

	private QueryToolForm mainForm;
	private InfoContainer infoContainer;
	private QueryEditorComponent comp;
	
	// is query loaded
	private boolean queryLoaded;
	
	public QueryLoader(QueryToolForm form, InfoContainer infoContainer, QueryEditorComponent editor) {
		this.infoContainer = infoContainer;
		mainForm = form;
		this.comp = editor;
	}
	
	public void addDirtinessListener(DirtinessListener listener) {
		mainForm.getEditorModel().getQueryEditor().addDirtinessListener(listener);

	}

	public boolean isDirty() {
		return mainForm.getEditorModel().getQueryEditor().isDirty();
	}

	public void load(Object file) throws IOException {
		comp.setQuery(loadQuery((QueryDefinition) file));

	}

	public void save(Object file) throws IOException {
		saveData((QueryDefinition) file);

	}
	
	private void saveData(QueryDefinition definition) {
    	definition.setName(infoContainer.getName());
    	definition.setDescription(infoContainer.getDescription());
    	FileBlob blob = infoContainer.getPostProcessingScript();
    	if (blob != null) {
    		definition.setPostProcessingScript(blob.saveBlob());
    	}
    	if (mainForm.getSavable().isLoaded()) {
    		mainForm.getEditorModel().getQueryEditor().getQuery().setFastaExport(mainForm.getFastaExportTab().getFastaExporter());
    		definition.setQuery(new XStream().toXML(mainForm.getEditorModel().getQueryEditor().getQuery()));
    	}
	}
	
	private Query loadQuery(QueryDefinition def) {
		queryLoaded = true;
		if (def.getQuery() == null) {
			return new Query();
		}
		else {
			try {
				infoContainer.setName(def.getName());
				infoContainer.setDescription(def.getDescription());
				infoContainer.setUser(def.getSettingsUser().getUid());
				
				byte[] script = def.getPostProcessingScript();
				if (script != null) {
					infoContainer.setPostProcessingScript(FileBlob.loadBlob(script));
				}
					
		    	XStream xs = new XStream();
		    	xs.alias("net.sf.regadb.tools.exportFasta.FastaExporter$FastaId", FastaExporter.FastaId.class);
		    	Query query = (Query) xs.fromXML(def.getQuery());
		    	queryLoaded = checkQueryValidity(query);
		    	return query;
			}
			catch (Throwable t) {
				t.printStackTrace();
				queryLoaded = false;
				return new Query();
			}
		}
	}
	
	private boolean checkQueryValidity(Query query) {
		boolean result = query.getSelectList().isValid();
		return result;
	}
	
	public boolean isLoaded() {
		return queryLoaded;
	}
}
