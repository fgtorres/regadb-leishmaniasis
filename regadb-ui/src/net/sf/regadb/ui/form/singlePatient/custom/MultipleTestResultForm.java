package net.sf.regadb.ui.form.singlePatient.custom;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.regadb.db.Event;
import net.sf.regadb.db.EventNominalValue;
import net.sf.regadb.db.Patient;
import net.sf.regadb.db.PatientEventValue;
import net.sf.regadb.db.Test;
import net.sf.regadb.db.TestNominalValue;
import net.sf.regadb.db.TestResult;
import net.sf.regadb.db.Transaction;
import net.sf.regadb.db.ValueTypes;
import net.sf.regadb.ui.form.singlePatient.DataComboMessage;
import net.sf.regadb.ui.framework.RegaDBMain;
import net.sf.regadb.ui.framework.forms.FormWidget;
import net.sf.regadb.ui.framework.forms.InteractionState;
import net.sf.regadb.ui.framework.forms.fields.CheckBox;
import net.sf.regadb.ui.framework.forms.fields.ComboBox;
import net.sf.regadb.ui.framework.forms.fields.DateField;
import net.sf.regadb.ui.framework.forms.fields.FieldType;
import net.sf.regadb.ui.framework.forms.fields.IFormField;
import net.sf.regadb.ui.framework.forms.fields.IFormTextField;
import net.sf.regadb.ui.framework.forms.fields.ImageField;
import net.sf.regadb.ui.framework.forms.fields.Label;
import net.sf.regadb.ui.framework.forms.fields.TextField;
import net.sf.regadb.ui.framework.tree.TreeMenuNode;
import net.sf.regadb.ui.framework.widgets.UIUtils;
import net.sf.regadb.ui.framework.widgets.formtable.FormTable;
import net.sf.regadb.ui.utils.Utils;
import net.sf.regadb.util.date.DateUtils;
import net.sf.regadb.util.settings.ContactFormConfig;
import net.sf.regadb.util.settings.EventItem;
import net.sf.regadb.util.settings.RegaDBSettings;
import net.sf.regadb.util.settings.TestItem;
import eu.webtoolkit.jwt.Signal;
import eu.webtoolkit.jwt.Signal1;
import eu.webtoolkit.jwt.StandardButton;
import eu.webtoolkit.jwt.WFileResource;
import eu.webtoolkit.jwt.WGroupBox;
import eu.webtoolkit.jwt.WLength;
import eu.webtoolkit.jwt.WMessageBox;
import eu.webtoolkit.jwt.WPushButton;
import eu.webtoolkit.jwt.WString;
import eu.webtoolkit.jwt.servlet.UploadedFile;

public abstract class MultipleTestResultForm extends FormWidget {

	private WGroupBox testGroupBox_;
	private FormTable testGroupTable_;
	private Label dateL_;
	private DateField dateTF_;
	private Label sampleIdL_;
	private TextField sampleIdTF_;
	private List<IFormField> testFormFields_ = new ArrayList<IFormField>();

	private WGroupBox eventGroupBox_;
	private FormTable eventGroupTable_;
	private CheckBox useContactDate_;
	private DateField eventStartDateTF_;
	private DateField eventStopDateTF_;
	private List<IFormField> eventFormFields_ = new ArrayList<IFormField>();

	private List<Test> tests_;
	private Map<Test, TestItem> testItems_;
	private List<Event> events_;
	private TreeMenuNode lastItem_;

	private WPushButton addViralIsolate;

	public MultipleTestResultForm(WString name, InteractionState state,
			TreeMenuNode lastItem, ContactFormConfig config) {
		super(name, state);

		if (RegaDBMain.getApp().isPatientInteractionAllowed(state)) {

			Transaction t = RegaDBMain.getApp().createTransaction();

			tests_ = new ArrayList<Test>();
			testItems_ = new HashMap<Test, TestItem>();
			for (TestItem ti : config.getTests()) {
				Test test = t.getTestByGenome(ti.description, ti.organism);
				if (test != null) {
					tests_.add(test);
					testItems_.put(test, ti);
				}
			}

			events_ = new ArrayList<Event>();
			for (EventItem ei : config.getEvents()) {
				Event event = t.getEvent(ei.name);
				if (event != null)
					events_.add(event);
			}

			t.commit();

			lastItem_ = lastItem;

			init(config);
		}
	}

