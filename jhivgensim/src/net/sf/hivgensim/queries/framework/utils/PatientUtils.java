package net.sf.hivgensim.queries.framework.utils;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import net.sf.regadb.db.Dataset;
import net.sf.regadb.db.NtSequence;
import net.sf.regadb.db.Patient;
import net.sf.regadb.db.PatientAttributeValue;
import net.sf.regadb.db.Therapy;
import net.sf.regadb.db.ValueTypes;
import net.sf.regadb.db.ViralIsolate;

public class PatientUtils {

	public static Set<NtSequence> getSequences(Patient p){
		Set<NtSequence> set = new HashSet<NtSequence>();
		for(ViralIsolate vi : p.getViralIsolates()){
			set.addAll(vi.getNtSequences());
		}
		return set;
	}

	public static Set<NtSequence> getSequences(Patient p, Date d, int days){
		Set<NtSequence> seqs = new HashSet<NtSequence>();
		for(NtSequence seq : getSequences(p)){
			Date sdate = seq.getViralIsolate().getSampleDate();
			if(sdate != null && DateUtils.betweenInterval(sdate, DateUtils.addDaysToDate(d, -days), DateUtils.addDaysToDate(d, days))){

				seqs.add(seq);
			}
		}
		return seqs;
	}

	public static Set<NtSequence> getSequencesForProtein(Patient p, Therapy t, int days, String protein) {
		Set<NtSequence> seqs = new HashSet<NtSequence>();
		for (NtSequence seq : PatientUtils.getSequences(p, t.getStartDate(),days)) {
			if (NtSequenceUtils.coversRegion(seq, "HIV-1", protein)) {
				seqs.add(seq);
			}
		}
		return seqs;
	}

	public static Dataset getDatasource(Patient p) {
		for (Dataset ds : p.getDatasets()) {
			if (ds.getClosedDate() == null) {
				return ds;
			}
		}
		return null;
	}
	
	public static String getPatientAttributeValue(Patient p, String attributeName) {
		for(PatientAttributeValue pav : p.getPatientAttributeValues()) {
			if(pav.getAttribute().getName().equals(attributeName)) {
				if(ValueTypes.getValueType(pav.getAttribute().getValueType())==ValueTypes.NOMINAL_VALUE) {
					return pav.getAttributeNominalValue().getValue();
				} else {
					return pav.getValue();
				}
			}
		}

		return null;
	}
}
