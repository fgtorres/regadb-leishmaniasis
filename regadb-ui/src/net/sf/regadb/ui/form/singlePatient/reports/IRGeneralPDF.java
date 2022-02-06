package net.sf.regadb.ui.form.singlePatient.reports;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.ExceptionConverter;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;

import eu.webtoolkit.jwt.WContainerWidget;
import eu.webtoolkit.jwt.WFileResource;
import eu.webtoolkit.jwt.WImage;
import eu.webtoolkit.jwt.WString;
import net.sf.regadb.db.Patient;
import net.sf.regadb.db.PatientAttributeValue;
import net.sf.regadb.db.PatientEventValue;
import net.sf.regadb.db.TestResult;
import net.sf.regadb.db.Therapy;
import net.sf.regadb.db.TherapyCommercial;
import net.sf.regadb.db.TherapyGeneric;
import net.sf.regadb.service.wts.RegaDBWtsServer;
import net.sf.regadb.ui.framework.RegaDBApplication;
import net.sf.regadb.ui.framework.RegaDBMain;
import net.sf.regadb.ui.framework.RegaDBWindow;
import net.sf.regadb.ui.framework.forms.IForm;
import net.sf.regadb.ui.framework.forms.fields.IFormField;
import net.sf.regadb.ui.tree.items.custom.MultipleTestResultsItem;
import net.sf.regadb.util.date.DateUtils;
import net.sf.regadb.util.frequency.Frequency;
import net.sf.regadb.util.settings.ContactFormConfig;
import net.sf.regadb.util.settings.RegaDBSettings;
import net.sf.regadb.util.settings.TestItem;

public class IRGeneralPDF implements iReport{
	private Document document;
	private String filename = "report.pdf";
	private Patient obj;