	@SuppressWarnings("unchecked")
	private void init(final ContactFormConfig config) {
        testGroupBox_ = new WGroupBox(tr("form.multipleTestResults.tests"), this);
        testGroupTable_ = new FormTable(testGroupBox_);
        dateL_ = new Label(tr("form.multipleTestResults.tests.date"));
        dateTF_ = new DateField(getInteractionState(), this, RegaDBSettings.getInstance().getDateFormat());
        dateTF_.setMandatory(true);
        if (config.isTodayDefaultContactDate() && getInteractionState() == InteractionState.Adding)
        	dateTF_.setDate(new Date());
        testGroupTable_.addLineToTable(dateL_, dateTF_);
        
        sampleIdL_ = new Label("");
        sampleIdTF_ = new TextField(getInteractionState(), this, FieldType.ALFANUMERIC);
        
        if (config.isShowSampleId()) {
	        sampleIdL_ = new Label(tr("form.multipleTestResults.tests.sampleId"));
	        sampleIdTF_ = new TextField(getInteractionState(), this, FieldType.ALFANUMERIC);
	        testGroupTable_.addLineToTable(sampleIdL_, sampleIdTF_);
        }
        
        for(Test t : tests_) {
        	String labelText = t.getDescription();
        	if (testItems_.get(t).showOrganism && t.getTestType().getGenome() != null) 
        		labelText += "(" + t.getTestType().getGenome().getOrganismName() + ")";
            Label l = new Label(labelText);
            IFormField testResultField;
            if(ValueTypes.getValueType(t.getTestType().getValueType()) == ValueTypes.NOMINAL_VALUE) {
                testResultField = new ComboBox(getInteractionState(), this);
                for(TestNominalValue tnv : t.getTestType().getTestNominalValues()) {
                    ((ComboBox)testResultField).addItem(new DataComboMessage<TestNominalValue>(tnv, tnv.getValue()));
                }
                ((ComboBox)testResultField).sort();
                ((ComboBox)testResultField).addNoSelectionItem();
            } else {
                testResultField = getTextField(ValueTypes.getValueType(t.getTestType().getValueType()));
            }
            
            if(testItems_.get(t).isMandatory) {
            	testResultField.setMandatory(true);
            } else {
            	testResultField.setMandatory(false);
            }

            testGroupTable_.addLineToTable(l, testResultField);
            testFormFields_.add(testResultField);
        }


        if(events_.size() > 0){
            eventGroupBox_ = new WGroupBox(tr("form.multipleTestResults.events"), this);
            eventGroupTable_ = new FormTable(eventGroupBox_);

	        boolean useContactDate = config.getUseContactDate();

            if(getInteractionState() != InteractionState.Viewing){
		        useContactDate_ = new CheckBox(getInteractionState(),this);
		        eventGroupTable_.addLineToTable(new Label(tr("form.multipleTestResults.events.useContactDate")),useContactDate_);
		        
		        useContactDate_.clicked().addListener(this, new Signal.Listener(){
					public void trigger() {
						setUseContactDate(useContactDate_.isChecked());
					}
		        });
		        
		        useContactDate_.setChecked(useContactDate);
		        
		        dateTF_.addChangeListener(new Signal.Listener(){
					public void trigger() {
						copyContactDateToEventStartDate();
					}
		        });
            }
	        
	        eventStartDateTF_ = new DateField(getInteractionState(), this, RegaDBSettings.getInstance().getDateFormat());
	        eventGroupTable_.addLineToTable(new Label(tr("form.multipleTestResults.events.startDate")),eventStartDateTF_);
	        
	        eventStopDateTF_ = new DateField(getInteractionState(), this, RegaDBSettings.getInstance().getDateFormat());
	        eventGroupTable_.addLineToTable(new Label(tr("form.multipleTestResults.events.endDate")),eventStopDateTF_);
	        
	        setUseContactDate(useContactDate && getInteractionState() != InteractionState.Viewing);
	        
	        for(Event e : events_) {
	            Label l = new Label(e.getName());
	            IFormField eventValueField;
	            if(ValueTypes.getValueType(e.getValueType()) == ValueTypes.NOMINAL_VALUE) {
	                eventValueField = new ComboBox(getInteractionState(), this);
	                for(EventNominalValue env : e.getEventNominalValues()) {
	                    ((ComboBox)eventValueField).addItem(new DataComboMessage<EventNominalValue>(env, env.getValue()));
	                }
	                ((ComboBox)eventValueField).sort();
	                ((ComboBox)eventValueField).addNoSelectionItem();
	            } else {
	                eventValueField = getTextField(ValueTypes.getValueType(e.getValueType()));
	            }
	
	            eventGroupTable_.addLineToTable(l, eventValueField);
	            eventFormFields_.add(eventValueField);
	        }
        }
        
        if(getInteractionState() == InteractionState.Adding){
            addViralIsolate = new WPushButton(tr("form.multipleTestResults.addViralIsolate"));
            getExtraButtons().add(addViralIsolate);
            addViralIsolate.clicked().addListener(this, new Signal.Listener(){
                public void trigger() {
                    saveAndGotoViralIsolate();
                }
            });
        }
        
        fillData();
        addControlButtons();
    }

