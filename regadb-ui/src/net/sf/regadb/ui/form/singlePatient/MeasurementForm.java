package net.sf.regadb.ui.form.singlePatient;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import net.sf.regadb.db.Patient;
import net.sf.regadb.db.Test;
import net.sf.regadb.db.TestNominalValue;
import net.sf.regadb.db.TestResult;
import net.sf.regadb.db.TestType;
import net.sf.regadb.db.Transaction;
import net.sf.regadb.db.ValueType;
import net.sf.regadb.db.ValueTypes;
import net.sf.regadb.ui.framework.RegaDBMain;
import net.sf.regadb.ui.framework.forms.InteractionState;
import net.sf.regadb.ui.framework.forms.ObjectForm;
import net.sf.regadb.ui.framework.forms.fields.ComboBox;
import net.sf.regadb.ui.framework.forms.fields.DateField;
import net.sf.regadb.ui.framework.forms.fields.IFormField;
import net.sf.regadb.ui.framework.forms.fields.IFormTextField;
import net.sf.regadb.ui.framework.forms.fields.ImageField;
import net.sf.regadb.ui.framework.forms.fields.Label;
import net.sf.regadb.ui.framework.forms.fields.TestComboBox;
import net.sf.regadb.ui.framework.forms.fields.TestTypeComboBox;
import net.sf.regadb.ui.framework.forms.fields.TextField;
import net.sf.regadb.ui.framework.widgets.formtable.FormTable;
import net.sf.regadb.ui.tree.ObjectTreeNode;
import net.sf.regadb.ui.utils.Utils;
import net.sf.regadb.util.date.DateUtils;
import net.sf.regadb.util.settings.RegaDBSettings;
import eu.webtoolkit.jwt.Signal;
import eu.webtoolkit.jwt.TextFormat;
import eu.webtoolkit.jwt.WAnchor;
import eu.webtoolkit.jwt.WContainerWidget;
import eu.webtoolkit.jwt.WFileResource;
import eu.webtoolkit.jwt.WGroupBox;
import eu.webtoolkit.jwt.WImage;
import eu.webtoolkit.jwt.WLength;
import eu.webtoolkit.jwt.WString;
import eu.webtoolkit.jwt.WText;
import eu.webtoolkit.jwt.servlet.UploadedFile;

public class MeasurementForm extends ObjectForm<TestResult>
{
	//General group
    private WGroupBox generalGroup_;
    private FormTable generalGroupTable_;
    private Label sampleIdL_;
    private TextField sampleIdTF_;
    private Label dateL;
    private DateField dateTF;
    private Label testTypeL;
    private TestTypeComboBox testTypeCB;
    private Label testNameL;
    private TestComboBox testNameCB;
    private Label testResultL;
    private IFormField testResultField_;
    private WContainerWidget testResultC;
    
	public MeasurementForm(WString formName, InteractionState interactionState, ObjectTreeNode<TestResult> node, TestResult testResult)
	{
		super(formName, interactionState, node, testResult);
		if(RegaDBMain.getApp().isPatientInteractionAllowed(interactionState))
			init();
	}
	
	public void init()
	{
        //general group
        generalGroup_ = new WGroupBox(tr("form.testResult.editView.general"), this);
        generalGroupTable_ = new FormTable(generalGroup_);
        sampleIdL_ = new Label(tr("form.testResult.editView.sampleid"));
        sampleIdTF_ = new TextField(getInteractionState(), this);
        generalGroupTable_.addLineToTable(sampleIdL_, sampleIdTF_);
        dateL = new Label(tr("form.testResult.editView.date"));
        dateTF = new DateField(getInteractionState(), this, RegaDBSettings.getInstance().getDateFormat());
        generalGroupTable_.addLineToTable(dateL, dateTF);
        testTypeL = new Label(tr("form.testResult.editView.testType"));
        testTypeCB = new TestTypeComboBox(getInteractionState(), this);

        testTypeCB.setMandatory(true);
        generalGroupTable_.addLineToTable(testTypeL, testTypeCB);
        testNameL = new Label(tr("form.testResult.editView.testName"));
        testNameCB = new TestComboBox(getInteractionState(), this);
        testNameCB.setMandatory(true);
        generalGroupTable_.addLineToTable(testNameL, testNameCB);
        testResultL = new Label(tr("form.testResult.editView.testResult"));
        testResultL.setLabelUIMandatory(this);
        testResultC = new WContainerWidget();
        int row = generalGroupTable_.getRowCount();
        generalGroupTable_.putElementAt(row, 0, testResultL);
        generalGroupTable_.putElementAt(row, 1, testResultC);
        generalGroupTable_.getElementAt(row,0).setStyleClass("form-label-area");
        
        //set the comboboxes
        if(getInteractionState() != InteractionState.Viewing){
	        Transaction t = RegaDBMain.getApp().createTransaction();
	        testTypeCB.fill(t, true, RegaDBSettings.getInstance().getInstituteConfig().getOrganismFilter());
	        testTypeCB.selectIndex(0);
	        
	        testNameCB.fill(t, testTypeCB.currentValue());
	
	        t.commit();
        }
        
        fillData();
        
        addControlButtons();
	}
	
