package net.sf.regadb.ui.form.query;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.regadb.db.QueryDefinition;
import net.sf.regadb.db.QueryDefinitionRun;
import net.sf.regadb.db.QueryDefinitionRunStatus;
import net.sf.regadb.db.Transaction;
import net.sf.regadb.ui.framework.RegaDBMain;
import net.sf.regadb.ui.framework.forms.InteractionState;
import net.sf.regadb.ui.framework.forms.ObjectForm;
import net.sf.regadb.ui.framework.forms.fields.Label;
import net.sf.regadb.ui.framework.forms.fields.TextArea;
import net.sf.regadb.ui.framework.forms.fields.TextField;
import net.sf.regadb.ui.framework.widgets.UIUtils;
import net.sf.regadb.ui.framework.widgets.formtable.FormTable;
import net.sf.regadb.ui.tree.ObjectTreeNode;
import net.sf.regadb.util.settings.RegaDBSettings;

import org.apache.commons.io.FileUtils;

import eu.webtoolkit.jwt.WAnchor;
import eu.webtoolkit.jwt.WFileResource;
import eu.webtoolkit.jwt.WGroupBox;
import eu.webtoolkit.jwt.WString;

public class QueryDefinitionRunForm extends ObjectForm<QueryDefinitionRun>
{
    private WGroupBox queryDefinitionRunGroup_;
    private FormTable queryDefinitionRunGroupTable;
    
    private QueryDefinitionRunParameterGroupBox queryDefinitionRunParameterGroup;
    
    private Label nameL;
    private TextField nameTF;
    private Label queryNameL;
    private TextField queryNameTF;
    private Label descriptionL;
    private TextArea descriptionTA;
    private Label queryL;
    private TextArea queryTA;
    private Label startDateL;
    private TextField startDateDF;
    private Label endDateL;
    private TextField endDateDF;
    private Label statusL;
    private TextField statusTF;
    private Label resultL;
    private WAnchor resultLink;
    
    private QueryDefinition queryDefinition = null;
    
    private static DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
    
    public QueryDefinitionRunForm(WString formName, InteractionState interactionState,
    		ObjectTreeNode<QueryDefinitionRun> node, QueryDefinitionRun queryDefinitionRun)
    {
        super(formName, interactionState, node, queryDefinitionRun);
        init();
        fillData();
        
        addControlButtons();
    }
    
    public QueryDefinitionRunForm(WString formName, ObjectTreeNode<QueryDefinitionRun> node, QueryDefinition queryDefinition)
    {
        super(formName, InteractionState.Adding, node, new QueryDefinitionRun());
        this.queryDefinition = queryDefinition;
        init();
        fillData();
        
        addControlButtons();
    }
    
    public void init()
    {
    	if(getInteractionState() == InteractionState.Adding)
        {
        	getObject().setQueryDefinition(queryDefinition);
        }
    	
    	queryDefinitionRunGroup_ = new WGroupBox(tr("form.query.definition.run.general"), this);
    	
    	queryDefinitionRunGroupTable = new FormTable(queryDefinitionRunGroup_);
    	
    	nameL = new Label(tr("form.query.definition.run.label.name"));
    	nameTF = new TextField(getInteractionState(), this);
    	nameTF.setMandatory(true);
    	queryDefinitionRunGroupTable.addLineToTable(nameL, nameTF);
    	
    	queryNameL = new Label(tr("form.query.definition.run.label.query"));
    	queryNameTF = new TextField(InteractionState.Viewing, this);
    	queryDefinitionRunGroupTable.addLineToTable(queryNameL, queryNameTF);
        
        descriptionL = new Label(tr("form.query.definition.run.label.description"));
        descriptionTA = new TextArea(InteractionState.Viewing, this);
        queryDefinitionRunGroupTable.addLineToTable(descriptionL, descriptionTA);
        
        queryL = new Label(tr("form.query.definition.label.query"));
        queryTA = new TextArea(InteractionState.Viewing, this);
        queryDefinitionRunGroupTable.addLineToTable(queryL, queryTA);
        
        if(getInteractionState() == InteractionState.Viewing || getInteractionState() == InteractionState.Deleting)
        {
        	startDateL = new Label(tr("form.query.definition.run.label.startTime"));
            startDateDF = new TextField(getInteractionState(), this);
            queryDefinitionRunGroupTable.addLineToTable(startDateL, startDateDF);
            
            endDateL = new Label(tr("form.query.definition.run.label.endTime"));
            endDateDF = new TextField(getInteractionState(), this);
            queryDefinitionRunGroupTable.addLineToTable(endDateL, endDateDF);
            
            statusL = new Label(tr("form.query.definition.run.label.status"));
            statusTF = new TextField(getInteractionState(), this);
            queryDefinitionRunGroupTable.addLineToTable(statusL, statusTF);
        }
        
        queryDefinitionRunParameterGroup = new QueryDefinitionRunParameterGroupBox(getInteractionState(), tr("form.query.definition.run.parameters"), this);
    }
    