	private void setUseContactDate(boolean use) {
		if (eventStartDateTF_ != null) {
			eventStartDateTF_.setEnabled(!use);

			copyContactDateToEventStartDate();// eventStartDateTF_.setText(dateTF_.text());
		}
	}

	private void copyContactDateToEventStartDate() {
		if (eventStartDateTF_ != null && useContactDate_ != null
				&& useContactDate_.isChecked())
			eventStartDateTF_.setText(dateTF_.text());
	}

	@SuppressWarnings("unchecked")
	private void fillData() {
		if (!(getInteractionState() == InteractionState.Adding)) {
			Transaction t = RegaDBMain.getApp().createTransaction();
			Patient p = RegaDBMain.getApp().getTree().getTreeContent().patientTreeNode
					.getSelectedItem();

			Date newestDate = null;
			for (Test test : tests_) {
				TestResult tr = t.getNewestTestResult(test, p);
				if (tr != null) {
					if (newestDate == null) {
						newestDate = tr.getTestDate();
					} else if (tr.getTestDate() != null && newestDate.before(tr.getTestDate())) {
						newestDate = tr.getTestDate();
					}
				}
			}

			if (newestDate != null) {
				dateTF_.setDate(newestDate);

				for (int i = 0; i < tests_.size(); i++) {
					IFormField f = testFormFields_.get(i);
					TestResult tr = t.getNewestTestResult(tests_.get(i), p);

					if (tr != null
							&& DateUtils.compareDates(tr.getTestDate(),
									(newestDate)) == 0) {
						sampleIdTF_.setText(tr.getSampleId());
						if (f instanceof ComboBox) {
							((ComboBox) f).selectItem(tr.getTestNominalValue()
									.getValue());
						} else if(f instanceof ImageField) {
								File image = new File(RegaDBSettings.getInstance().getInstituteConfig().getFilesStoreDir().getAbsolutePath()
										 + File.separatorChar + tr.getValue());
								WFileResource res = new WFileResource(tr.getValue().substring(tr.getValue().lastIndexOf("."), 
										tr.getValue().length()), image.getAbsolutePath());
				            	
								((ImageField)f).setImage(res);
								((ImageField) f).setMaximumSize(new WLength(300), new WLength(300));
								((ImageField) f).getWImage().setMaximumSize(new WLength(300), new WLength(300));
						} else {
							((IFormTextField)f).setText(tr.getValue());
						}
					}
				}
			}

			Date endDate = null;
			newestDate = null;
			for (Event event : events_) {
				PatientEventValue pev = t.getNewestPatientEventValue(event, p);
				if (pev != null) {
					if (newestDate == null) {
						newestDate = pev.getStartDate();
						endDate = pev.getEndDate();
					} else if (newestDate.before(pev.getStartDate())) {
						newestDate = pev.getStartDate();
						endDate = pev.getEndDate();
					}
				}
			}
			if (newestDate != null) {
				eventStartDateTF_.setDate(newestDate);
				eventStopDateTF_.setDate(endDate);

				for (int i = 0; i < events_.size(); i++) {
					IFormTextField f = (IFormTextField) eventFormFields_.get(i);
					PatientEventValue pev = t.getNewestPatientEventValue(
							events_.get(i), p);

					if (pev != null
							&& DateUtils.compareDates(pev.getStartDate(),
									(newestDate)) == 0
							&& DateUtils.compareDates(pev.getEndDate(),
									(endDate)) == 0) {
						if (f instanceof ComboBox) {
							((ComboBox) f).selectItem(pev
									.getEventNominalValue().getValue());
						} else {
							f.setText(pev.getValue());
						}
					}
				}
			}
		}
	}

	@Override
	public void cancel() {
		lastItem_.prograSelectNode();
	}

