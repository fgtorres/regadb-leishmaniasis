package net.sf.regadb.ui.form.singlePatient.reports;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.poi.hssf.record.formula.functions.Now;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;
import com.pharmadm.custom.rega.queryeditor.catalog.DbObject;
import com.pharmadm.custom.rega.queryeditor.catalog.DbObject.ValueType;

import eu.webtoolkit.jwt.AnchorTarget;
import eu.webtoolkit.jwt.Signal1;
import eu.webtoolkit.jwt.WAnchor;
import eu.webtoolkit.jwt.WContainerWidget;
import eu.webtoolkit.jwt.WFileResource;
import eu.webtoolkit.jwt.WGroupBox;
import eu.webtoolkit.jwt.WImage;
import eu.webtoolkit.jwt.WLabel;
import eu.webtoolkit.jwt.WMouseEvent;
import eu.webtoolkit.jwt.WPushButton;
import eu.webtoolkit.jwt.WResource;
import eu.webtoolkit.jwt.WString;
import eu.webtoolkit.jwt.WText;
import eu.webtoolkit.jwt.servlet.WebRequest;
import eu.webtoolkit.jwt.servlet.WebResponse;
import net.sf.regadb.db.Attribute;
import net.sf.regadb.db.Patient;
import net.sf.regadb.db.PatientAttributeValue;
import net.sf.regadb.db.PatientEventValue;
import net.sf.regadb.db.TestResult;
import net.sf.regadb.db.Therapy;
import net.sf.regadb.db.TherapyCommercial;
import net.sf.regadb.db.TherapyGeneric;
import net.sf.regadb.db.ValueTypes;
import net.sf.regadb.ui.form.impex.ExportForm;
import net.sf.regadb.ui.framework.RegaDBApplication;
import net.sf.regadb.ui.framework.RegaDBWindow;
import net.sf.regadb.ui.framework.forms.IForm;
import net.sf.regadb.ui.framework.forms.fields.IFormField;
import net.sf.regadb.ui.framework.forms.fields.IFormTextField;
import net.sf.regadb.ui.framework.widgets.formtable.FormTable;
import net.sf.regadb.util.date.DateUtils;
import net.sf.regadb.util.frequency.Frequency;
import net.sf.regadb.util.settings.ContactFormConfig;
import net.sf.regadb.util.settings.RegaDBSettings;
import net.sf.regadb.util.settings.TestItem;

public class GeneralReport extends WContainerWidget implements IForm {