    private void fillData()
    {
    	Transaction t = RegaDBMain.getApp().getLogin().createTransaction();
    	
    	nameTF.setText(getObject().getName());
    	queryNameTF.setText(getObject().getQueryDefinition().getName());
        descriptionTA.setText(getObject().getQueryDefinition().getDescription());
        queryTA.setText(getObject().getQueryDefinition().getQuery());
        
        if(getInteractionState() == InteractionState.Viewing || getInteractionState() == InteractionState.Deleting)
        {
        	startDateDF.setText(formatter.format(getObject().getStartdate()));
        	
        	if(getObject().getEnddate() != null)
        	{
        		endDateDF.setText(formatter.format(getObject().getEnddate()));
        	}
        	
        	statusTF.setText(QueryDefinitionRunStatus.getQueryDefinitionRunStatus(getObject()).toString());
        	
        	int row = queryDefinitionRunGroupTable.getRowCount();
            
            resultL = new Label(tr("form.query.definition.run.label.result"));
            queryDefinitionRunGroupTable.putElementAt(row, 0, resultL);
            
            if(getObject().getStatus() != QueryDefinitionRunStatus.Running.getValue())
            {
                WFileResource res = new WFileResource("application/excel", RegaDBSettings.getInstance().getInstituteConfig().getQueryResultDir().getAbsolutePath() + File.separatorChar + getObject().getResult(), null);
                res.suggestFileName("result.csv");
            	resultLink = new WAnchor(res, getObject().getResult(), queryDefinitionRunGroupTable.getElementAt(row, 1));
                resultLink.setStyleClass("link");
            }
        }
        
        t.commit();
    }
    
    @Override
	public void saveData()
	{
        Map<String, Object> paramObjects = new HashMap<String, Object>();
        
    	if(queryDefinitionRunParameterGroup.saveData(paramObjects))
    	{
    		Transaction t = RegaDBMain.getApp().getLogin().createTransaction();
        	
    		getObject().setName(nameTF.getFormText());
    		getObject().setSettingsUser(t.getSettingsUser(RegaDBMain.getApp().getLogin().getUid()));
    		getObject().setStatus(0);
    		getObject().setStartdate(new Date(System.currentTimeMillis()));
        	
    		getObject().setQueryDefinitionRunParameters(queryDefinitionRunParameterGroup.getQueryDefinitionRunParameters());
    		
        	update(getObject(), t);
        	
        	t.commit();
        	
        	QueryThread qt = new QueryThread(RegaDBMain.getApp().getLogin().copyLogin(), getObject(), paramObjects);
        	
        	qt.startQueryThread();
    	}
    	else
    	{
    		UIUtils.showWarningMessageBox(this, tr("form.query.definition.run.validate.parameters.null"));
    	}
	}

	@Override
	public void cancel()
	{
	}

	@Override
	public WString deleteObject()
	{
		Transaction t = RegaDBMain.getApp().getLogin().createTransaction();
        
		if(getObject().getStatus() == QueryDefinitionRunStatus.Running.getValue())
		{
			QueryThread.stopQueryThread(getObject().getResult());
		}
        
        t.delete(getObject());
        
        t.commit();
                
        try
        {
			FileUtils.forceDelete(new File(RegaDBSettings.getInstance().getInstituteConfig().getQueryResultDir().getAbsolutePath() + File.separatorChar + getObject().getResult()));
		}
        catch (IOException e)
        {
			e.printStackTrace();
		}
        
        return null;
	}
}
