package net.sf.regadb.ui.form.singlePatient.chart;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import net.sf.regadb.db.AaSequence;
import net.sf.regadb.db.Genome;
import net.sf.regadb.db.NtSequence;
import net.sf.regadb.db.Patient;
import net.sf.regadb.db.Transaction;
import net.sf.regadb.db.ViralIsolate;
import net.sf.regadb.db.tools.MutationHelper;
import net.sf.regadb.io.util.StandardObjects;
import net.sf.regadb.ui.framework.RegaDBMain;
import net.sf.regadb.ui.framework.forms.IForm;
import net.sf.regadb.ui.framework.forms.InteractionState;
import net.sf.regadb.ui.framework.forms.fields.DateField;
import net.sf.regadb.ui.framework.forms.fields.IFormField;
import net.sf.regadb.ui.framework.forms.fields.TestComboBox;
import net.sf.regadb.ui.framework.forms.fields.TestTypeComboBox;
import eu.webtoolkit.jwt.Side;
import eu.webtoolkit.jwt.Signal;
import eu.webtoolkit.jwt.Signal1;
import eu.webtoolkit.jwt.TextFormat;
import eu.webtoolkit.jwt.WContainerWidget;
import eu.webtoolkit.jwt.WDate;
import eu.webtoolkit.jwt.WGroupBox;
import eu.webtoolkit.jwt.WLabel;
import eu.webtoolkit.jwt.WLength;
import eu.webtoolkit.jwt.WMouseEvent;
import eu.webtoolkit.jwt.WPointF;
import eu.webtoolkit.jwt.WPushButton;
import eu.webtoolkit.jwt.WString;
import eu.webtoolkit.jwt.WTable;
import eu.webtoolkit.jwt.WText;
import eu.webtoolkit.jwt.chart.Axis;

public class PatientChartForm extends WGroupBox implements IForm 
{
	private Chart chart = null;
	private WTable viTable = null;
	
	private DateField minDate;
	private DateField maxDate;
	private WPushButton show;
	private TestComboBox testNameCB;
	private TestComboBox testNameCB2;
	
	private int chartWidth;
	private int chartHeight;	
	
	public PatientChartForm(Patient p, int chartWidth, int chartHeight)
	{
		super(tr("form.patient.chart"));
		
		Transaction t = RegaDBMain.getApp().createTransaction();
		t.attach(p);
		
		this.chartWidth = chartWidth;
		this.chartHeight = chartHeight;

		WTable tabletests = new WTable(this);
		tabletests.getElementAt(0, 0).addWidget(new WLabel(tr("form.patient.chart.minDate")));
		minDate = new DateField(InteractionState.Editing, this);
		tabletests.getElementAt(0, 1).addWidget(minDate);
		tabletests.getElementAt(1, 0).addWidget(new WLabel(tr("form.patient.chart.maxDate")));
		maxDate = new DateField(InteractionState.Editing, this);
		tabletests.getElementAt(1, 1).addWidget(maxDate);
		tabletests.getElementAt(2, 0).addWidget(new WLabel(tr("form.patient.chart.YAxis")));
		testNameCB = new TestComboBox(InteractionState.Editing, this);
		tabletests.getElementAt(2, 1).addWidget(testNameCB);
		tabletests.getElementAt(3, 0).addWidget(new WLabel(tr("form.patient.chart.Y2Axis")));
		testNameCB2 = new TestComboBox(InteractionState.Editing, this);
		tabletests.getElementAt(3, 1).addWidget(testNameCB2);
		show = new WPushButton(tr("form.patient.chart.show"));
		tabletests.getElementAt(4, 1).addWidget(show);
		tabletests.setStyleClass("chart-date-limit");
		
		//Fill the combobox
		Transaction tra =  RegaDBMain.getApp().createTransaction();
		
		testNameCB.fillonlyNumbers(tra);
		testNameCB2.fillonlyNumbers(tra);
		
		Signal.Listener showAction = new Signal.Listener() {
			
			@Override
			public void trigger() {
				if(minDate.getDate() == null
						|| maxDate.getDate() == null
						|| !maxDate.getDate().after(minDate.getDate()))
					showChart(RegaDBMain.getApp().getSelectedPatient(), testNameCB.currentValue().getDescription(), 
							testNameCB2.currentValue().getDescription(), null, null);
				else  {
					showChart(RegaDBMain.getApp().getSelectedPatient(), 
							testNameCB.currentValue().getDescription(), 
							testNameCB2.currentValue().getDescription(),
							minDate.getDate(),
							maxDate.getDate());
				}
			}
		};
		
		show.clicked().addListener(this, showAction);
		minDate.enterPressed().addListener(this, showAction);
		maxDate.enterPressed().addListener(this, showAction);
		
		showChart(p, null, null, null,null);
		
		t.commit();
	}
	
	protected void showChart(Patient p,  String y, String y2, Date min, Date max){
		
		if(chart != null){
			chart.remove();
			viTable.remove();
		}
		
		chart = DefaultChart.createDefaultChart(this, p, y, y2, min, max, chartWidth, chartHeight);
		chart.clicked().addListener(this, new Signal1.Listener<WMouseEvent>() {
            public void trigger(WMouseEvent a) {
            	chartClicked(a);
            }
		});
		
		viTable = new WTable(this);
	}
	
	private void chartClicked(WMouseEvent a){
		WPointF c = new WPointF(a.getWidget());
		Date d = WDate.fromJulianDay((int)chart.mapFromDevice(c,Axis.XAxis).getX()).getDate();
		
		showClosestViralIsolate(d);
	}
	
	public void addFormField(IFormField field)
	{

	}

	public WContainerWidget getWContainer()
	{
		return this;
	}

    public WString leaveForm() {
        return null;
    }

	public void removeFormField(IFormField field) {

	}
	
	private int prevViralIsolateIi = -1;
	public void showClosestViralIsolate(Date date){
		Transaction t = RegaDBMain.getApp().createTransaction();
		Patient p = RegaDBMain.getApp().getSelectedPatient();
		
		List<ViralIsolate> vis = t.getViralIsolatesSortedOnDate(p);
		long diff = date.getTime();
		ViralIsolate v = null;
		for(ViralIsolate vi : vis){
			if(Math.abs(date.getTime() - vi.getSampleDate().getTime()) < diff){
				diff = Math.abs(date.getTime() - vi.getSampleDate().getTime());
				v = vi;
			}
			else
				break;
		}
		
		if(v == null || v.getViralIsolateIi() == prevViralIsolateIi)
			return;
		prevViralIsolateIi = v.getViralIsolateIi();
		
		viTable.clear();
		viTable.getElementAt(0, 0).addWidget(new WText(v.getSampleId(), TextFormat.PlainText));

		int i = 1;
		for(NtSequence nt : v.getNtSequences()){
			for(AaSequence aaseq : nt.getAaSequences()){
				viTable.getElementAt(i, 0).addWidget(new WText(aaseq.getProtein().getAbbreviation(),TextFormat.PlainText));
				viTable.getElementAt(i, 1).addWidget(new WText(MutationHelper.getNonSynonymousMutations(aaseq), TextFormat.PlainText));
				++i;
			}
		}
		
		t.commit();
	}
}
