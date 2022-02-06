package net.sf.regadb.io.db.sequenceTests;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.regadb.db.Dataset;
import net.sf.regadb.db.NtSequence;
import net.sf.regadb.db.Patient;
import net.sf.regadb.db.Transaction;
import net.sf.regadb.db.ViralIsolate;
import net.sf.regadb.db.login.DisabledUserException;
import net.sf.regadb.db.login.WrongPasswordException;
import net.sf.regadb.db.login.WrongUidException;
import net.sf.regadb.db.session.Login;

public class ImportSequenceUtils {

	public static Login getLogin(String username, String password) throws WrongUidException, WrongPasswordException, DisabledUserException {		
		return Login.authenticate(username, password);
	}
	
	public static Patient getPatient(String patientId, Transaction tr, Dataset dataset) {
		Patient p = null;
		
		if (dataset == null) {
			List<Patient> patients = new ArrayList<Patient>();
			for (Dataset d : tr.getDatasets()) {
				Patient _p = tr.getPatient(d, patientId);
				if (_p != null)
					patients.add(_p);
			}
			if (patients.size() > 1) {
				//TODO Throw exception
				System.err.println("Error: More than one patient with id \"" + patientId + "\" was retrieved.");
				System.exit(1);
			} else if (patients.size() == 1) {
				p = patients.get(0);
			}
		} else {
			p = tr.getPatient(dataset, patientId);
		}	
		return p;
	}
	
	public static NtSequence getNtSequence(String patientId, String sampleId,
			String sequenceLabel, ViralIsolate vi) {
		NtSequence seq = null;
		for (NtSequence _seq : vi.getNtSequences()) {
			if (sequenceLabel.equals(_seq.getLabel())) {
				seq = _seq;
				break;
			}
		}
		return seq;
	}
	
	public static ViralIsolate getViralIsolate(String sampleId, Patient p) {
		ViralIsolate vi = null;
		for (ViralIsolate _vi : p.getViralIsolates()) {
			if (sampleId.equals(_vi.getSampleId())) {
				vi = _vi;
				break;
			}
		}
		return vi;
	}
	
	public static Map<String, Integer> getColumnIndexMap(List<String> columnNames) {
		Map<String, Integer> m = new HashMap<String, Integer>();
		int index = 0;
		for (String cn : columnNames) {
			m.put(cn, index);
			++index;
		}
		return m;
	}
}
