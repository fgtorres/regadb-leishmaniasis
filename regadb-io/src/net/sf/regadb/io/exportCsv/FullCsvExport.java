package net.sf.regadb.io.exportCsv;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import net.sf.regadb.db.AaSequence;
import net.sf.regadb.db.Attribute;
import net.sf.regadb.db.DrugClass;
import net.sf.regadb.db.DrugGeneric;
import net.sf.regadb.db.NtSequence;
import net.sf.regadb.db.Patient;
import net.sf.regadb.db.PatientAttributeValue;
import net.sf.regadb.db.PatientEventValue;
import net.sf.regadb.db.Test;
import net.sf.regadb.db.TestResult;
import net.sf.regadb.db.TestType;
import net.sf.regadb.db.Therapy;
import net.sf.regadb.db.TherapyCommercial;
import net.sf.regadb.db.TherapyGeneric;
import net.sf.regadb.db.Transaction;
import net.sf.regadb.db.ValueTypes;
import net.sf.regadb.db.ViralIsolate;
import net.sf.regadb.db.login.DisabledUserException;
import net.sf.regadb.db.login.WrongPasswordException;
import net.sf.regadb.db.login.WrongUidException;
import net.sf.regadb.db.session.Login;
import net.sf.regadb.db.tools.MutationHelper;
import net.sf.regadb.io.export.ExportPatient;
import net.sf.regadb.io.export.PatientExporter;
import net.sf.regadb.io.util.StandardObjects;
import net.sf.regadb.util.args.Argument;
import net.sf.regadb.util.args.Arguments;
import net.sf.regadb.util.args.PositionalArgument;
import net.sf.regadb.util.args.ValueArgument;
import net.sf.regadb.util.date.DateUtils;
import net.sf.regadb.util.file.FileUtils;
import net.sf.regadb.util.settings.RegaDBSettings;

import org.hibernate.Query;

public class FullCsvExport implements ExportPatient {
	private Map<String, String> resistanceResults = new HashMap<String, String>();
	
	private Map<String, File> files = new HashMap<String, File>();
	
	private FileWriter patientFileWriter;
	private FileWriter eventFileWriter;
	private FileWriter testFileWriter;
	private FileWriter therapyFileWriter;
	private FileWriter viralIsolateFileWriter;
	private FileWriter resistanceFileWriter;
	
	private long maxNumberSeqs;
	private List<Attribute> attributes;
	private List<String> resistanceTestDrugs;
	private File zipFile;
	
	boolean exportMutations;
	
	private ArrayList<String> proteins;
	private ArrayList<Integer> proteinIis;
	
	public FullCsvExport(long maxNumberSeqs, List<Attribute> attributes, List<String> resistanceTestDrugs, File zipFile, boolean exportMutations) throws IOException {
		File patientFile = File.createTempFile("patients", "csv");
		files.put("patients.csv", patientFile);
		patientFileWriter = new FileWriter(patientFile);

		File eventFile = File.createTempFile("events", "csv");
		files.put("events.csv", eventFile);
		eventFileWriter = new FileWriter(eventFile);

		File testFile = File.createTempFile("tests", "csv");
		files.put("tests.csv", testFile);
		testFileWriter = new FileWriter(testFile);

		File therapyFile = File.createTempFile("therapies", "csv");
		files.put("therapies.csv", therapyFile);
		therapyFileWriter = new FileWriter(therapyFile);

		File viralIsolateFile = File.createTempFile("viral_isolates", "csv");
		files.put("viral_isolates.csv", viralIsolateFile);
		viralIsolateFileWriter = new FileWriter(viralIsolateFile);

		File resistanceFile = File.createTempFile("resistance", "csv");
		files.put("resistance.csv", resistanceFile);
		resistanceFileWriter = new FileWriter(resistanceFile);
		
		this.maxNumberSeqs = maxNumberSeqs;
		this.attributes = attributes;
		this.resistanceTestDrugs = resistanceTestDrugs;
		this.zipFile = zipFile;
		this.exportMutations = exportMutations;
		
		Collections.sort(attributes, new Comparator<Attribute>(){
			public int compare(Attribute a0, Attribute a1) {
				return a0.getName().compareTo(a1.getName());
			}
		});
	}

