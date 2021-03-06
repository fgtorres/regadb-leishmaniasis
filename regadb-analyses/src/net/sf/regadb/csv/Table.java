package net.sf.regadb.csv;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;
import java.util.regex.Pattern;

import net.sf.regadb.tools.MutationStringComparator;

public class Table {
	
	public static Table readTable(String filename)  throws FileNotFoundException, UnsupportedEncodingException {
		return readTable(filename, Charset.defaultCharset().name(), ',');
	}

	public static Table readTable(String filename, char delimiter) throws FileNotFoundException, UnsupportedEncodingException{
		return readTable(filename, Charset.defaultCharset().name(), delimiter);
	}

	public static Table readTable(String filename, String charsetName) throws FileNotFoundException, UnsupportedEncodingException{
		return readTable(filename,charsetName,',');
	}

	public static Table readTable(String filename, String charsetName, char delimiter) throws FileNotFoundException, UnsupportedEncodingException{
		return new Table(new InputStreamReader(new BufferedInputStream(new FileInputStream(filename)),charsetName), false,delimiter);
	}

	public class Index {
		private int columns[];
		private boolean reverse[];

		private Integer index_i[];

		private class IndexComparator implements Comparator<Integer> {
			int column;
			boolean reverse;

			public IndexComparator(int column, boolean reverse) {
				this.column = column;
				this.reverse = reverse;
			}

			public int compare(Integer j1, Integer j2) {
				/*
				 * if possible, compare numbers
				 */
				 String v1 = valueAt(column, j1.intValue());
				String v2 = valueAt(column, j2.intValue());

				try {
					int v1i = Integer.parseInt(v1);
					int v2i = Integer.parseInt(v2);

					return reverse ? v2i - v1i : v1i - v2i;
				} catch (NumberFormatException e) {
					return reverse ? -v1.compareTo(v2) : v1.compareTo(v2);
				}
			}
		}

		private Index(int columns[], boolean reverse[]) {
			this.columns = columns;
			this.reverse = reverse;

			create();
		}

		private void create() {
			index_i = new Integer[numRows() - 1]; // minus header

			for (int i = 1; i < numRows(); ++i) {
				index_i[i - 1] = new Integer(i);
			}

			for (int i = columns.length - 1; i >= 0; --i) {
				int column = columns[i];
				boolean r = reverse[i];

				Comparator<Integer> compare = new IndexComparator(column, r);
				Arrays.sort(index_i, compare);              
			}
		}

		/**
		 * @param j
		 * @return
		 */
		public int row(int j) {
			if (j == 0)
				return 0;
			else
				return index_i[j - 1].intValue();
		}
	}


	ArrayList<ArrayList<String> > rows;
	private HashMap<String, Index> indexes;

	public Table() {
		rows = new ArrayList<ArrayList<String> >();
		indexes = new HashMap<String, Index>();
	}

	public Table(InputStream input, boolean oneline) {
		this(input, oneline, ',');
	}

	public Table(InputStream input, boolean oneline, char delimiter) {
		this(new InputStreamReader(input),oneline,delimiter);
	}

	public Table(InputStream input, String charsetName, boolean oneline) throws UnsupportedEncodingException{
		this(input, charsetName, oneline, ',');
	}

	public Table(InputStream input, String charsetName, boolean oneline, char delimiter) throws UnsupportedEncodingException{
		this(new InputStreamReader(input, charsetName), oneline, delimiter);
	}

	public Table(InputStreamReader input, boolean oneline){
		this(input,oneline,',');
	}