	@Override
	public WString deleteObject() {
		return null;
	}

	@Override
	public void redirectAfterDelete() {

	}

	@SuppressWarnings("unchecked")
	private void save() {
		Transaction t = RegaDBMain.getApp().createTransaction();
		boolean duplicateSampleId = false;

		Patient p = RegaDBMain.getApp().getTree().getTreeContent().patientTreeNode
				.getSelectedItem();

		if (!sampleIdTF_.getFormText().equals("")) {
			for (TestResult tr : p.getTestResults()) {
				if (sampleIdTF_.getFormText().equals(tr.getSampleId())) {
					for (Test test : tests_) {
						if (tr.getTest().getDescription()
								.equals(test.getDescription())) {
							duplicateSampleId = true;
							break;
						}
					}
				}
				if (duplicateSampleId)
					break;
			}
		}

		if (duplicateSampleId) {
			final WMessageBox cmb = UIUtils.createYesNoMessageBox(this,
					tr("form.multipleTestResults.duplicateSampleIdWarning"));
			cmb.buttonClicked().addListener(this,
					new Signal1.Listener<StandardButton>() {
						public void trigger(StandardButton sb) {
							cmb.remove();
						}
					});
			cmb.show();
		}

		for (int i = 0; i < tests_.size(); i++) {
			TestResult tr = null;
			IFormField f = (IFormField) testFormFields_.get(i);
			if (f instanceof ComboBox) {
				DataComboMessage<TestNominalValue> currentItem = (DataComboMessage<TestNominalValue>) ((ComboBox) f)
						.currentItem();
				if (currentItem != null && currentItem.getValue() != null) {
					tr = p.createTestResult(tests_.get(i));
					tr.setTestNominalValue(((DataComboMessage<TestNominalValue>) ((ComboBox) f)
							.currentItem()).getDataValue());
				}
			} else if (f instanceof ImageField) { 
				((ImageField)f).setMaximumSize(new WLength(400), new WLength(400));
				List<UploadedFile> uploadedFiles = ((ImageField)f.getWidget()).getWFileUpload().getUploadedFiles();
				if(uploadedFiles.size() > 0) {
					tr = p.createTestResult(tests_.get(i));
					tr.setValue(((ImageField)f).getFileName());
				}
			} else {
				if (((IFormTextField)f).text() != null && !((IFormTextField)f).text().trim().equals("")) {
					tr = p.createTestResult(tests_.get(i));
					if (f instanceof DateField)
						tr.setValue(((DateField) f).getDate().getTime() + "");
					else
						tr.setValue(((IFormTextField)f).text());
				}
			}
			if (tr != null) {
				tr.setTestDate(dateTF_.getDate());
				if (!sampleIdTF_.getFormText().equals("")) {
					tr.setSampleId(sampleIdTF_.getFormText());
				}
				t.save(tr);
			}
		}
		for (int i = 0; i < events_.size(); i++) {
			PatientEventValue pev = null;
			IFormTextField f = (IFormTextField) eventFormFields_.get(i);
			if (f instanceof ComboBox) {
				DataComboMessage<EventNominalValue> currentItem = ((DataComboMessage<EventNominalValue>) ((ComboBox) f)
						.currentItem());
				if (currentItem != null && currentItem.getValue() != null) {
					pev = p.createPatientEventValue(events_.get(i));
					pev.setEventNominalValue(((DataComboMessage<EventNominalValue>) ((ComboBox) f)
							.currentItem()).getDataValue());
				}
			} else {
				if (f.text() != null && !f.text().trim().equals("")) {
					pev = p.createPatientEventValue(events_.get(i));
					if (f instanceof DateField)
						pev.setValue(((DateField) f).getDate().getTime() + "");
					else
						pev.setValue(f.text());
				}
			}
			if (pev != null) {
				if (useContactDate_.isChecked())
					pev.setStartDate(dateTF_.getDate());
				else
					pev.setStartDate(eventStartDateTF_.getDate());
				pev.setEndDate(eventStopDateTF_.getDate());
				t.save(pev);
			}
		}

		t.commit();
	}

	@Override
	public void saveData() {
		save();
		lastItem_.prograSelectNode();
	}

	protected void saveAndGotoViralIsolate() {
		if (!validateForm())
			return;

		save();
		gotoViralIsolateForm(sampleIdTF_.text(), dateTF_.getDate());
	}

	protected abstract void gotoViralIsolateForm(String sampleId,
			Date sampleDate);
}