	private void therapyRow(Patient p, Therapy t, FileWriter fw) throws IOException {
		StringBuilder row = new StringBuilder();
		
		formatField(row, p.getPatientId());
		formatField(row, t.getStartDate());
		formatField(row, t.getStopDate());
		formatField(row, t.getTherapyMotivation()==null?"":t.getTherapyMotivation().getValue());
		
		Set<String> haart = new TreeSet<String>();
		for(TherapyCommercial tc : t.getTherapyCommercials()) {
			for(DrugGeneric dg : tc.getId().getDrugCommercial().getDrugGenerics()) {
				haart.add(dg.getGenericId());
			}
		}
		for(TherapyGeneric tg : t.getTherapyGenerics()) {
			haart.add(tg.getId().getDrugGeneric().getGenericId());
		}
		
		StringBuilder sb = new StringBuilder();
		for(String genericId : haart)
			sb.append(genericId).append(' ');
		
		formatField(row, sb.toString(), false);
		
		fw.append(row.toString());
	}
	
	private void viralIsolateHeader(FileWriter fw, long maxNumberSeqs) throws IOException {
		StringBuilder header = new StringBuilder();
		
		formatField(header, "patient_id");
		formatField(header, "sample_date");
		formatField(header, "sample_id");
		for(int i = 0; i<maxNumberSeqs; i++) {
			formatField(header, "sequence_"+(i+1));
		}
		
		for(String protein : proteins)
			formatField(header, protein);

		int i=proteins.size();
		for(String protein : proteins)
			formatField(header, "evolution "+ protein, --i > 0);
		
		fw.append(header.toString());
	}
	
	private void viralIsolateRow(Patient p, ViralIsolate vi, ViralIsolate prev, FileWriter fw, long maxNumberSeqs) throws IOException {
		StringBuilder row = new StringBuilder();
		
		
		formatField(row, p.getPatientId());
		formatField(row, vi.getSampleDate());
		formatField(row, vi.getSampleId());
		
		List<NtSequence> ntseqs = new ArrayList<NtSequence>(vi.getNtSequences());
		Collections.sort(ntseqs, new Comparator<NtSequence>(){
			@Override
			public int compare(NtSequence o1, NtSequence o2) {
				return o1.getNtSequenceIi().compareTo(o2.getNtSequenceIi());
			}
		});
		
		for(int i = 0; i<maxNumberSeqs; i++) {
			if(i<ntseqs.size())
				formatField(row, ntseqs.get(i).getNucleotides());
			else 
				formatField(row, "");
		}
		
		if(exportMutations){
			Map<Integer,AaSequence> aaseqs = getProteinAaSequenceMap(vi);
			
			for(Integer proteinIi : proteinIis){
				AaSequence aaseq = aaseqs.get(proteinIi);
				formatField(row, aaseq == null ? "" : MutationHelper.getNonSynonymousMutations(aaseq));
			}
			
			StringBuilder sb = new StringBuilder();
			if(prev != null){
				Map<Integer, AaSequence> prevaaseqs = getProteinAaSequenceMap(prev);
				
				for(Integer proteinIi : proteinIis){
					AaSequence prevaaseq = prevaaseqs.get(proteinIi);
					AaSequence aaseq = aaseqs.get(proteinIi);
					
					if(prevaaseq != null && aaseq != null){
						String diff = MutationHelper.getAaMutationDifferenceList(prevaaseq, aaseq);
						formatField(row, diff == null ? "" : diff);
					}
					else
						formatField(row, "");
				}
			}
			formatField(row,sb.toString(),false);
		}
		else{
			formatField(row,"");
			formatField(row,"",false);
		}
		
		fw.append(row.toString());
	}

	
	private static final Comparator<AaSequence> aaSequenceComparator = new Comparator<AaSequence>() {
		public int compare(AaSequence arg0, AaSequence arg1) {
			int c;
			if((c = arg0.getProtein().getOpenReadingFrame().getName().compareTo(
					arg1.getProtein().getOpenReadingFrame().getName())) != 0)
				return c;
			
			return arg0.getProtein().getStartPosition() - arg1.getProtein().getStartPosition();
		}
	};

