package net.sf.hivgensim.queries.framework.utils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;

import net.sf.regadb.db.AaSequence;
import net.sf.regadb.db.NtSequence;
import net.sf.regadb.db.TestResult;
import net.sf.regadb.db.ViralIsolate;
import net.sf.regadb.io.util.StandardObjects;

public class NtSequenceUtils {
	
	public static String resistance(NtSequence seq, String drug) {
		return resistance(seq, "Rega v8.0.2", drug);
	}
	public static String resistance(NtSequence seq, String algorithm, String drug){
		return ViralIsolateUtils.resistance(seq.getViralIsolate(), algorithm, drug);
	}
	
	public static List<NtSequence> sort(Set<NtSequence> sequences){
		List<NtSequence> result = new ArrayList<NtSequence>(sequences.size());
		result.addAll(sequences);

		Comparator<NtSequence> c = new Comparator<NtSequence>(){

			public int compare(NtSequence o1, NtSequence o2) {
				if(o1.getViralIsolate().getSampleDate() == null && o2.getViralIsolate().getSampleDate() == null){
					return 0;
				}
				if(o1.getViralIsolate().getSampleDate() == null || o2.getViralIsolate().getSampleDate() == null){
					return o1.getViralIsolate().getSampleDate() == null ? 1 : -1 ;
				}
				
				if(o1.getViralIsolate().getSampleDate().before(o2.getViralIsolate().getSampleDate()))
					return -1;
				if(o1.getViralIsolate().getSampleDate().after(o2.getViralIsolate().getSampleDate()))
					return 1;
				return 0;
			}
			
		};
		Collections.sort(result,c);
		return result;
	}
	
	public static boolean coversRegion(NtSequence ntseq, String organism, String protein, int  start, int  stop){
		for(AaSequence aaseq : ntseq.getAaSequences()){
			if(AaSequenceUtils.coversRegion(aaseq, organism, protein, start, stop)){
				return true;
			}
		}
		return false;		
	}
	
	public static boolean coversRegion(NtSequence ntseq, String organism, String protein){
		for(AaSequence aaseq : ntseq.getAaSequences()){
			if(AaSequenceUtils.coversRegion(aaseq, organism, protein)){
				return true;
			}
		}
		return false;
	}

	public static Set<NtSequence> getLatestNtSequences(Collection<NtSequence> sequences){
		ViralIsolate latest = null;
		for(NtSequence seq : sequences){
			if(latest == null || seq.getViralIsolate().getSampleDate().after(latest.getSampleDate())){
				latest = seq.getViralIsolate();
			}
		}
		if(latest != null){
			return latest.getNtSequences();
		}
		return null;
	}
	
	public static NtSequence getLatestNtSequence(Collection<NtSequence> sequences){
		if(sequences.isEmpty()){
			return null;
		}
		NtSequence latest = null;
		for(NtSequence seq : sequences){
			if(latest == null || seq.getViralIsolate().getSampleDate().after(latest.getViralIsolate().getSampleDate())){
				latest = seq;
			}
		}
		return latest;
	}

	public static String getSubtype(NtSequence input){
		for(TestResult tr : input.getTestResults()){
			if(StandardObjects.getSubtypeTestDescription().equals(tr.getTest().getDescription())){
				return tr.getValue();
			}
		}
		return "";
	}

}
