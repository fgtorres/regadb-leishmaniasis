package net.sf.regadb.util.settings;

import java.util.ArrayList;
import java.util.List;

import org.jdom.Comment;
import org.jdom.Element;

public class ContactFormConfig extends FormConfig {
    private List<TestItem> tests = new ArrayList<TestItem>();
    private List<EventItem> events = new ArrayList<EventItem>();
    
    private boolean useContactDate = false;
    private boolean todayDefaultContactDate = false;
    private boolean showSampleId = true;
    
    private int gridRowCount = 2;

	public ContactFormConfig(String name) {
		super(name);
		setDefaults();
	}

	public void parseXml(RegaDBSettings settings, Element e) {
		tests.clear();
		events.clear();
		
		String s = e.getAttributeValue("gridRowCount");
		if(s != null)
			gridRowCount = Math.abs(Integer.parseInt(s));
		
		s = e.getAttributeValue("todayDefaultContactDate");
		if (s != null)
			todayDefaultContactDate = Boolean.parseBoolean(s);
		
		s = e.getAttributeValue("showSampleId");
		if (s != null)
			showSampleId = Boolean.parseBoolean(s);
		
		Element ee = (Element)e.getChild("tests");
		
        for(Object o : ee.getChildren()){
        	String type = ((Element)o).getAttributeValue("type");
        	String description = ((Element)o).getAttributeValue("description");
        	String organism = ((Element)o).getAttributeValue("organism");
        	String showOrganism = ((Element)o).getAttributeValue("showOrganism");
        	String isMandatory = ((Element)o).getAttributeValue("mandatory");
        	
        	if(description != null) {
        		TestItem ti = new TestItem();
        		ti.type = type;
        		ti.description = description;
        		ti.organism = organism;
        		if (showOrganism != null) 
        			ti.showOrganism = Boolean.parseBoolean(showOrganism);
        		if (isMandatory != null) 
        			ti.isMandatory = Boolean.parseBoolean(isMandatory);
        		tests.add(ti);
        	}
        }
        
        ee = (Element)e.getChild("events");
        if(ee != null){
        	s = ee.getAttributeValue("useContactDate");
        	setUseContactDate(s != null && s.equals("true"));
        	
            for(Object o : ee.getChildren()){
            	s = ((Element)o).getAttributeValue("name");
            	if(s != null)
            		events.add(new EventItem(s));
            }
        }
	}

	public void setDefaults() {
		tests.clear();
		events.clear();
	}

	public Element toXml(){
		Element r = super.toXml();
		Element e;
		
		r.setAttribute("gridRowCount", gridRowCount+"");
		r.addContent(new Comment("Custom contact form configuration."));
		
		if(tests.size() > 0){
			e = new Element("tests");
			r.addContent(e);
			e.addContent(new Comment("List of tests avaiable in the contact form."));
			
			for(TestItem ti : tests){
				Element ee = new Element("test");
				ee.setAttribute("description", ti.description);
				if(ti.organism != null)
					ee.setAttribute("organism",ti.organism);
				
				e.addContent(ee);
			}
		}

		if(events.size() > 0){
			e = new Element("events");
			e.setAttribute("useContactDate",(getUseContactDate() ? "true":"false"));
			r.addContent(e);
			
			e.addContent(new Comment("List of events available in the contact form." +
					" 'useContactDate': use the sample date as start date of the events"));
			
			for(EventItem ei : events){
				Element ee = new Element("event");
				ee.setAttribute("name", ei.name);
				e.addContent(ee);
			}
		}

		return r;
	}
	
	public boolean getUseContactDate(){
		return useContactDate;
	}
	public void setUseContactDate(boolean useContactDate){
		this.useContactDate = useContactDate;
	}
	
    public boolean isTodayDefaultContactDate() {
		return todayDefaultContactDate;
	}

	public void setTodayDefaultContactDate(boolean todayDefaultContactDate) {
		this.todayDefaultContactDate = todayDefaultContactDate;
	}
	
	public boolean isShowSampleId(){
		return this.showSampleId;
	}
	
	public void setShowSampleId(boolean showSampleId){
		this.showSampleId = showSampleId;
	}
	
	public List<TestItem> getTests(){
		return tests;
	}
	public List<EventItem> getEvents(){
		return events;
	}
	public int getGridRowCount(){
		return gridRowCount;
	}
}