	private static Map<Integer,AaSequence> getProteinAaSequenceMap(ViralIsolate vi){
		Map<Integer,AaSequence> aaseqs = new TreeMap<Integer,AaSequence>();
		for(NtSequence ntseq : vi.getNtSequences())
			for(AaSequence aaseq : ntseq.getAaSequences())
				aaseqs.put(aaseq.getProtein().getProteinIi(), aaseq);
		return aaseqs;
	}
	
	private void therapyHeader(FileWriter fw) throws IOException {
		StringBuilder header = new StringBuilder();
		
		formatField(header, "patient_id");
		formatField(header, "start_date");
		formatField(header, "stop_date");
		formatField(header, "stop_reason");
		formatField(header, "HAART (generic format)", false);
		
		fw.append(header.toString());
	}
	
	private void testHeader(FileWriter fw) throws IOException {
		StringBuilder header = new StringBuilder();
		
		formatField(header, "patient_id");
		formatField(header, "test");
		formatField(header, "test_type");
		formatField(header, "date");
		formatField(header, "sample_id");
		formatField(header, "value", false);
		
		fw.append(header.toString());
	}
	
	private void testRow(Patient p, TestResult tr, FileWriter fw) throws IOException {
		if (tr.getTest().getAnalysis() != null)
			return;
		
		StringBuilder row = new StringBuilder();
		
		formatField(row, p.getPatientId());
		formatField(row, tr.getTest().getDescription());
		formatField(row, tr.getTest().getTestType().getDescription());
		formatField(row, tr.getTestDate());
		formatField(row, tr.getSampleId());
		formatField(row, getValue(tr), false);
		
		fw.append(row.toString());
	}
	
	private String getValue(TestResult tr){
		if(tr.getValue() != null)
			return tr.getValue();
		if(tr.getTestNominalValue() != null)
			return tr.getTestNominalValue().getValue();
		if(tr.getData() != null)
			return new String(tr.getData());
		return "";
	}

	private void eventHeader(FileWriter fw) throws IOException {
		StringBuilder header = new StringBuilder();
		
		formatField(header, "patient_id");
		formatField(header, "event");
		formatField(header, "start_date");
		formatField(header, "end_date");
		formatField(header, "value", false);
		
		fw.append(header.toString());
	}
	
	private void eventRow(Patient p, PatientEventValue pev, FileWriter fw) throws IOException {
		StringBuilder row = new StringBuilder();
		
		formatField(row, p.getPatientId());
		formatField(row, pev.getEvent().getName());
		formatField(row, pev.getStartDate());
		formatField(row, pev.getEndDate());
		formatField(row, pev.getValue()==null?pev.getEventNominalValue().getValue():pev.getValue(), false);
		
		fw.append(row.toString());
	}

	private void patientHeader(FileWriter fw, List<Attribute> sortedAttributes) throws IOException {
		StringBuilder header = new StringBuilder();
		
		formatField(header, "patient_id");
		
		for(int i = 0; i<sortedAttributes.size(); i++) {
			formatField(header, sortedAttributes.get(i).getName(), i!=sortedAttributes.size()-1);
		}
		
		fw.append(header.toString());
	}
	
