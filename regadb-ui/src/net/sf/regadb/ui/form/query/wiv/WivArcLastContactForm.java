package net.sf.regadb.ui.form.query.wiv;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import net.sf.regadb.csv.Table;
import net.sf.regadb.db.Patient;
import net.sf.regadb.db.PatientAttributeValue;
import net.sf.regadb.db.TestResult;
import net.sf.regadb.db.TestType;
import net.sf.regadb.db.Transaction;
import net.sf.regadb.db.meta.Equals;
import net.sf.regadb.io.util.StandardObjects;
import net.sf.regadb.ui.framework.forms.fields.DateField;
import net.sf.regadb.ui.framework.forms.fields.IFormField;
import net.sf.regadb.util.date.DateUtils;
import net.sf.regadb.util.hibernate.HibernateFilterConstraint;

import org.hibernate.Query;
import org.hibernate.ScrollMode;
import org.hibernate.ScrollableResults;

public class WivArcLastContactForm extends WivIntervalQueryForm {
    
    public WivArcLastContactForm(){
        super(tr("menu.query.wiv.arc.lastContact"),tr("form.query.wiv.label.arc.lastContact"),tr("file.query.wiv.arc.lastContact"));
        setStartDate(DateUtils.getDateOffset(getEndDate(), Calendar.YEAR, -1));
    }

    @Override
    protected void setQueryParameter(Query q, String name, IFormField f){
        if(f.getClass() == DateField.class){
            q.setString(name, ((DateField)f).getDate().getTime()+"");
        }
        else
            super.setQueryParameter(q, name, f);
    }
    
    protected PatientAttributeValue getPav(Patient p, String attribute){
    	for(PatientAttributeValue pav : p.getPatientAttributeValues())
    		if(pav.getAttribute().getName().equals(attribute))
    			return pav;
    	
    	return null;
    }
    protected List<TestResult> getTestResults(Patient p, TestType testType){
    	List<TestResult> ret = new ArrayList<TestResult>();
    	for(TestResult tr : p.getTestResults())
    		if(Equals.isSameTestType(tr.getTest().getTestType(),testType))
    			ret.add(tr);
    	
    	return ret;
    }
    
    @Override
    protected void process(File csvFile) throws Exception{
    	Transaction t = createTransaction();
    	
        Date sdate = getStartDate();
        Date edate = getEndDate();
        
        ScrollableResults sr = null;
        
        String aq = getArcPatientQuery("patient.id");
        if(aq != null){
		    HibernateFilterConstraint hfc = new HibernateFilterConstraint();
		    hfc.setClause(aq);
		    sr = t.getPatientsQuery("",hfc).scroll(ScrollMode.FORWARD_ONLY);
        }
        else{
        	sr = t.getPatientsScrollable();
        }
        
        ArrayList<String> row;
        Table out = new Table();
        
        PatientAttributeValue pav;
        while (sr.next()){
        	Patient p = (Patient) sr.get()[0];
        	
        	pav = getPav(p, "PatCode");
        	if(pav == null)
        		continue;
        	String patcode = pav.getValue();
        	
        	TestResult latest = getLatestTest(p, StandardObjects.getContactTestType());
        	
        	if(latest != null && between(latest.getTestDate(), sdate, edate)){
	            row = new ArrayList<String>();
	            
	            row.add(getCentreName());
	            row.add(OriginCode.ARC.getCode()+"");
	            row.add(patcode);
	            row.add(getFormattedDate(latest.getTestDate()));
	            row.add(TypeOfInformationCode.LAST_CONTACT_DATE.getCode()+"");
	            row.add("");
	
	            out.addRow(row);
        	}
        }
        
        t.commit();
        
        if(out.numRows() == 0)
        	throw new EmptyResultException();
        else
        	out.exportAsCsv(new FileOutputStream(csvFile),';',false);
    }
    
    private boolean between(Date query, Date from, Date to) {
    	return !query.before(from) && !query.after(to);
	}

	public TestResult getLatestTest(Patient p, TestType testType) {
    	Transaction t = createTransaction();
    	
    	String hql = 
    			"SELECT tr FROM TestResult tr " +
    			"WHERE tr.patient.id = :patient_id " +
    			"	AND tr.test.testType.description = :testType " +
    			"ORDER BY tr.testDate DESC";
    	
    	Query q = t.createQuery(hql);
    	q.setParameter("patient_id", p.getPatientIi());
    	q.setParameter("testType", testType.getDescription());
    	q.setMaxResults(1);
    	
    	List result = q.list();
    	if (result.size() == 1)
    		return (TestResult)result.get(0);
    	else 
    		return null;
    }
}