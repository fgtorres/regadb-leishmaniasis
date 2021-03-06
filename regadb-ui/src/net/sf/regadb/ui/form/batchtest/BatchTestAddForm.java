package net.sf.regadb.ui.form.batchtest;

import net.sf.regadb.db.Genome;
import net.sf.regadb.db.Test;
import net.sf.regadb.db.Transaction;
import net.sf.regadb.ui.form.singlePatient.DataComboMessage;
import net.sf.regadb.ui.framework.RegaDBMain;
import net.sf.regadb.ui.framework.forms.FormWidget;
import net.sf.regadb.ui.framework.forms.InteractionState;
import net.sf.regadb.ui.framework.forms.fields.ComboBox;
import net.sf.regadb.ui.framework.forms.fields.Label;
import net.sf.regadb.ui.framework.widgets.formtable.FormTable;
import eu.webtoolkit.jwt.WString;

public abstract class BatchTestAddForm extends FormWidget {
	private ComboBox<Test> cmbTest;
	
	public BatchTestAddForm(WString formName, InteractionState interactionState) {
		super(formName, interactionState);
		init();
	}
	
	private void init()
    {
		FormTable table = new FormTable(this);
		Label testL = new Label(tr("form.batchtest.label.test"));
		cmbTest = new ComboBox<Test>(getInteractionState(), this);
		cmbTest.setMandatory(true);
		table.addLineToTable(testL, cmbTest);
		
		
		fillData();
		
		addControlButtons();
	}
	
	private void fillData() {
		Transaction tr = RegaDBMain.getApp().createTransaction();
		
		cmbTest.clearItems();
        for(Test t : tr.getTests())
        {
        	if ( t.getAnalysis() != null && !BatchTestRunningForm.containsRunningTest(t) ) {
        		Genome genome = t.getTestType().getGenome();
        		String genomeString = genome!=null?" ("+genome.getOrganismName()+")":"";
            	cmbTest.addItem(new DataComboMessage<Test>(t, t.getDescription() + genomeString));
        	}
        }
    	cmbTest.sort();
    	cmbTest.addNoSelectionItem();
    	cmbTest.selectIndex(0);
	}
	
	@Override
	public void cancel() {
	}
	
	@Override
	public WString deleteObject() {
		return null;
	}
	
	@Override
	public void redirectAfterDelete() {}
	
	@Override
	public void saveData() {
		Test t = cmbTest.currentValue();
		BatchTestRunningForm.runTest(RegaDBMain.getApp().getLogin().copyLogin(), t);
		try { Thread.sleep(100); } catch ( InterruptedException e ) { e.printStackTrace(); }
	}
}