	private void fillData()
	{
		TestType type = null;
		if(getInteractionState() != InteractionState.Adding) {
			type = getObject().getTest().getTestType();
		}
		if(getInteractionState() == InteractionState.Editing
				|| getInteractionState() == InteractionState.Adding)
		{
			if(getInteractionState() == InteractionState.Editing){
				Transaction t = RegaDBMain.getApp().createTransaction();
				setTestCombo(t, type);
				t.commit();
				
				testTypeCB.selectItem(type);
				testNameCB.selectItem(getObject().getTest());
				
	            setResultField(type.getValueType(), type);
	            
	            if(testResultField_ instanceof ComboBox)
	            {
	                ((ComboBox)testResultField_).selectItem(getObject().getTestNominalValue().getValue());
	            } else if(ValueTypes.getValueType(type.getValueType()) == ValueTypes.IMAGE) {
	            	File image = new File(RegaDBSettings.getInstance().getInstituteConfig().getFilesStoreDir().getAbsolutePath()
							 + File.separatorChar + getObject().getValue());
	            	
	            	String filetype = "";
	            	if(getObject().getValue().contains(".")){
	            		filetype = getObject().getValue().substring(getObject().getValue().lastIndexOf("."), 
	            				getObject().getValue().length());
	            	}
	            	
					WFileResource res = new WFileResource(filetype,image.getAbsolutePath());
	            	((ImageField) testResultField_).setImage(res);
	            	((ImageField) testResultField_).setMaximumSize(new WLength(400), new WLength(400));
					((ImageField) testResultField_).getWImage().setMaximumSize(
							new WLength(400), 
							new WLength(400)
							);
	            } else if(ValueTypes.getValueType(type.getValueType()) == ValueTypes.DATE)
	            {
	            	((DateField) testResultField_).setDate(DateUtils.parseDate(getObject().getValue()));
	            }
	            else
	            {
	                ((IFormTextField)testResultField_).setText(getObject().getValue());
	            }
			}
			else{
	            setResultField(testTypeCB.currentValue().getValueType(), testTypeCB.currentValue());
			}
			
	        testTypeCB.addComboChangeListener(new Signal.Listener()
            {
    			public void trigger()
    			{
                    TestType testType = testTypeCB.currentValue();
                    
    				Transaction t = RegaDBMain.getApp().createTransaction();
    				setTestCombo(t, testType);
    				t.commit();
                    
                    setResultField(testType.getValueType(), testType);
    			}
            });
		}
		else{
			testTypeCB.setText(
					TestTypeComboBox.getLabel(getObject().getTest().getTestType()));
			testNameCB.setText(
					TestComboBox.getLabel(getObject().getTest()));
			
			if(ValueTypes.getValueType(type.getValueType()) == ValueTypes.IMAGE) {
				String path = RegaDBSettings.getInstance().getInstituteConfig().getFilesStoreDir().getPath();
								
				File image = new File(RegaDBSettings.getInstance().getInstituteConfig().getFilesStoreDir().getAbsolutePath()
						 + File.separatorChar + getObject().getValue());
				
				String typefile = "";
				
				if(getObject().getValue().contains(".")){
					typefile = getObject().getValue().substring(getObject().getValue().lastIndexOf("."));
				}
				
				WFileResource res = new WFileResource(typefile, image.getAbsolutePath());
				WImage wImage = new WImage(res.generateUrl(),	
						testResultC);
				wImage.setMaximumSize(
						new WLength(400), 
						new WLength(400)
						);
			} else {
				new WText(	getObject().getTestNominalValue() == null ?
								getObject().getValue() : getObject().getTestNominalValue().getValue(),
							TextFormat.PlainText,
							testResultC);
			}
		}
        
		if(getInteractionState() != InteractionState.Adding){
	        dateTF.setDate(getObject().getTestDate());
            sampleIdTF_.setText(getObject().getSampleId());
		}
	}
	