	public GeneralReport(Patient p) {

		WGroupBox group = new WGroupBox();
		group.setTitle(tr("menu.patient.reports") + " - " + tr("form.patient.reports.general"));
	
		this.addWidget(group);

		// Download of PDF File
		IRGeneralPDF report = new IRGeneralPDF(p);
		WAnchor anchor = new WAnchor(report.generate().generateUrl(), group);
		anchor.setText(tr("form.patient.reports.general.downloadpdf"));
		anchor.setTarget(AnchorTarget.TargetNewWindow);

		// Plot all attributes of patients
		WGroupBox groupatributtes = new WGroupBox(group);
		groupatributtes.setTitle(tr("form.patient.reports.general.attributes"));
		FormTable attributes = new FormTable(groupatributtes);

		if (p.getPatientAttributeValues().size() > 0) {
			attributes.addLineToTable(new WLabel(tr("form.patient.reports.general.attributes.id")),
					new WLabel(p.getPatientId()));

			Set<PatientAttributeValue> attributesset = p.getPatientAttributeValues();
			List<PatientAttributeValue> attributelist = new ArrayList<PatientAttributeValue>();
			attributelist.addAll(attributesset);
			
			attributelist = ReportUtils.OrderAttributesList(attributelist);
			
			for (PatientAttributeValue atr : attributelist) {
				if (atr != null && atr.getAttribute() != null && atr.getValue() != null) {
					String type = atr.getAttribute().getValueType().getDescription();
					if (type.toLowerCase().contains("date")) {
						attributes.addLineToTable(new WLabel(atr.getAttribute().getName()),
								new WLabel(DateUtils.format(atr.getValue())));
					} else {
						attributes.addLineToTable(new WLabel(atr.getAttribute().getName()), new WLabel(atr.getValue()));
					}
				}

				if (atr != null && atr.getAttribute() != null && atr.getAttributeNominalValue() != null) {
					attributes.addLineToTable(new WLabel(atr.getAttribute().getName()),
							new WLabel(atr.getAttributeNominalValue().getValue()));
				}
			}

			// Plot all tests of patients
			WGroupBox grouptests = new WGroupBox(group);
			grouptests.setTitle(tr("form.patient.reports.general.tests"));

			// Order the tests by date
			Set<TestResult> testsresultslist = p.getTestResults();
			List<Date> datelist = new ArrayList();

			for (TestResult test : testsresultslist) {
				if (!datelist.contains(test.getTestDate())) {
					datelist.add(test.getTestDate());
				}
			}

			datelist = ReportUtils.OrderDateList(datelist);

			for (ContactFormConfig ccf : RegaDBSettings.getInstance().getInstituteConfig()
					.getMultipleTestResultForms()) {

				Boolean existsdatetest = false;

				for (TestItem testitem : ccf.getTests()) {
					for (TestResult test : testsresultslist) {
						if (test.getTest().getDescription().equals(testitem.description)
								&& test.getTest().getTestType().getDescription().equals(testitem.type)) {
							existsdatetest = true;
						}
					}
				}

				if (existsdatetest) {

					WGroupBox customgroup = new WGroupBox(grouptests);
					customgroup.setTitle(ccf.getFormName());

					for (Date date : datelist) {

						SimpleDateFormat sdfDate = new SimpleDateFormat("dd-MM-yyyy");
						String testdate = sdfDate.format(date);
						WGroupBox datetestsgroup = new WGroupBox();
						datetestsgroup.setTitle(testdate);

						FormTable tests = new FormTable(datetestsgroup);
						tests.addLineToTable(new WLabel(tr("form.patient.reports.general.tests")),
								new WLabel(tr("form.patient.reports.general.value")));

						for (TestItem testitem : ccf.getTests()) {
							for (TestResult test : testsresultslist) {
								if (test.getTestDate().equals(date)
										&& test.getTest().getDescription().equals(testitem.description)
										&& test.getTest().getTestType().getDescription().equals(testitem.type)) {
									sdfDate = new SimpleDateFormat("dd-MM-yyyy");
									testdate = sdfDate.format(test.getTestDate());
									String type = test.getTest().getTestType().getValueType().getDescription();
									if (!type.toLowerCase().contains("image") && !type.toLowerCase().contains("date")) {
										if (test != null && test.getTest() != null && test.getValue() != null) {
											tests.addLineToTable(
													new WLabel(splitText(test.getTest().getDescription(), 6)),
													new WLabel(splitText(test.getValue(), 10)));
										}

										if (test != null && test.getTest() != null
												&& test.getTestNominalValue() != null) {
											tests.addLineToTable(
													new WLabel(splitText(test.getTest().getDescription(), 6)),
													new WLabel(splitText(test.getTestNominalValue().getValue(), 10)));
										}
									}

									if (type.toLowerCase().contains("date")) {
										sdfDate = new SimpleDateFormat("dd-MM-yyyy");
										String value = sdfDate.format(test.getValue());
										tests.addLineToTable(new WLabel(splitText(test.getTest().getDescription(), 6)),
												new WLabel(splitText(value, 10)));
									}
								}

							}
							
						}
						
						if(tests.getRowCount() > 1){
							customgroup.addWidget(datetestsgroup);						
						}
					}
				}
			}
		} else {
			attributes.addLineToTable(new WLabel(tr("form.patient.reports.general.attributes.withoutmessage")));
		}

		// Plot all events of patients
		WGroupBox groupevents = new WGroupBox(group);
		groupevents.setTitle(tr("form.patient.reports.general.events"));
		FormTable events = new FormTable(groupevents);

		// Order the tests by start date
		Set<PatientEventValue> eventslist = p.getPatientEventValues();
		List<Date> datelist = new ArrayList();

		if (eventslist.size() > 0) {
			List<Date> eventdatelist = new ArrayList();

			for (PatientEventValue event : eventslist) {
				if (!datelist.contains(event.getStartDate())) {
					datelist.add(event.getStartDate());
				}
			}

			datelist = ReportUtils.OrderDateList(datelist);

			FormTable eventsft = new FormTable(groupevents);
			eventsft.addLineToTable(new WLabel(tr("form.patient.reports.general.startdate")),
					new WLabel(tr("form.patient.reports.general.enddate")),
					new WLabel(tr("form.patient.reports.general.events")),
					new WLabel(tr("form.patient.reports.general.value")));

			for (Date date : datelist) {
				for (PatientEventValue event : eventslist) {
					if (event.getStartDate().equals(date) && event != null) {
						SimpleDateFormat sdfDate = new SimpleDateFormat("dd-MM-yyyy");
						String eventstartdate = sdfDate.format(event.getStartDate());
						String eventenddate = (event.getEndDate() != null ? sdfDate.format(event.getStartDate()) : "");
						if (event.getValue() != null) {
							eventsft.addLineToTable(new WLabel(eventstartdate), new WLabel(eventenddate),
									new WLabel(splitText(event.getEvent().getName(), 6)),
									new WLabel(splitText(event.getValue(), 10)));
						}

						if (event.getEventNominalValue() != null) {
							eventsft.addLineToTable(new WLabel(eventstartdate), new WLabel(eventenddate),
									new WLabel(splitText(event.getEvent().getName(), 6)),
									new WLabel(splitText(event.getEventNominalValue().getValue(), 10)));
						}
					}
				}
			}
		} else {
			events.addLineToTable(new WLabel(tr("form.patient.reports.general.events.withoutmessage")));
		}

		// Plot all therapies of patients
		WGroupBox grouptherapies = new WGroupBox(group);
		grouptherapies.setTitle(tr("form.patient.reports.general.therapies"));

		// Order the therapies by start date
		Set<Therapy> therapylist = p.getTherapies();

		if (therapylist.size() > 0) {
			datelist = new ArrayList();
			for (Therapy therapy : therapylist) {
				if (!datelist.contains(therapy.getStartDate())) {
					datelist.add(therapy.getStartDate());
				}
			}

			datelist = ReportUtils.OrderDateList(datelist);

			for (Date date : datelist) {
				for (Therapy therapy : therapylist) {
					if (therapy.getStartDate().equals(date) && therapy != null) {
						SimpleDateFormat sdfDate = new SimpleDateFormat("dd-MM-yyyy");
						String eventstartdate = sdfDate.format(therapy.getStartDate());
						String eventenddate = (therapy.getStopDate() != null ? sdfDate.format(therapy.getStopDate())
								: "");

						WGroupBox therapiessinglegroup = new WGroupBox(grouptherapies);
						therapiessinglegroup.setTitle(tr("form.patient.reports.general.therapies") + " ("
								+ eventstartdate + " - "
								+ (eventenddate.equals("") ? tr("form.patient.reports.general.now") : eventenddate)
								+ ")");

						FormTable therapies = new FormTable(therapiessinglegroup);

						if (therapy != null) {
							therapies.addLineToTable(new WLabel(tr("form.therapy.comment")),
									new WLabel(splitText(therapy.getComment(), 6)));

							Set<TherapyCommercial> commerciallist = therapy.getTherapyCommercials();
							Set<TherapyGeneric> genericlist = therapy.getTherapyGenerics();

							FormTable drugs = new FormTable(therapiessinglegroup);
							drugs.addLineToTable(new WLabel(tr("form.patient.reports.general.drugs")),
									new WLabel(tr("form.patient.reports.general.drugs.dosage")),
									new WLabel(tr("form.patient.reports.general.drugs.frequence")));

							if (commerciallist.size() > 0) {
								for (TherapyCommercial object : commerciallist) {
									drugs.addLineToTable(new WLabel(object.getId().getDrugCommercial().getName()),
											new WLabel(object.getDayDosageUnits().toString()),
											new WLabel(Frequency.getFrequency(object.getFrequency()).toString()));
								}
							}

							if (genericlist.size() > 0) {
								for (TherapyGeneric object : genericlist) {
									drugs.addLineToTable(new WLabel(object.getId().getDrugGeneric().getGenericName()),
											new WLabel(object.getDayDosageMg().toString()),
											new WLabel(Frequency.getFrequency(object.getFrequency()).toString()));
								}
							}
						}
					}
				}
			}
		} else {
			grouptherapies.addWidget(new WLabel(tr("form.patient.reports.general.therapy.withoutmessage")));
		}

	}

	public String splitText(String text, int words) {
		if (text != null) {
			String[] array = text.split(" ");
			String result = "";
			for (int i = 0; i < array.length; i++) {
				if (i == words) {
					result += " <br></br> ";
				} else {
					result += " " + array[i];
				}
			}
			return result;
		} else {
			return "";
		}
	}

	@Override
	public WContainerWidget getWContainer() {
		return this;
	}

	@Override
	public void addFormField(IFormField field) {

	}

	@Override
	public void removeFormField(IFormField field) {
		// TODO Auto-generated method stub

	}

	@Override
	public WString leaveForm() {
		// TODO Auto-generated method stub
		return null;
	}

}
