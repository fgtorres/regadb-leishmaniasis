package net.sf.hivgensim.queries;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.util.HashMap;
import java.util.TreeSet;

import net.sf.hivgensim.queries.framework.DefaultQueryOutput;
import net.sf.hivgensim.queries.framework.QueryInput;
import net.sf.hivgensim.queries.framework.utils.TherapyUtils;
import net.sf.hivgensim.queries.input.FromDatabase;
import net.sf.regadb.db.Patient;
import net.sf.regadb.db.Therapy;
import net.sf.regadb.util.settings.RegaDBSettings;
/**
 * This query returns of summary of the types of therapies used and their frequencies.
 * 
 * @author gbehey0
 *
 */
public class GetTherapySummary extends DefaultQueryOutput<Patient> {


	private HashMap<String,Integer> drugcounts = new HashMap<String,Integer>();

	public GetTherapySummary(File file) throws FileNotFoundException {
		super(new PrintStream(file));
	}

	public void process(Patient p) {
		for(Therapy t : p.getTherapies()){
			String therapyString = TherapyUtils.getDrugsString(t);
			if(drugcounts.containsKey(therapyString)){
				Integer count = drugcounts.get(therapyString);
				count++;
				drugcounts.put(therapyString, count);
			}else{
				drugcounts.put(therapyString, 1);
			}
		}
	}

	public void close(){
		TreeSet<String> ts = new TreeSet<String>();
		for(String therapy : drugcounts.keySet()){
			Integer count = drugcounts.get(therapy);
			String countstring = count.toString();
			while(countstring.length()<5){
				countstring = " " + countstring;
			}
			ts.add(countstring + "\t" + therapy);
		}
		String[] tsa = new String[ts.size()];
		ts.toArray(tsa);
		for(int i = tsa.length -1; i > -1; --i){
			getOut().println(tsa[i]);
			System.err.println(tsa[i]);
		}
		getOut().flush();
		getOut().close();
	}
	
	public static void main(String[] args) throws FileNotFoundException {
		if(args.length != 3){
			System.err.println("Usage: GetTherapySummary output_file uid passwd");
			System.exit(1);
		}
        RegaDBSettings.createInstance();
		QueryInput qi = new FromDatabase(args[1], args[2], new GetTherapySummary(new File(args[0])));
		qi.run();
	}
}