	public WFileResource generate() {
		Font title = new Font(Font.TIMES_ROMAN, 15, Font.BOLD);
		Font subtitle = new Font(Font.TIMES_ROMAN, 12, Font.BOLD);
		Font text = new Font(Font.TIMES_ROMAN, 10);
		Font textbolder = new Font(Font.TIMES_ROMAN, 10, Font.BOLD);
		Paragraph blank = new Paragraph(" ");

		String file = RegaDBSettings.getInstance().getInstituteConfig().getQueryResultDir().getAbsolutePath()
				+ File.separator + filename;

		try {

			PdfWriter writer = PdfWriter.getInstance(this.document, new FileOutputStream(file));
			writer.setPageEvent(new HeaderandFooter(obj));
			this.document.open();

			this.document.addSubject("RegaDB " + WString.tr("menu.patient.reports") + " - "
					+ WString.tr("form.patient.reports.general"));

			Paragraph reporttitle = new Paragraph(
					(WString.tr("menu.patient.reports") + " - " + WString.tr("form.patient.reports.general")  + " - " +
							WString.tr("form.patient.reports.general.attributes.id").toString() + " " +
							this.obj.getPatientId().toString()),	title);
			reporttitle.setAlignment(Element.ALIGN_CENTER);

			this.document.add(blank);
			this.document.add(reporttitle);
			this.document.add(blank);

			PdfPTable table = new PdfPTable(2);
			table.setWidthPercentage(100);
			
			Set<PatientAttributeValue> attributesset = obj.getPatientAttributeValues();
			List<PatientAttributeValue> attributelist = new ArrayList<PatientAttributeValue>();
			attributelist.addAll(attributesset);
			
			attributelist = ReportUtils.OrderAttributesList(attributelist);
			
			// Add attributes on PDF
			for (PatientAttributeValue atr : attributelist) {
				if (atr != null && atr.getAttribute() != null && atr.getValue() != null) {
					String type = atr.getAttribute().getValueType().getDescription();
					if (type.toLowerCase().contains("date")) {
						table.addCell(new Paragraph(atr.getAttribute().getName(), textbolder));
						table.addCell(new Paragraph(DateUtils.format(atr.getValue()), text));
						table.completeRow();
					} else {
						table.addCell(new Paragraph(atr.getAttribute().getName(), textbolder));
						table.addCell(new Paragraph(atr.getValue(), text));
						table.completeRow();
					}
				}

				if (atr != null && atr.getAttribute() != null && atr.getAttributeNominalValue() != null) {
					table.addCell(new Paragraph(atr.getAttribute().getName(), textbolder));
					table.addCell(new Paragraph(atr.getAttributeNominalValue().getValue(), text));
					table.completeRow();
				}
			}
			document.add(table);

			this.document.newPage();
			
			// Plot all tests of patients
			Paragraph teststitle = new Paragraph("		" + WString.tr("form.patient.reports.general.tests").toString(),
					title);
			teststitle.setAlignment(Element.ALIGN_CENTER);

			this.document.add(blank);
			this.document.add(teststitle);
			this.document.add(blank);

			// Order the tests by date
			Set<TestResult> testsresultslist = this.obj.getTestResults();
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
					this.document.add(new Paragraph(ccf.getFormName(), subtitle));
					this.document.add(blank);

					for (Date date : datelist) {
						Boolean existstests = false;
						SimpleDateFormat sdfDate = new SimpleDateFormat("dd-MM-yyyy");
						String testdate = sdfDate.format(date);

						PdfPTable teststable = new PdfPTable(2);
						teststable.setWidthPercentage(100);

						teststable.addCell(
								new Paragraph(WString.tr("form.patient.reports.general.tests").toString(), textbolder));
						teststable.addCell(
								new Paragraph(WString.tr("form.patient.reports.general.value").toString(), text));

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
											existstests = true;
											teststable.addCell(
													new Paragraph(test.getTest().getDescription(), textbolder));
											teststable.addCell(new Paragraph(test.getValue(), text));
										}

										if (test != null && test.getTest() != null
												&& test.getTestNominalValue() != null) {
											existstests = true;
											teststable.addCell(
													new Paragraph(test.getTest().getDescription(), textbolder));
											teststable.addCell(
													new Paragraph(test.getTestNominalValue().getValue(), text));
										}
									}

									if (type.toLowerCase().contains("date")) {
										sdfDate = new SimpleDateFormat("dd-MM-yyyy");
										String value = sdfDate.format(test.getTest().getDescription());
										existstests = true;
										teststable.addCell(new Paragraph(test.getTest().getDescription(), textbolder));
										teststable.addCell(new Paragraph(value, text));
									}
								}

							}
						}
						if (existstests) {
							this.document.add(new Paragraph(testdate, subtitle));
							this.document.add(blank);
							document.add(teststable);
							this.document.add(blank);
						}
					}
				}

			}

			this.document.newPage();
			
			// Plot all events of patients
			PdfPTable eventstable = new PdfPTable(4);
			eventstable.setWidthPercentage(100);

			Paragraph eventstitle = new Paragraph(WString.tr("form.patient.reports.general.events").toString(), title);
			eventstitle.setAlignment(Element.ALIGN_CENTER);

			this.document.add(blank);
			this.document.add(eventstitle);
			this.document.add(blank);

			// Order the event by start date
			Set<PatientEventValue> eventslist = obj.getPatientEventValues();

			if (eventslist.size() > 0) {
				datelist = new ArrayList();

				for (PatientEventValue event : eventslist) {
					if (!datelist.contains(event.getStartDate())) {
						datelist.add(event.getStartDate());
					}
				}

				datelist = ReportUtils.OrderDateList(datelist);

				eventstable.addCell(
						new Paragraph(WString.tr("form.patient.reports.general.startdate").toString(), textbolder));
				eventstable.addCell(
						new Paragraph(WString.tr("form.patient.reports.general.enddate").toString(), textbolder));
				eventstable.addCell(
						new Paragraph(WString.tr("form.patient.reports.general.events").toString(), textbolder));
				eventstable.addCell(
						new Paragraph(WString.tr("form.patient.reports.general.value").toString(), textbolder));

				for (Date date : datelist) {
					for (PatientEventValue event : eventslist) {
						if (event.getStartDate().equals(date) && event != null) {
							SimpleDateFormat sdfDate = new SimpleDateFormat("dd-MM-yyyy");
							String eventstartdate = sdfDate.format(event.getStartDate());
							String eventenddate = (event.getEndDate() != null ? sdfDate.format(event.getStartDate())
									: "");
							if (event.getValue() != null) {
								eventstable.addCell(new Paragraph(eventstartdate, text));
								eventstable.addCell(new Paragraph(eventenddate, text));
								eventstable.addCell(new Paragraph(event.getEvent().getName(), text));
								eventstable.addCell(new Paragraph(event.getValue(), text));
							}

							if (event.getEventNominalValue() != null) {
								eventstable.addCell(new Paragraph(eventstartdate, text));
								eventstable.addCell(new Paragraph(eventenddate, text));
								eventstable.addCell(new Paragraph(event.getEvent().getName(), text));
								eventstable.addCell(new Paragraph(event.getEventNominalValue().getValue(), text));
							}
						}
					}
				}

				document.add(eventstable);
			} else {
				this.document.add(new Paragraph(
						WString.tr("form.patient.reports.general.events.withoutmessage").toString(), text));
				this.document.add(new Paragraph(" "));
			}

			this.document.newPage();
			
			// Plot all therapies of patients
			Paragraph therapiestitle = new Paragraph(WString.tr("form.patient.reports.general.therapies").toString(),
					title);
			therapiestitle.setAlignment(Element.ALIGN_CENTER);
			this.document.add(blank);
			this.document.add(therapiestitle);
			this.document.add(blank);

			// Order the therapies by start date
			Set<Therapy> therapylist = obj.getTherapies();

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
							String therapystartdate = sdfDate.format(therapy.getStartDate());
							String therapyenddate = (therapy.getStopDate() != null
									? sdfDate.format(therapy.getStopDate()) : "");

							this.document.add(new Paragraph(WString.tr("form.patient.reports.general.therapies") + " ("
									+ therapystartdate
									+ " - " + (therapyenddate.equals("")
											? WString.tr("form.patient.reports.general.now") : therapyenddate)
									+ ")".toString(), subtitle));

							this.document.add(new Paragraph(" "));

							PdfPTable therapies = new PdfPTable(2);
							therapies.setWidthPercentage(100);

							if (therapy != null) {
								therapies.addCell(
										new Paragraph(WString.tr("form.therapy.comment").toString(), textbolder));
								therapies.addCell(new Paragraph(therapy.getComment(), text));

								Set<TherapyCommercial> commerciallist = therapy.getTherapyCommercials();
								Set<TherapyGeneric> genericlist = therapy.getTherapyGenerics();

								PdfPTable drugs = new PdfPTable(3);
								drugs.setWidthPercentage(100);

								drugs.addCell(new Paragraph(WString.tr("form.patient.reports.general.drugs").toString(),
										textbolder));
								drugs.addCell(new Paragraph(
										WString.tr("form.patient.reports.general.drugs.dosage").toString(),
										textbolder));
								drugs.addCell(new Paragraph(
										WString.tr("form.patient.reports.general.drugs.frequence").toString(),
										textbolder));

								if (commerciallist.size() > 0) {
									for (TherapyCommercial object : commerciallist) {
										drugs.addCell(
												new Paragraph(object.getId().getDrugCommercial().getName(), text));
										drugs.addCell(new Paragraph(object.getDayDosageUnits().toString(), text));
										drugs.addCell(new Paragraph(
												Frequency.getFrequency(object.getFrequency()).toString(), text));
									}
								}

								if (genericlist.size() > 0) {
									for (TherapyGeneric object : genericlist) {
										drugs.addCell(
												new Paragraph(object.getId().getDrugGeneric().getGenericName(), text));
										drugs.addCell(new Paragraph(object.getDayDosageMg().toString(), text));
										drugs.addCell(new Paragraph(
												Frequency.getFrequency(object.getFrequency()).toString(), text));
									}
								}
								this.document.add(therapies);
								this.document.add(drugs);
							}
						}

					}
				}
			} else {
				this.document.add(new Paragraph(" "));
				this.document.add(new Paragraph(
						WString.tr("form.patient.reports.general.therapy.withoutmessage").toString(), text));
				this.document.add(new Paragraph(" "));
			}

		} catch (DocumentException de) {
			System.err.println(de.getMessage());
		} catch (IOException ioe) {
			System.err.println(ioe.getMessage());
		}

		document.close();
		WFileResource res = new WFileResource("pdf", file);

		return res;

	}

	public IRGeneralPDF(Patient p) {
		this.obj = p;
		this.document = new Document();
		this.document.addCreator("RegaDB");
		this.document.addAuthor("RegaDB Leishmaniasis");
		this.document.setMargins(30, 30, 90, 50);
	}

	class HeaderandFooter extends PdfPageEventHelper {
		Font ffont = new Font(Font.TIMES_ROMAN, 10);
		Patient obj;
		
		public HeaderandFooter(Patient obj){
			super();
			this.obj = obj;
		}
		public void onEndPage(PdfWriter writer, Document document) {
			try {
				
				PdfPTable head = new PdfPTable(1);
				PdfPCell cell1 = new PdfPCell();
				com.itextpdf.text.Rectangle page = document.getPageSize();
				
				try{
					Image logo = Image.getInstance(RegaDBMain.getApp().getServletContext().getRealPath("") + "/" + 
							RegaDBSettings.getInstance().getInstituteConfig().getLogo());
					logo.scaleAbsolute(538f, 65f);
					cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
					cell1.setImage(logo);
					cell1.setBorder(0);
				}catch(Exception e){
					cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
					cell1.setPhrase(new Phrase());
					cell1.setBorder(0);
				}
				
				head.addCell(cell1);
				head.setTotalWidth(page.getWidth() - document.leftMargin() - document.rightMargin());
				head.writeSelectedRows(0, -1, document.leftMargin(),
						page.getHeight() - document.topMargin() - 10 + head.getTotalHeight(), writer.getDirectContent());

				PdfPTable foot = new PdfPTable(1);

				SimpleDateFormat formatdate = new SimpleDateFormat("dd/MM/yyyy HH:mm"); 
				String realizeddate = formatdate.format(System.currentTimeMillis());
						 
				PdfPCell cell = new PdfPCell(
						new Paragraph(WString.tr("form.patient.reports.general.header").toString() + 
						" - " + WString.tr("form.patient.reports.general.realize") + " " +realizeddate +
						" - " + WString.tr("form.patient.reports.general.attributes.id").toString() + " " +
						 " " +  this.obj.getPatientId() + " " +
						" - " + WString.tr("form.patient.reports.general.page") + " " +
						writer.getCurrentPageNumber(), ffont));
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				cell.setBorder(0);

				foot.addCell(cell);
				foot.setTotalWidth(page.getWidth() - document.leftMargin() - document.rightMargin());
				foot.writeSelectedRows(0, -1, document.leftMargin(), document.bottomMargin(),
						writer.getDirectContent());

			} catch (Exception e) {
				throw new ExceptionConverter(e);
			}
		}
	}
}