	private void setTestCombo(Transaction t, TestType testType)
	{
		testNameCB.clearItems();
		testNameCB.fill(t, testType);
        testNameCB.selectIndex(0);
	}
    
    private void setResultField(ValueType valueType, TestType type)
    {
        removeFormField(testResultField_);
        if(ValueTypes.getValueType(valueType) == ValueTypes.NOMINAL_VALUE)
        {
            testResultField_ = new ComboBox(getInteractionState(), this);
            for(TestNominalValue tnv : type.getTestNominalValues())
            {
                ((ComboBox)testResultField_).addItem(new DataComboMessage<TestNominalValue>(tnv, tnv.getValue()));
            }
            ((ComboBox)testResultField_).sort();
        } else if(ValueTypes.getValueType(valueType) == ValueTypes.IMAGE){
        	testResultField_ = new ImageField(getInteractionState(), this);
        	Patient p = RegaDBMain.getApp().getTree().getTreeContent().patientTreeNode.getSelectedItem();
        	((ImageField)testResultField_).setFileName(Utils.generateFilename(p.getPatientId()));
        	((ImageField)testResultField_).setMaximumSize(new WLength(400), new WLength(400));
        } else
        {
            testResultField_ = getTextField(ValueTypes.getValueType(valueType));
        }
        testResultField_.setMandatory(true);
        testResultC.clear();
        testResultC.addWidget(testResultField_.getWidget());
    }

	@Override
	public void saveData()
	{
		Transaction t = RegaDBMain.getApp().createTransaction();
		
		Patient p = RegaDBMain.getApp().getTree().getTreeContent().patientTreeNode.getSelectedItem();
		t.attach(p);
		
		Test test = testNameCB.currentValue();
		
		if(getInteractionState()==InteractionState.Adding)
		{
			setObject(p.createTestResult(test));
		}
		else
		{
			getObject().setTest(test);
		}
		
		getObject().setTestDate(dateTF.getDate());
		getObject().setSampleId(sampleIdTF_.text());
		getObject().setTestNominalValue(null);
		
		if(testResultField_ instanceof ComboBox)
		{
			getObject().setTestNominalValue(((DataComboMessage<TestNominalValue>)((ComboBox)testResultField_).currentItem()).getDataValue());
			getObject().setValue(null);
        }
		else if(ValueTypes.getValueType(getObject().getTest().getTestType().getValueType()) == ValueTypes.DATE)
		{
			getObject().setValue(DateUtils.parse(((IFormTextField)testResultField_).text()).getTime()+"");
		} 
		else if(ValueTypes.getValueType(getObject().getTest().getTestType().getValueType()) == ValueTypes.IMAGE) 
		{
			if(getInteractionState()==InteractionState.Editing)
			{
				try {
	    			Files.delete(Paths.get(RegaDBSettings.getInstance().getInstituteConfig().getFilesStoreDir().getAbsolutePath()
	    					+File.separator+getObject().getValue()));
	    		} catch (IOException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		}
			}
			List<UploadedFile> uploadedFiles = ((ImageField)testResultField_).getWFileUpload().getUploadedFiles();
			getObject().setValue(((ImageField)testResultField_).getFileName());
		}
		else
		{
			getObject().setValue(((IFormTextField)testResultField_).text());
		}
		
		update(getObject(), t);
		t.commit();
	}
    
    @Override
    public void cancel()
    {

    }
    
    @Override
    public WString deleteObject()
    {
        Transaction t = RegaDBMain.getApp().createTransaction();
        
        Patient p = RegaDBMain.getApp().getTree().getTreeContent().patientTreeNode.getSelectedItem();
        p.getTestResults().remove(getObject());
        
        t.delete(getObject());
        
        t.commit();
        
        if(ValueTypes.getValueType(getObject().getTest().getTestType().getValueType()) == ValueTypes.IMAGE){
        	try {
    			Files.delete(Paths.get(RegaDBSettings.getInstance().getInstituteConfig().getFilesStoreDir().getAbsolutePath()
    					+File.separator+getObject().getValue()));
    		} catch (IOException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
        }
                
        return null;
    }
}