	private void patientRow(Patient p, FileWriter fw, List<Attribute> sortedAttributes) throws IOException {
		StringBuilder row = new StringBuilder();
		
		formatField(row, p.getPatientId());
		
		for(int i = 0; i<sortedAttributes.size(); i++) {
			boolean found = false;
			for(PatientAttributeValue pav : p.getPatientAttributeValues()) {
				if(pav.getAttribute().getName().equals(sortedAttributes.get(i).getName())) {
					found = true;
					String value = pav.getValue()==null ?
							(pav.getAttributeNominalValue() == null ? "" : pav.getAttributeNominalValue().getValue()) : pav.getValue();
					ValueTypes vt = ValueTypes.getValueType(pav.getAttribute().getValueType());
                    if(vt == ValueTypes.DATE){
                        value = DateUtils.format(value);
                    }
					formatField(row, value, i!=sortedAttributes.size()-1);
				}
			}
			if(!found)
				formatField(row, "", i!=sortedAttributes.size()-1);
		}
		
		fw.append(row.toString());
	}
	
	private void resistanceHeader(FileWriter resistanceFileWriter, List<String> resistanceTestsDrugs) throws IOException {
		StringBuilder header = new StringBuilder();
		
		formatField(header, "patient_id");
		formatField(header, "sample_date");
		formatField(header, "sample_id");
		
		for(String rtd : resistanceTestsDrugs) {
			formatField(header, rtd);
		}
		
		resistanceFileWriter.append(header.substring(0,header.length()-1)+"\n");
	}
	
	private void resistanceRow(FileWriter resistanceFileWriter, Patient p, ViralIsolate vi, List<String> resistanceTestDrugs) throws IOException {
		StringBuilder row = new StringBuilder();
		
		resistanceResults.clear();
		
		formatField(row, p.getPatientId());
		formatField(row, vi.getSampleDate());
		formatField(row, vi.getSampleId());
		for(TestResult tr : vi.getTestResults()) {
			TestType tt = tr.getTest().getTestType();
			if(tt.getDescription().equals(StandardObjects.getGssDescription())) {
				resistanceResults.put(tr.getTest().getDescription()+"_"+tr.getDrugGeneric().getGenericId()+"_"+tt.getGenome().getOrganismName(), tr.getValue());
			}
		}
		for(String rtd : resistanceTestDrugs) {
			formatField(row, resistanceResults.get(rtd));
		}
		
		resistanceFileWriter.append(row.substring(0,row.length()-1)+"\n");
	}
		
	
	private void formatField(StringBuilder sb, String field) {
		formatField(sb, field, true);
	}
	private void formatField(StringBuilder sb, String field, boolean comma) {
		if(field == null)
			field = "";
		sb.append("\""+field+"\"");
		if(comma)
			sb.append(";");
		else
			sb.append("\n");
	}
	
	private void formatField(StringBuilder sb, Date field) {
		formatField(sb, field, true);
	}
	private void formatField(StringBuilder sb, Date field, boolean comma) {
		if(field == null)
			sb.append("\"\"");
		else 
			sb.append("\""+field.toString()+"\"");
		
		if(comma)
			sb.append(";");
		else
			sb.append("\n");
	}

	private static final Comparator<ViralIsolate> viralIsolateComparator = new Comparator<ViralIsolate>() {
		public int compare(ViralIsolate o1, ViralIsolate o2) {
			int c = o1.getSampleDate().compareTo(o2.getSampleDate());
			return c == 0 ? o1.getSampleId().compareTo(o2.getSampleId()) : c;
		}
	};
	
