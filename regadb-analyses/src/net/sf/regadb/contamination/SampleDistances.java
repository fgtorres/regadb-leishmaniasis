package net.sf.regadb.contamination;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

import net.sf.regadb.contamination.SequenceDistancesQuery.OutputType;
import net.sf.regadb.contamination.SequenceDistancesQuery.Range;
import net.sf.regadb.db.NtSequence;
import net.sf.regadb.db.Transaction;
import net.sf.regadb.db.login.DisabledUserException;
import net.sf.regadb.db.login.WrongPasswordException;
import net.sf.regadb.db.login.WrongUidException;
import net.sf.regadb.db.session.Login;
import net.sf.regadb.sequencedb.SequenceDb;
import net.sf.regadb.sequencedb.SequenceUtils.SequenceDistance;
import net.sf.regadb.util.args.Arguments;
import net.sf.regadb.util.args.PositionalArgument;
import net.sf.regadb.util.args.ValueArgument;
import net.sf.regadb.util.settings.RegaDBSettings;

import org.hibernate.CacheMode;
import org.hibernate.Query;
import org.hibernate.ScrollableResults;

public class SampleDistances {
	public static void main(String [] args) throws WrongUidException, WrongPasswordException, DisabledUserException, IOException {
		Arguments as = new Arguments();
		PositionalArgument user = as.addPositionalArgument("user", true);
		PositionalArgument pass = as.addPositionalArgument("pass", true);
		PositionalArgument file = as.addPositionalArgument("outputfile.csv", true);
		PositionalArgument orf = as.addPositionalArgument("orf", true);
		PositionalArgument reg = as.addPositionalArgument("region", true);
		ValueArgument type = as.addNominalArgument("type", Arrays.asList("I", "O"), false).setValue("I");
		ValueArgument confDir = as.addValueArgument("c", "conf-dir", false);
		
		if(!as.handle(args))
			return;
		
		if(confDir.isSet())
			RegaDBSettings.createInstance(confDir.getValue());
		else
			RegaDBSettings.createInstance();
		
		SequenceDb db = SequenceDb.getInstance(RegaDBSettings.getInstance().getSequenceDatabaseConfig().getPath());
		
		Login login = Login.authenticate(user.getValue(), pass.getValue());
		Transaction t = login.createTransaction();
		db.init(t);
		t.commit();
		
		t = login.createTransaction();
		Query q = t.createQuery("from NtSequence");
		q.setCacheMode(CacheMode.IGNORE);
		ScrollableResults r = q.scroll();
		
		FileWriter fw = new FileWriter(new File(file.getValue()));
		
		OutputType outputType = null;
		if (type.getValue().equals("I"))
			outputType = OutputType.IntraPatient;
		else if (type.getValue().equals("O"))
			outputType = OutputType.ExtraPatient;
		
		Range range = new Range();
		range.orf = orf.getValue();
		
		String region[] = reg.getValue().split("-");
		range.start = Integer.parseInt(region[0]);
		range.end = Integer.parseInt(region[1]);
		
		int i = 0;
		long start = System.currentTimeMillis();
		while (r.next()) {
			NtSequence seq = (NtSequence)r.get(0);
			
			SequenceDistancesQuery distances = new SequenceDistancesQuery(seq, outputType, range);
			db.query(seq.getViralIsolate().getGenome(), distances);
			
			for (Map.Entry<Integer, SequenceDistance> e : distances.getSequenceDistances().entrySet()) {
				if (e.getKey().equals(seq.getNtSequenceIi())) {
					continue;
				}
				
				SequenceDistance f = e.getValue();
				
				double diff = ((double)f.numberOfDifferences/f.numberOfPositions);
				if (f.numberOfPositions != 0){
					fw.write(type.getValue() + "," + diff + "\n");
					fw.flush();
				}
			}
			
			if (i % 100 == 0) {
				System.err.println("time:" + ((System.currentTimeMillis() - start) / 1000));
				start = System.currentTimeMillis();
				t.clearCache();
			}
			
			i++;
			System.err.println("Processed " + i);
		}
		
		fw.close();
	}
}
