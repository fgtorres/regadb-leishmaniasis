package net.sf.regadb.ui.form.singlePatient.chart;

import net.sf.regadb.db.Genome;
import net.sf.regadb.db.TestResult;
import net.sf.regadb.db.TestType;
import net.sf.regadb.db.ValueTypes;
import net.sf.regadb.util.settings.PatientChartConfig;
import eu.webtoolkit.jwt.chart.Axis;

public class ViralLoadSeries extends LimitedValueSeries {
	private Genome genome;
	private PatientChartConfig.Item item;
	
	public ViralLoadSeries(Genome genome, PatientChartConfig.Item item, Axis axis) {
		super(null, axis);
		setGenome(genome);
		this.item = item;
		setValueType(ValueTypes.LIMITED_NUMBER);
	}
	
	public Genome getGenome(){
		return genome;
	}
	
	public void setGenome(Genome genome){
		this.genome = genome;
	}

	@Override
	public String getName(){
		return item.name.replace("${organism}", genome.getOrganismName());
	}

	@Override
	public boolean isOk(TestResult tr){
		if(tr.getTestDate() == null || getResults().containsKey(tr.getTestDate()))
			return false;
		
		TestType tt = tr.getTest().getTestType();
		boolean organismMatch = tt.getGenome() != null && tt.getGenome().getOrganismName().equals(getGenome().getOrganismName());
		
		PatientChartConfig.TestType ctt = findTestType(tr.getTest().getTestType().getDescription());
		boolean testTypeMatch = ctt != null;
		
		return organismMatch && testTypeMatch;
	}
	
	private PatientChartConfig.TestType findTestType(String description) {
		for (PatientChartConfig.TestType ctt : item.testTypes) {
			if (description.equals(ctt.type)) {
				return ctt;
			}
		}
		return null;
	}
	
	@Override
	public Object getValue(TestResult tr){
		Double val = (Double)super.getValue(tr);
		
		PatientChartConfig.TestType ctt = findTestType(tr.getTest().getTestType().getDescription());
		if (ctt.log)
			return val;
		else 
			return val.doubleValue() <= 0 ? 0 : Math.log10(val);
	}
}