	public void exportPatient(Transaction t, Patient p) {
		try {
			patientRow(p, patientFileWriter, attributes);

			for (PatientEventValue pev : p.getPatientEventValues()) {
				eventRow(p, pev, eventFileWriter);
			}
			for (TestResult tr : p.getTestResults()) {
				testRow(p, tr, testFileWriter);
			}
			for (Therapy th : p.getTherapies()) {
				therapyRow(p, th, therapyFileWriter);
			}
			TreeSet<ViralIsolate> vis = new TreeSet<ViralIsolate>(viralIsolateComparator);
			for (ViralIsolate vi : p.getViralIsolates())
				vis.add(vi);
			
			ViralIsolate prev = null;
			for (ViralIsolate vi : vis) {
				viralIsolateRow(p, vi, prev, viralIsolateFileWriter, maxNumberSeqs);
				resistanceRow(resistanceFileWriter, p, vi, resistanceTestDrugs);
				prev = vi;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void start(Transaction t) {
		try {
			Query q = t.createQuery("select g.organismName, p.abbreviation, p.proteinIi " +
					"from AaSequence aa join aa.protein p join p.openReadingFrame orf join orf.genome g " +
					"group by g.organismName, p.abbreviation, p.proteinIi order by g.organismName, p.abbreviation");
			List<Object[]> l = q.list();
			
			proteins = new ArrayList<String>();
			proteinIis = new ArrayList<Integer>();
			
			for(Object[] o : l){
				proteins.add(o[0] +" "+ o[1]);
				proteinIis.add((Integer)o[2]);
			}
			
			
			patientHeader(patientFileWriter, attributes);
			eventHeader(eventFileWriter);
			testHeader(testFileWriter);
			therapyHeader(therapyFileWriter);
			viralIsolateHeader(viralIsolateFileWriter, maxNumberSeqs);
			resistanceHeader(resistanceFileWriter, resistanceTestDrugs);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void stop(Transaction t) {
		try {
			patientFileWriter.close();
			eventFileWriter.close();
			testFileWriter.close();
			therapyFileWriter.close();
			viralIsolateFileWriter.close();
			resistanceFileWriter.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	    try {
			FileUtils.createZipFile(zipFile, files);
	    } catch (IOException ioe) {
	    	ioe.printStackTrace();
	    }
	    
	    for(File f : files.values()) {
	    	f.delete();
	    }
	}
	
	public static void main(String args[]) throws IOException, WrongUidException, WrongPasswordException, DisabledUserException{
		Arguments as = new Arguments();
    	ValueArgument confDir = as.addValueArgument("c", "conf-dir", false);
    	PositionalArgument user = as.addPositionalArgument("user", true);
    	PositionalArgument pass = as.addPositionalArgument("pass", true);
    	PositionalArgument dataset = as.addPositionalArgument("dataset", true);
    	PositionalArgument file = as.addPositionalArgument("output-file", true);
    	Argument muts = as.addArgument("muts", false);
    	
    	if(!as.handle(args))
    		return;
    	
    	if(confDir.isSet())
    		RegaDBSettings.createInstance(confDir.getValue());
    	else
    		RegaDBSettings.createInstance();
    	
        Login login = null;
        login = Login.authenticate(user.getValue(), pass.getValue());

        Transaction t = login.createTransaction();
        
        List<String> resistanceTestsDrugs = new ArrayList<String>();
        for(Test test : t.getTests()) {
            if(test.getTestType().getDescription().equals(StandardObjects.getGssDescription()) ) {
                for(DrugClass dc : t.getDrugClassesSortedOnResistanceRanking()) {
                	for(DrugGeneric dg : t.getDrugGenericSortedOnResistanceRanking(dc)) {
                		resistanceTestsDrugs.add(test.getDescription() + "_" + dg.getGenericId()+"_"+test.getTestType().getGenome().getOrganismName());
                	}
                }
            }
        }
        
		FullCsvExport fullCsvExport = new FullCsvExport(t.getMaxAmountOfSequences(), t.getAttributes(), resistanceTestsDrugs,
				new File(file.getValue()), muts.isSet());
		t.commit();
		
        PatientExporter<Patient> csvExport = new PatientExporter<Patient>(login, dataset.getValue(), fullCsvExport);
        csvExport.run();
	}
}