package net.sf.regadb.ui.tree.items.singlePatient;

import net.sf.regadb.db.Patient;
import net.sf.regadb.db.Privileges;
import net.sf.regadb.db.SettingsUser;
import net.sf.regadb.db.Transaction;
import net.sf.regadb.db.UserAttribute;
import net.sf.regadb.ui.datatable.patient.SelectPatientForm;
import net.sf.regadb.ui.form.singlePatient.SinglePatientForm;
import net.sf.regadb.ui.form.singlePatient.chart.PatientChartForm;
import net.sf.regadb.ui.form.singlePatient.custom.Nadir;
import net.sf.regadb.ui.form.singlePatient.reports.GeneralReport;
import net.sf.regadb.ui.framework.RegaDBMain;
import net.sf.regadb.ui.framework.forms.IForm;
import net.sf.regadb.ui.framework.forms.InteractionState;
import net.sf.regadb.ui.framework.forms.ObjectForm;
import net.sf.regadb.ui.framework.tree.TreeMenuNode;
import net.sf.regadb.ui.tree.DefaultNavigationNode;
import net.sf.regadb.ui.tree.FormNavigationNode;
import net.sf.regadb.ui.tree.ObjectTreeNode;
import net.sf.regadb.ui.tree.items.custom.ContactItem;
import net.sf.regadb.ui.tree.items.custom.MultipleTestResultsItem;
import net.sf.regadb.util.settings.ContactFormConfig;
import net.sf.regadb.util.settings.RegaDBSettings;
import eu.webtoolkit.jwt.WString;

public class PatientTreeNode extends ObjectTreeNode<Patient>{
	private FormNavigationNode chart;
	private TestResultTreeNode testResult;
	private TherapyTreeNode therapy;
	private ViralIsolateTreeNode viralIsolate;
	private PatientEventTreeNode event;
	
	private DefaultNavigationNode custom;
	private ContactItem contact;
	private FormNavigationNode nadir;

	//Reports
	private DefaultNavigationNode reports;
	private FormNavigationNode reportgeneral;
	
	public PatientTreeNode(TreeMenuNode parent) {
		super("patient", parent);
	}
	
	protected void init(){
		super.init();
		
		chart = new FormNavigationNode(getMenuResource("chart"), getSelectedItemNavigationNode(), true){
			@Override
			public IForm createForm() {
				int width = 560;
				int height = 400;
				
				SettingsUser su = RegaDBMain.getApp().getSettingsUser();
				if (su != null) {
			        for(UserAttribute ua : su.getUserAttributes()) {
			            if("chart.width".equals(ua.getName()) && ua.getValue()!=null && !ua.getValue().equals(""))
			            	width = Integer.parseInt(ua.getValue());
			            else if("chart.height".equals(ua.getName()) && ua.getValue()!=null && !ua.getValue().equals(""))
			                height = Integer.parseInt(ua.getValue());
			        }
				}
				return new PatientChartForm(getSelectedItem(), width, height);
			}
		};
		
		testResult = new TestResultTreeNode(getSelectedItemNavigationNode());
		therapy = new TherapyTreeNode(getSelectedItemNavigationNode());
		viralIsolate = new ViralIsolateTreeNode(getSelectedItemNavigationNode());
		event = new PatientEventTreeNode(getSelectedItemNavigationNode());
		
		//Reports
		reports = new DefaultNavigationNode(tr("menu.patient.reports"), getSelectedItemNavigationNode());
		reportgeneral = new FormNavigationNode(tr("menu.patient.reports.general"), reports, true){
			@Override
			public IForm createForm() {
				return new GeneralReport(getSelectedItem());
			}
		};
				
		custom = new DefaultNavigationNode(getMenuResource("custom"), getSelectedItemNavigationNode());
		contact = new ContactItem(custom, RegaDBSettings.getInstance().getInstituteConfig().getContactFormConfig());	
		
		for (ContactFormConfig ccf : RegaDBSettings.getInstance().getInstituteConfig().getMultipleTestResultForms()) {
			new MultipleTestResultsItem(custom, ccf);
		}
		
		nadir = new FormNavigationNode(getMenuResource("custom.nadir"), custom, true){
			public IForm createForm() 
			{
				return new Nadir();
			}
		};
	}
	
	public FormNavigationNode getChartNode(){
		return chart;
	}
	public TestResultTreeNode getTestResultTreeNode(){
		return testResult;
	}
	public TherapyTreeNode getTherapyTreeNode(){
		return therapy;
	}
	public ViralIsolateTreeNode getViralIsolateTreeNode(){
		return viralIsolate;
	}
	public PatientEventTreeNode getEventTreeNode(){
		return event;
	}
	public DefaultNavigationNode getCustomNode(){
		return custom;
	}
	public ContactItem getContactItem(){
		return contact;
	}

	protected Patient getObjectById(Transaction t, String id){
		return t.getPatient(Integer.parseInt(id));
	}
	
	protected String getObjectId(Patient object){
		return object.getPatientIi() +"";
	}
	
    @Override
    public String getArgument(Patient type) 
    {
         return type.getPatientId();
    }

	@Override
	public boolean isDisabled()
	{
		return RegaDBMain.getApp().getLogin()==null;
	}
	
    @Override
    public void setSelectedItem(Patient item){
    	Patient prev = getSelectedItem();
    	if(item != prev){
	    	super.setSelectedItem(item);
	    	
	    	if(item != null){
		    	Privileges priv = RegaDBMain.getApp().getPrivilege(item.getSourceDataset());
		    	applyPrivileges(priv);
		    	testResult.applyPrivileges(priv);
		    	therapy.applyPrivileges(priv);
		    	viralIsolate.applyPrivileges(priv);
		    	event.applyPrivileges(priv);
		    	
		    	testResult.setSelectedItem(null);
		    	therapy.setSelectedItem(null);
		    	viralIsolate.setSelectedItem(null);
		    	event.setSelectedItem(null);
		    	
		    	boolean disabled = item.getViralIsolates().size()<2;
				viralIsolate.getEvolutionNode().setDisabled(disabled);
				viralIsolate.getCumulatedResistanceNode().setDisabled(disabled);
	    	}
    	}
    }
    
    @Override
    public void applyPrivileges(Privileges priv){
    	super.applyPrivileges(priv);
    	getAddNavigationNode().enable();
    	
    	boolean disabled = priv != Privileges.READWRITE;
    	getContactItem().addContact.setDisabled(disabled);
    }

	@Override
	protected ObjectForm<Patient> createForm(WString name, InteractionState interactionState, Patient selectedObject) {
		if(interactionState == InteractionState.Adding)
			selectedObject = new Patient();
			
		return new SinglePatientForm(name, interactionState, PatientTreeNode.this, selectedObject);
	}

	@Override
	protected IForm createSelectionForm() {
		return new SelectPatientForm(this);
	}
}
