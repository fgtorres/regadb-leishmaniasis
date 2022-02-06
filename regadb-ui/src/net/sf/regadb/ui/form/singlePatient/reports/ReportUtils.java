package net.sf.regadb.ui.form.singlePatient.reports;

import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import net.sf.regadb.db.Attribute;
import net.sf.regadb.db.PatientAttributeValue;

public class ReportUtils {

	public static List<Date> OrderDateList(List<Date> datelist) {
		Collections.sort(datelist, new Comparator<Date>() {
			@Override
			public int compare(Date o1, Date o2) {
				return o1.compareTo(o2);
			}
		});
		return datelist;
	}
	
	public static List<PatientAttributeValue> OrderAttributesList(List<PatientAttributeValue> list) {
		Collections.sort(list, new Comparator<PatientAttributeValue>() {
			@Override
			public int compare(PatientAttributeValue a1, PatientAttributeValue a2) {
				return a1.getAttribute().getName().compareTo(a2.getAttribute().getName());
			}
		});
		return list;
	}
	
}
