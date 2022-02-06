package net.sf.regadb.io.db.sequenceTests;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import net.sf.regadb.csv.Table;
import net.sf.regadb.db.Dataset;
import net.sf.regadb.db.NtSequence;
import net.sf.regadb.db.Patient;
import net.sf.regadb.db.Transaction;
import net.sf.regadb.db.ViralIsolate;
import net.sf.regadb.db.login.DisabledUserException;
import net.sf.regadb.db.login.WrongPasswordException;
import net.sf.regadb.db.login.WrongUidException;
import net.sf.regadb.db.session.Login;
import net.sf.regadb.util.args.Arguments;
import net.sf.regadb.util.args.PositionalArgument;
import net.sf.regadb.util.args.ValueArgument;
import net.sf.regadb.util.settings.RegaDBSettings;

public class UpdateSequenceDate {
	
	/*
	 * The expected date format for the date is yyyy/MM/dd
	 * yyyy is the year represented with 4 digits
	 * MM is the month of the year represented by 2 digits (01-12)
	 * dd is the day in the month represented by 2 digits (01-31)
	 */
	
	public static void main(String[] args) throws WrongUidException, WrongPasswordException, DisabledUserException, IOException, ParseException {
    	Arguments as = new Arguments();
    	PositionalArgument user = as.addPositionalArgument("user", true);
    	PositionalArgument pass = as.addPositionalArgument("pass", true);
    	PositionalArgument inputCsv = as.addPositionalArgument("input.csv", true);
    	PositionalArgument ds = as.addPositionalArgument("dataset", false);
    	ValueArgument conf = as.addValueArgument("conf-dir", "configuration directory", false);
    	
    	if(!as.handle(args))
    		return;
    	
    	if(conf.isSet())
        	RegaDBSettings.createInstance(conf.getValue());
        else
        	RegaDBSettings.createInstance();
        
    	Login login = Login.authenticate(user.getValue(), pass.getValue());
        
        BufferedReader br = new BufferedReader(new FileReader(inputCsv.getValue()));
        try {
        	//first line of the CSV file; these are the col names
            String line = br.readLine();
            if (line == null)
            	throw new RuntimeException("Empty CSV file!");
            
            ArrayList<String> columnNames = Table.splitHandleQuotes(line, ',', '"', '\\');
            Map<String, Integer> ci = ImportSequenceUtils.getColumnIndexMap(columnNames);
            
            //rest of the CSV file
            line = br.readLine();
            while (line != null) {
            	ArrayList<String> cells = Table.splitHandleQuotes(line, ',', '"', '\\');
            	
            	String patientId = cells.get(ci.get("patient-id"));
            	String sampleId = cells.get(ci.get("sample-id"));
            	String sequenceLabel = cells.get(ci.get("sequence-label"));
            	String sequenceDate = cells.get(ci.get("sequence-date"));
            	
            	Transaction tr = login.createTransaction();
            	
            	Dataset dataset = null;
        		if (ds.isSet()) {
        			System.err.println("Dataset: " + ds.getValue());
        			dataset = tr.getDataset(ds.getValue());
        		}
        		
            	Patient p = ImportSequenceUtils.getPatient(patientId, tr, dataset);
            	
            	if (p == null) {
        			System.err.println("Error: Could not find patient with id \"" + patientId + "\".");
        			System.exit(1);
            	}
            	
            	ViralIsolate vi = ImportSequenceUtils.getViralIsolate(sampleId, p);
            	
            	if (vi == null) {
        			System.err.println("Error: Could not find isolate with id \"" + sampleId + "\" in patient with id \"" + p.getPatientId() + "\"");
        			System.exit(1);
            	}
            	
            	NtSequence seq = ImportSequenceUtils.getNtSequence(patientId, sampleId, sequenceLabel, vi);
            	
            	if (seq == null) {
        			System.err.println("Error: Could not find sequence with label \"" + sequenceLabel + "\" in isolate with id \"" + sampleId + "\" in patient with id \"" + patientId + "\"");
        			System.exit(1);
        		}
				
				if (sequenceDate != null && !sequenceDate.trim().equals("")) {
					Date date = null;
					try {
						date = new SimpleDateFormat("yyyy/MM/dd").parse(sequenceDate);
					} catch (ParseException e) {
						System.err.println("Error: Could not parse date \"" + date + "\".");
						System.exit(1);
						throw e;
					}
					
					seq.setSequenceDate(date);
	            	tr.save(seq);
            	}
            	
            	tr.commit();
            	
            	System.err.println("Updated sequence date for sequence \"" + sequenceLabel + "\" viral isolate \"" + sampleId + "\"");            	
            	
            	line = br.readLine();
            }
        } finally {
            br.close();
        }
        
	}
}
