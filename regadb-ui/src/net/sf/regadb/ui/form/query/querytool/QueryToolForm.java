package net.sf.regadb.ui.form.query.querytool;



import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import net.sf.regadb.db.QueryDefinition;
import net.sf.regadb.db.Transaction;
import net.sf.regadb.io.util.StandardObjects;
import net.sf.regadb.ui.form.query.querytool.buttons.EditButtonPanel;
import net.sf.regadb.ui.form.query.querytool.fasta.FastaExportContainer;
import net.sf.regadb.ui.form.query.querytool.select.SelectionListContainer;
import net.sf.regadb.ui.form.query.querytool.tree.QueryEditorTreeContainer;
import net.sf.regadb.ui.form.query.querytool.tree.QueryStatusBar;
import net.sf.regadb.ui.form.query.querytool.widgets.WTabbedPane;
import net.sf.regadb.ui.framework.RegaDBMain;
import net.sf.regadb.ui.framework.forms.InteractionState;
import net.sf.regadb.ui.framework.forms.ObjectForm;
import net.sf.regadb.ui.tree.ObjectTreeNode;

import com.pharmadm.custom.rega.queryeditor.QueryContext;
import com.pharmadm.custom.rega.queryeditor.QueryEditorComponent;
import com.pharmadm.custom.rega.savable.Savable;

import eu.webtoolkit.jwt.WGroupBox;
import eu.webtoolkit.jwt.WString;

public class QueryToolForm extends ObjectForm<QueryDefinition> implements QueryToolApp{
	public Map<String, GSSExporter> exporters = new HashMap<String, GSSExporter>();

	private WTabbedPane tabs;
	private QueryEditorTreeContainer queryTreeTab;
	private SelectionListContainer selectionTab;
	private FastaExportContainer fastaExportTab;
	private InfoContainer infoTab;

	private WGroupBox queryGroup_;
	private RunGroupBox runGroup_;
	private QueryStatusBar statusbar;
	
	private Savable queryLoader;
    
	// is edit mode on
	private boolean editable;
	
	// true when controls are enabled
	private boolean controlsEnabled;
    
	
	public QueryToolForm(WString title, InteractionState istate, ObjectTreeNode<QueryDefinition> node) {
		this(title, istate, node, new QueryDefinition(StandardObjects.getQueryToolQueryType()));
	}
    
	public QueryToolForm(WString  title, InteractionState istate, ObjectTreeNode<QueryDefinition> node, QueryDefinition query) {
		super(title, istate, node, query == null ? new QueryDefinition(StandardObjects.getQueryToolQueryType()) : query);
		init();
	}
	
    public WString  leaveForm() {
        if(isEditable() && queryTreeTab.getQueryEditor().isDirty()) {
            return tr("form.warning.stillEditing");
        } else if(runGroup_.isQueryRunning()){
        	return tr("form.query.querytool.message.stillRunning");
        } else{
            return null;
        }
    }	
    
	private void init() {
		setStyleClass("querytoolform");
		controlsEnabled = true;
		

		queryTreeTab = new QueryEditorTreeContainer(this);
		if (isEditable()) {
			queryTreeTab.setToolbar(new EditButtonPanel(queryTreeTab));
		}
		selectionTab  =	new SelectionListContainer(this);
		fastaExportTab = new FastaExportContainer(this);
        infoTab = new InfoContainer(this, this);
        statusbar = new QueryStatusBar(this);

        queryGroup_ = new WGroupBox(tr("form.query.querytool.group.query"), this);
        tabs = new WTabbedPane(queryGroup_);
        tabs.addTab(tr("form.query.querytool.group.query"), queryTreeTab);
        tabs.addTab(tr("form.query.querytool.group.fields"), selectionTab);
        tabs.addTab(tr("form.query.querytool.group.fastaExport"), fastaExportTab);
        tabs.addTab(tr("form.query.querytool.group.info"), infoTab);
        tabs.setStatusBar(statusbar);
        
		runGroup_ = new RunGroupBox(this, queryTreeTab.getQueryEditor(), this);
        
		addControlButtons();
		
		queryLoader = new QueryLoader(this, infoTab, queryTreeTab);
		try {
			queryLoader.load(getObject());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		setQueryEditable(isEditable());
	}
	
	
	public boolean isQueryEditable() {
		return editable;
	}
	
	public void setQueryEditable(boolean enabled) {
		this.editable = enabled;
		updateControls();
		
	}
	
	public FastaExportContainer getFastaExportTab() {
		return fastaExportTab;
	}

	/**
	 * update controls to reflect editability
	 */
	public void updateControls() {
		boolean editable = isQueryEditable() && getSavable().isLoaded();
		if (editable != controlsEnabled) {
			queryTreeTab.setEditable(editable);
			controlsEnabled = editable;
		}
		queryTreeTab.updateSelection();
		statusbar.update();
	}
	
	public QueryEditorComponent getEditorModel() {
		return queryTreeTab;
	}
	
	public QueryContext getQueryContext() {
		return queryTreeTab;
	}
	
	public Savable getSavable() {
		return queryLoader;
	}	
	
	public void runQuery() {
		runGroup_.runQuery();
	}
	
	
	
	
	
	public void confirmAction() {
		super.confirmAction();
        if(!infoTab.isValid()) {
        	tabs.showTab(infoTab);
        }
	}
	
	public void cancel() {
	}

	public WString  deleteObject() {
		Transaction t = RegaDBMain.getApp().getLogin().createTransaction();
        t.delete(getObject());
        t.commit();
        
        return null;
	}

	public void saveData() {
		try {
			Transaction t = RegaDBMain.getApp().getLogin().createTransaction();
			queryLoader.save(getObject());
			getObject().setSettingsUser(t.getSettingsUser(RegaDBMain.getApp().getLogin().getUid()));
	    	update(getObject(), t);
	    	t.commit();
		} catch (IOException e) {}
	}
	
	public void addReportTab(ReportContainer report) {
		tabs.addTab(tr("form.query.querytool.group.report"), report);
		tabs.showTab(report);
	}
}