	public Table(InputStreamReader input, boolean oneline, char delimiter){
		this();

		LineNumberReader reader = null;
		try{
			reader = new LineNumberReader(input);
			readLines(reader, oneline, null, null,delimiter);
		} finally {
			if(reader != null){
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	private void readLines(LineNumberReader reader, boolean oneline, ArrayList<Integer> selected, OutputStream output, char delimiter) {

		PrintStream sout = null;

		if (output != null) {
			exportAsCsv(output);
			sout = new PrintStream(output);
		}

		try {
			for (String s = reader.readLine(); s != null; s = reader.readLine()) {
				ArrayList<String> values = splitHandleQuotes(s, delimiter, '"', '\\');
				ArrayList<String> row = new ArrayList<String>(numColumns());

				for (int i = 0; i < values.size(); ++i) {
					row.add(((String) values.get(i)).trim());
					//System.err.print(" (" + i + ")=" + row.get(row.size() - 1));
				}
				//System.err.println();

				if (selected != null) {
					row = selectColumns(row, selected);
				}

				if (rows.size() != 0
						&& row.size() != numColumns())
					throw new RuntimeException("File is not a proper table:"
							+ "row " + (rows.size() + 1) + " length "
							+ row.size() + " != " + numColumns());

				if (sout != null) {
					for (int i = 0; i < numColumns(); ++i) {
						if (i != 0)
							sout.print(",");
						sout.print(row.get(i));
					}
					sout.println();

					row = null;
				} else
					rows.add(row);

				if (oneline) {
					break;
				}
			}
		} catch (IOException e) {
			throw new RuntimeException(e);
		}


		if (sout != null)
			sout.flush();
	}

	public static ArrayList<String> splitHandleQuotes(String s, char delimiter, char quoteChar, char escapeChar) {
		ArrayList<String> results = new ArrayList<String>();

		StringBuffer current = new StringBuffer("");
		boolean inQuotation = false;
		boolean escaping = false;

		for (int i = 0; i < s.length(); ++i) {
			if (escaping) {
				if (s.charAt(i) == quoteChar)
					current.append(quoteChar);
				else {
					current.append(escapeChar);
					current.append(quoteChar);
				}
				escaping = false;
			} else {
				if (s.charAt(i) == quoteChar) {
					inQuotation = !inQuotation;
				} else
					if (s.charAt(i) == escapeChar) {
						escaping = true;
					} else
						if (!inQuotation)
							if (s.charAt(i) == delimiter) {
								results.add(new String(current));
								current = new StringBuffer("");
							} else
								current.append(s.charAt(i));
						else
							current.append(s.charAt(i));
			}
		}

		results.add(new String(current));

		return results;
	}

	public String valueAt(int col, int row) {
		return rows.get(row).get(col);
	}

	public String valueAt(Index index, int i, int j) {
		return valueAt(i, index.row(j));
	}

	public int numColumns() {
		if (rows.isEmpty())
			return 0;
		else
			return rows.get(0).size();
	}

	public int numRows() {
		return rows.size();
	}

	public void exportAsCsv(OutputStream output){
		exportAsCsv(output,',',false);
	}
	
	public void exportAsCsv(OutputStream output, boolean quotes){
		exportAsCsv(output,',',quotes);
	}

	public void exportAsCsv(OutputStream output, char delimiter, boolean quotes) {
		PrintStream sout = new PrintStream(output);
		for (int j = 0; j < numRows(); ++j) {
			for (int i = 0; i < numColumns(); ++i) {
				if (i != 0)
					sout.print(delimiter);

				if(quotes)
					sout.print("\""+ valueAt(i, j).replace("\"", "\"\"") +"\"");
				else
					sout.print(valueAt(i, j));
			}
			sout.println();
		}

		sout.flush();
	}

	public void exportAsSpss(OutputStream output) {
		PrintStream sout = new PrintStream(output);
		for (int j = 0; j < numRows(); ++j) {
			for (int i = 0; i < numColumns(); ++i) {
				if (i != 0)
					sout.print("\t");
				sout.print(valueAt(i, j));
			}
			sout.println();
		}

		sout.flush();
	}

	/**
	 * This assumes that the first row contains the labels.
	 */
	public void exportAsArff(OutputStream output, String relationName, Table attrTable) {
		PrintStream sout = new PrintStream(output);

		sout.println("@RELATION " + relationName);

		if (attrTable == null)
			attrTable = this;	

		boolean realColums[] = new boolean[attrTable.numColumns()];	
		for (int i = 0; i < attrTable.numColumns(); ++i) {
			Set<String> values = new LinkedHashSet<String>();

			for (int j = 1; j < attrTable.numRows(); ++j) {
				values.add(attrTable.valueAt(i, j));
			}

			boolean allReal = true;

			try {			
				for (Iterator<String> j = values.iterator(); j.hasNext();) {
					String s = j.next();
					if (!s.equals(""))
						Double.parseDouble(s);
				}
			} catch (NumberFormatException e) {
				allReal = false;
			}

			sout.print("@ATTRIBUTE " + attrTable.valueAt(i, 0));

			realColums[i] = allReal;

			if (allReal)
				sout.println(" real");
			else {
				sout.print(" { ");
				boolean first = true;
				for (Iterator<String> j = values.iterator(); j.hasNext();) {
					if (!first)
						sout.print(", ");
					first = false;

					sout.print("\"" + j.next() + "\"");
				}

				sout.println("}");
			}
		}

		sout.println();
		sout.println("@DATA");
		sout.println();

		for (int j = 1; j < numRows(); ++j) {
			for (int i = 0; i < numColumns(); ++i) {
				if (i != 0)
					sout.print(", ");
				if (realColums[i])
					if (!valueAt(i,j).equals(""))
						sout.print(valueAt(i, j));
					else
						sout.print(0);
				else
					sout.print("\"" + valueAt(i, j) + "\"");
			}
			sout.println();
		}

		sout.flush();
	}

	public void deleteRow(int r) {
		rows.remove(r);
	}

	public void deleteColumn(int c){
		for (int i = 0; i < rows.size(); ++i) {
			ArrayList<String> row = rows.get(i);
			row.remove(c);
		}
	}
	
	public void deleteColumns(ArrayList<Integer> c){
		Collections.sort(c);
		for(int i = c.size()-1; i >= 0; i--){
			deleteColumn(c.get(i));
		}	
	}
	
	public void deleteColumns(String pattern){
		ArrayList<Integer> colsToBeDeleted = new ArrayList<Integer>();
		ArrayList<String> header = getRow(0);
		Pattern p = Pattern.compile(pattern);
		for(int i = 0; i < header.size(); i++){
			if(p.matcher(header.get(i)).matches()){
				colsToBeDeleted.add(i);				
			}
		}
		deleteColumns(colsToBeDeleted);		
	}
	
	/**
	 * select the columns with name in names
	 * the others columns are removed from the table
	 * @param names
	 */
	public void selectColumns(ArrayList<String> names){
		ArrayList<Integer> colsToBeDeleted = new ArrayList<Integer>();
		ArrayList<String> header = getRow(0);
		for(int i = 1; i < header.size(); i++){
			if(!names.contains(header.get(i))){
				colsToBeDeleted.add(i);				
			}
		}
		deleteColumns(colsToBeDeleted);		
	}

	public ArrayList<String> getColumn(int c) {
		ArrayList<String> result = new ArrayList<String>(numRows());

		for (int i = 0; i < numRows(); ++i) {
			result.add(valueAt(c, i));
		}		
		return result;
	}
	
	public ArrayList<String> getColumn(String name) {
		int i = findColumn(name);
		return i == -1 ? null : getColumn(i);
	}

	public ArrayList<String> getRow(int r){
		return rows.get(r);
	}

	public void addColumn(ArrayList<String> list){
		addColumn(list, findOrderedPosition(list.get(0)));
	}


	public void addColumn(ArrayList<String> list, int pos) {
		if (numColumns() == 0) {
			for (int i = 0; i < list.size(); ++i) {
				rows.add(new ArrayList<String>());
			}
		}

		if (list.size() != numRows())
			throw new RuntimeException("column not compatible with table geometry");

		for (int i = 0; i < list.size(); ++i) {
			ArrayList<String> row = rows.get(i);

			row.add(pos, list.get(i));
		}
	}

	public void addRow(ArrayList<String> row){
		if(numColumns() != 0 && row.size() != numColumns())
			throw new RuntimeException("row not compatible with table geometry");
		else
			rows.add(row);
	}

	public void setValue(int i, int j, String s) {
		rows.get(j).set(i, s);
	}

	public int findInRow(int i, String s) {
		ArrayList<String> row = rows.get(i);
		return row.indexOf(s);
	}

	public int findInRow(int i, int offset, String s){
		ArrayList<String> row = rows.get(i);
		return offset + row.subList(offset, row.size()).indexOf(s);
	}

	public int findInRowIgnoreCase(int i, String s) {
		ArrayList<String> row = rows.get(i);
		for (int j = 0; j < row.size(); ++j) {
			if (((String) row.get(j)).compareToIgnoreCase(s) == 0) {
				return j;
			}
		}
		return -1;
	}

	public void exportBifVariables(FileOutputStream bif) {
		PrintStream sout = new PrintStream(bif);

		for (int i = 0; i < numColumns(); ++i) {
			Set<String> values = new LinkedHashSet<String>();

			for (int j = 1; j < numRows(); ++j) {
				values.add(valueAt(i, j));
			}

			sout.println("<VARIABLE TYPE=\"nature\">");
			sout.println("<NAME>" + valueAt(i, 0) + "</NAME>");

			for (Iterator<String> j = values.iterator(); j.hasNext();) {
				sout.println("<OUTCOME>&quot;" + j.next() + "&quot;</OUTCOME>");
			}

			sout.println("</VARIABLE>");
		}
	}

	static private class HistogramEntry implements Comparable<HistogramEntry> {
		String key;
		int count;

		HistogramEntry(String key, int count) {
			if (key == null || key.equals("")) {
				key = "";
			}
			this.key = key;
			this.count = count;
		}

		public int compareTo(HistogramEntry other) {
			return 100 * (other.count - count) + key.compareTo(other.key);
		}		
	}

	public ArrayList<Map<String, Integer>> histogram() {
		ArrayList<Map<String, Integer> > columnEntries
		= new ArrayList<Map<String, Integer> >(numColumns());

		for (int i = 0; i < numColumns(); ++i) {
			Map<String, Integer> result = histogram(i);
			columnEntries.add(result);
		}

		return columnEntries;
	}

	public Index addIndex(String name, int[] columns) {
		boolean reverse[] = new boolean[columns.length];
		for (int i = 0; i < columns.length; ++i)
			reverse[i] = false;
		return addIndex(name, columns, reverse);
	}

	public Index addIndex(String name, int[] columns, boolean[] reverse) {
		Index i = new Index(columns, reverse);
		indexes.put(name, i);
		return i;
	}

	public Map<String, Integer> histogram(int column) {
		Map<String, HistogramEntry> valueCounts = new LinkedHashMap<String, HistogramEntry>();

		for (int j = 1; j < numRows(); ++j) {
			String v = valueAt(column, j);
			if (!v.equals(""))
				if (valueCounts.containsKey(v)) {
					HistogramEntry e = valueCounts.get(v);
					++e.count;
					valueCounts.put(v, e);
				} else
					valueCounts.put(v, new HistogramEntry(v, 1));
		}

		/*
		 * Sort them in decreasing 'count'
		 */
		SortedSet<HistogramEntry> sortedCounts = new TreeSet<HistogramEntry>();
		for (Iterator<String> it = valueCounts.keySet().iterator(); it.hasNext();) {
			HistogramEntry e = valueCounts.get(it.next());

			sortedCounts.add(e);
		}

		Map<String, Integer> result = new LinkedHashMap<String, Integer>();			
		for (Iterator<HistogramEntry> it = sortedCounts.iterator(); it.hasNext();) {
			HistogramEntry e = it.next();

			result.put(e.key, new Integer(e.count));
		}

		return result;
	}

	public int deleteRowsWithValue(int i, String k) {
		int numRemoved = 0;

		for (int j = 1; j < numRows(); ++j) {

			if (valueAt(i, j).equals(k)) {
				deleteRow(j);
				--j;
				++numRemoved;
			}
		}

		return numRemoved;
	}

	public void merge(Table table2, int key1, int key2, boolean innerJoin) {
		/*
		 * Merge header
		 */
		ArrayList<String> headerRow = rows.get(0);

		for (int i = 0; i < table2.numColumns(); ++i) {
			headerRow.add(table2.valueAt(i, 0));
		}

		/*
		 * Merge data
		 */
		for (int j = 1; j < numRows(); ++j) {
			String key1S = valueAt(key1, j);
			boolean found = false;
			ArrayList<String> dataRow = rows.get(j);

			for (int jj = 1; jj < table2.numRows(); ++jj) {
				if (key1S.equals(table2.valueAt(key2, jj))) {
					for (int i = 0; i < table2.numColumns(); ++i) {
						dataRow.add(table2.valueAt(i, jj));
					}
					found = true;

					break;
				}
			}

			if (!found) {
				System.err.println("Warning: could not find: '" + key1S + "'");
				System.err.print("\tRow: "); 
				for (int i = 0; i < dataRow.size(); ++i) {
					System.err.print(dataRow.get(i) +",");
				}
				System.err.println();
				if (innerJoin) {
					deleteRow(j);
					--j;
				} else {
					for (int i = 0; i < table2.numColumns(); ++i) {
						dataRow.add("");
					}
				}
			}
		}
	}

	public void inverseMerge(Table table2, int key1, int key2) {
		/*
		 * Merge header
		 */
		ArrayList<String> headerRow = rows.get(0);

		for (int i = 0; i < table2.numColumns(); ++i) {
			headerRow.add(table2.valueAt(i, 0));
		}

		/*
		 * Merge data
		 */
		for (int j = 1; j < numRows(); ++j) {
			String key1S = valueAt(key1, j);
			boolean found = false;
			ArrayList<String> dataRow = rows.get(j);

			for (int jj = 1; jj < table2.numRows(); ++jj) {
				if (key1S.equals(table2.valueAt(key2, jj))) {
					for (int i = 0; i < table2.numColumns(); ++i) {
						dataRow.add(table2.valueAt(i, jj));
					}
					found = true;
					break;
				}
			}
			

			if (!found) {
				System.err.println("Warning: could not find: '" + key1S + "'");
				System.err.print("\tRow: "); 
				for (int i = 0; i < dataRow.size(); ++i) {
					System.err.print(dataRow.get(i) +",");
				}
				System.err.println();
				for (int i = 0; i < table2.numColumns(); ++i) {
					dataRow.add("");
				}
			}else{
				deleteRow(j);
				j--;
			}
		}
	}

	public void exportAsVdFiles(OutputStream outputVd, OutputStream outputIdt) {
		PrintStream printVd = new PrintStream(outputVd);
		ArrayList<Map<String, Integer> > histogram = histogram();
		ArrayList<Map<String, Integer> > columnValues = new ArrayList<Map<String, Integer> >();

		for (int i = 0; i < numColumns(); ++i) {			
			printVd.print(valueAt(i, 0));
			Map<String, Integer> vc = histogram.get(i);
			Map<String, Integer> values = new LinkedHashMap<String, Integer>();			

			int index = 0;
			for (Iterator<String> j = vc.keySet().iterator(); j.hasNext();) {
				String v = (String) j.next();
				printVd.print("\t" + v);
				values.put(v, new Integer(index));
				++index;
			}
			printVd.println();

			columnValues.add(values);
		}

		PrintStream printIdt = new PrintStream(outputIdt);
		for (int j = 1; j < numRows(); ++j) {
			for (int i = 0; i < numColumns(); ++i) {
				Map<String, Integer> values = columnValues.get(i);
				if (i != 0)
					printIdt.print("\t");
				if (!valueAt(i, j).equals("")) {
					Integer ind = (Integer) values.get(valueAt(i, j));
					if (ind == null) {
						System.err.println("Internal error: " + i + ", " + j + ": " + valueAt(i, j));
						System.exit(1);
					}
					printIdt.print(ind);
				} else
					printIdt.print(255);
			}
			printIdt.println();
		}
	}

	public void append(Table table2) {
		/*
		 * For every column in table2 that is not in this table, add it to this table,
		 * and fill it with -.
		 */
		final String missingSymbol = "-";

		ArrayList<String> dashColumn = new ArrayList<String>(numRows());
		for (int i = 0; i < numRows(); ++i) {
			dashColumn.add(missingSymbol);
		}

		int lastFound = -1;

		for (int i = 0; i < table2.numColumns(); ++i) {
			String k2 = table2.valueAt(i, 0);

			int i1 = findInRow(0, k2);
			if (i1 == -1) {
				addColumn(dashColumn, lastFound + 1);
				setValue(lastFound + 1, 0, k2);
				++lastFound;
			} else
				lastFound = i1;
		}

		/*
		 * Next, add all data in table2, using - for missing values.
		 */
		for (int i = 1; i < table2.numRows(); ++i) {
			ArrayList<String> row = new ArrayList<String>(numColumns());

			for (int j = 0; j < numColumns(); ++j) {
				int j2 = table2.findInRow(0, valueAt(j, 0));

				if (j2 != -1)
					row.add(table2.valueAt(j2, i));
				else
					row.add(missingSymbol);
			}

			rows.add(row);
		}
	}

	public void readSelectedColumns(InputStream input, ArrayList<Integer> selected,
			OutputStream output, char delimiter) {
		ArrayList<ArrayList<String>> newRows = new ArrayList<ArrayList<String>>();
		newRows.add(selectColumns(rows.get(0), selected));
		rows = newRows;

		LineNumberReader reader = null;
		try{
			reader = new LineNumberReader(new InputStreamReader(input));
			readLines(reader, false, selected, output, delimiter);
		} finally {
			if(reader != null){
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public void readSelectedColumns(InputStream input, ArrayList<Integer> selected,
			OutputStream output) {
		readSelectedColumns(input, selected, output, ',');
	}


	private ArrayList<String> selectColumns(ArrayList<String> row, ArrayList<Integer> selected) {
		ArrayList<String> result = new ArrayList<String>();
		for (int i = 0; i < selected.size(); ++i) {
//			String o = row.get(((Integer) selected.get(i)).intValue());
			String o = row.get(selected.get(i));
			result.add(o);
		}
		return result;
	}

	public int findInColumn(int col, String IsolateID, int row) {
		for (int r = row; r < numRows(); ++r) {
			if (valueAt(col, r).equals(IsolateID))
				return r;
		}

		return -1;
	}

	public int findColumn(String name) {
		int column = this.findInRow(0, name);
		return column;
	}
	
	public int findColumn(int offset, String name) {
		int column = this.findInRow(0, offset, name);

		return column;
	}

	private int findOrderedPosition(String mutString){
		Comparator<String> c = new MutationStringComparator();
		ArrayList<String> header = getRow(0);
		for(int i = 1 ; i<numColumns();i++){
			if(c.compare(mutString, header.get(i)) < 0){
//				System.out.println(mutString +" op pos "+(i+1)+" tov "+header.get(i)+" in "+header);
				return i;
			}
		}
//		System.out.println(mutString +"achteraan in "+header);
		return numColumns();
	}	
	

	public void removeLowPrevalenceMutations(double threshold, boolean lump){
		if(lump){
			/*
			 * 05 December 2008
			 * because of disappearing wild types under certain circumstances involving mixtures
			 * I (gbehey0) tried to put a threshold without lumpValues. However this part of the code
			 * seemed broken (the index went out of bounds) and I wasn't able to quickly fix the old code.
			 * I re-wrote this part (the old code is still commented a few lines down). 
			 * 
			 * problem before (threshold 2%):
			 * RT65K (WT) n : 1.95 % => deleted
			 * RT65R y : 2.4 % => not deleted
			 * RT65E y : 0.02 % => deleted
			 * 
			 * problem : wild type got deleted but mutation remained due to mixtures.
			 * solution: only delete column when occurrence of 'y' < threshold.
			 * 
			 * new possible problem: (threshold 2% - no mixtures): 
			 * RT65K (WT) 	n : 5 % => ok
			 * RT65R 		y : 4 % => ok
			 * RT65E 		y : 1 % => deleted
			 * 
			 * what to do with the 1% rows containing RT65E = y ? delete rows?
			 */

			ArrayList<Integer> colIndicesToBeRemoved = new ArrayList<Integer>();
			for(int i = 1; i < numColumns();i++){
				Map<String,Integer> m = histogram().get(i);
				for (Iterator<String> j = m.keySet().iterator(); j.hasNext();) {
					String k = j.next();
					int c = m.get(k);

					if ((double) c / (numRows() - 1)
							< threshold && k.equals("y")) {
						colIndicesToBeRemoved.add(i);
					}
				}					
			}
			deleteColumns(colIndicesToBeRemoved);

			//OLD CODE

			//		boolean hasDeleted = false;
			//		int numRowsRemoved = 0;
			//
			//		int numIterations = 1;
			//		do {
			//			hasDeleted = false;
			//			System.err.print("(" + numIterations + ") ");
			//
			//			for (int ii = 0; ii < columns.size(); ++ii) {
			//				int i = ((Integer)columns.get(ii)).intValue();
			//
			//				Map m = (Map) histogram.get(i);
			//				ArrayList smaller = new ArrayList();
			//
			//				for (Iterator j = m.keySet().iterator(); j.hasNext();) {
			//					String k = (String) j.next();
			//					int c = ((Integer) m.get(k)).intValue();
			//
			//					if ((double) c / (table.numRows() - 1)
			//						< threshold.doubleValue()) {
			//						smaller.add(k);
			//					}
			//				}
			//
			//				if (smaller.size() == m.size() - 1) {
			//					table.deleteColumn(i);
			//					columns.remove(ii);
			//					--ii;
			//					++numColumnsRemoved;
			//					System.err.print("c");
			//				} else {
			//					for (Iterator j = m.keySet().iterator(); j.hasNext();) {
			//						String k = (String) j.next();
			//						int c = ((Integer) m.get(k)).intValue();
			//
			//						if ((double) c / (table.numRows() - 1)
			//							< threshold.doubleValue()) {
			//							numRowsRemoved
			//								+= table.deleteRowsWithValue(i, k);
			//							hasDeleted = true;
			//							System.err.print("r");
			//						}
			//					}
			//				}
			//			}
			//
			//			if (hasDeleted)
			//				histogram = table.histogram();
			//			System.err.println();
			//			++numIterations;
			//		} while (hasDeleted);
			//
			//		System.err.println(
			//			"Deleted "
			//				+ numRowsRemoved
			//				+ " rows, "
			//				+ numColumnsRemoved
			//				+ " columns");

		} else {
			/*
			 * For every attribute, we sort the values in ascending frequency order,
			 * and lump the last value together with the preceding one until the last
			 * one is above the threshold
			 */
			ArrayList<Integer> removeColumns = new ArrayList<Integer>();

			for (int i = 1; i < numColumns(); ++i) {
				Map<String,Integer> m = histogram(i);

				SortedSet<AttributeValue> values = new TreeSet<AttributeValue>();
				int l = 0;
				for (Iterator<String> j = m.keySet().iterator(); j.hasNext(); ++l) {					
					String k = j.next();
					int c = m.get(k);
					values.add(new AttributeValue(k, c, l));
				}

				boolean again = false;
				do {
					again = false;
					Iterator<AttributeValue> it = values.iterator();
					AttributeValue v = (AttributeValue) it.next();

					if ((double) v.count / (numRows() - 1)
							< threshold) {
						if (it.hasNext()) {                            
							/*
							 * lump together with next value.
							 */
							AttributeValue v2 = it.next();

							values.remove(v);
							values.remove(v2);

							v2.count += v.count;
							String oldv2name = v2.name;
							v2.name = v2.name + "/" + v.name;

							values.add(v2);

							for (int j = 1; j < numRows(); ++j) {
								if (valueAt(i, j).equals(v.name)
										|| valueAt(i, j).equals(oldv2name)) {
									setValue(i, j, v2.name);
								}
							}

							System.err.print(".");

							again = true;
						}
					}
				} while (again);

				if (values.size() == 1) {
					removeColumns.add(new Integer(i));
					System.err.print("c");					
				}
			}
			deleteColumns(removeColumns);
			System.err.println();
			System.err.println("Removed " + removeColumns.size() + " columns.");
		}
	}

}
