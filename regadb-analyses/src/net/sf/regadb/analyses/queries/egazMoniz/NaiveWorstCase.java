package net.sf.regadb.analyses.queries.egazMoniz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.regadb.analysis.functions.ResistanceInterpretationHelper;
import net.sf.regadb.db.DrugClass;
import net.sf.regadb.db.Patient;
import net.sf.regadb.db.TestResult;
import net.sf.regadb.db.ViralIsolate;
import net.sf.regadb.io.util.StandardObjects;

public class NaiveWorstCase {

	public static void main(String[] args){
		
		List<Patient> pts = Utils.getPatients();
		List<DrugClass> dcs = Utils.getDrugClasses();
		
		System.out.print("patient id, sequence date, number of therapies ");
		for(DrugClass dc : dcs){
			System.out.print(","+dc.getClassId());
		}
		System.out.println();
		
		Map<String, Double> dm = new HashMap<String, Double>();
		
		for(Patient p : pts){
			ViralIsolate vi = Utils.getNaiveViralIsolate(p);
			if(vi==null)
				continue;
			
				for(TestResult tr : vi.getTestResults()){
					if(tr.getTest().getTestType().getDescription().equals(StandardObjects.getGssDescription())) {
						DrugClass dc = tr.getDrugGeneric().getDrugClass();
						if(tr.getTest().getDescription().contains("HIVDB")) {
							double d = Double.parseDouble(tr.getValue());
							Double currentValue = dm.get(dc.getClassId());
							if(currentValue==null || d<currentValue)
								dm.put(dc.getClassId(), d);
						}
					}
				}
			
			System.out.print(p.getPatientId() +",");
			System.out.print(vi.getSampleId()+",");
			System.out.print(p.getTherapies().size());
			for(DrugClass dc : dcs){
				Double d = dm.get(dc.getClassId());
				System.out.print(","+ResistanceInterpretationHelper.getSIRRepresentation(d));
			}
			System.out.println();
			dm.clear();
		}
	}
}