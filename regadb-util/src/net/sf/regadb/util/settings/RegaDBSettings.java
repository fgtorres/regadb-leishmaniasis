package net.sf.regadb.util.settings;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;

/**
 * Singleton class, it contains the RegaDB settings which are parsed from the global-conf.xml file.
 * Since it's a singleton, it's import what getInstance method is called first as this will determine
 * the configuration directory to be used to get the settings from.
 */
public class RegaDBSettings {
	private HashMap<String, ConfigParser> configs = new HashMap<String, ConfigParser>();

    private static RegaDBSettings instance_ = null;
    
    private File configFile = null;
    
    private HibernateConfig hibernateCfg = new HibernateConfig();
    private ProxyConfig proxyCfg = new ProxyConfig();
    private AccessPolicyConfig apCfg = new AccessPolicyConfig();
    private InstituteConfig instituteCfg = new InstituteConfig();
    private CronConfig cronCfg = new CronConfig();
    private SequenceDatabaseConfig seqdbCfg = new SequenceDatabaseConfig();
    private ContaminationConfig contCfg = new ContaminationConfig();
    
    RegaDBSettings() {
    	addConfig(hibernateCfg);
    	addConfig(proxyCfg);
    	addConfig(apCfg);
    	addConfig(instituteCfg);
    	addConfig(cronCfg);
    	addConfig(seqdbCfg);
    	addConfig(contCfg);
    }
    
    private void addConfig(ConfigParser cfg){
    	configs.put(cfg.getXmlTag(),cfg);
    }
    
    public static RegaDBSettings create(){
    	return new RegaDBSettings();
    }

    public static RegaDBSettings getInstance(){
    	if(instance_==null)
    		System.err.println("The settings instance has not been created yet, call RegaDBSettings.createInstance() first.");
    	
    	return instance_;
    }
    
    public static RegaDBSettings createInstance(){
        instance_ = new RegaDBSettings();
        
        String confDir = System.getenv("REGADB_CONF_DIR");
        if(confDir==null) {
            String osName = System.getProperty("os.name");
            osName = osName.toLowerCase();
            if(osName.startsWith("windows"))
                confDir = "C:\\Program files\\rega_institute\\regadb";
            else
                confDir = "/etc/rega_institute/regadb";
        }
        File configFile = new File(new File(confDir).getAbsolutePath() + File.separatorChar + "global-conf.xml");
        instance_.parseConfFile(configFile);
        
        return instance_;
    }
    
    public static RegaDBSettings createInstance(String confDir){
        File configFile = new File(new File(confDir).getAbsolutePath() + File.separatorChar + "global-conf.xml");
        instance_ = new RegaDBSettings();
        instance_.parseConfFile(configFile);
        
        return instance_;
    }
    
    private void parseConfFile(File confFile) {
    	this.configFile = confFile;
    	
    	for(ConfigParser cp : configs.values())
    		cp.setDefaults();
    	
        SAXBuilder builder = new SAXBuilder();
        Document doc = null;
        try {
            doc = builder.build(confFile);
        } catch (JDOMException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        Element root = doc.getRootElement();
        for(Object o : root.getChildren()){
        	Element e = (Element)o;
        	
        	ConfigParser cfg = configs.get(e.getName());
        	if(cfg != null){
        		cfg.parseXml(this, e);
        		cfg.setConfigured(true);
        	}
        	else{
        		System.err.println("Config element not supported: "+ e.getName());
        	}
        }
    }
    
    public void write(File confFile) {
        Element root = new Element("regadb-settings");
        for(ConfigParser cfg : configs.values())
        	root.addContent(cfg.toXml());
        writeXMLFile(root, confFile.getAbsolutePath());
    }

    private static void writeXMLFile(Element root, String fileName) {
        Document n = new Document(root);
        XMLOutputter outputter = new XMLOutputter();
        outputter.setFormat(Format.getPrettyFormat());
        try {
            outputter.output(n, System.out);
        } catch (IOException e) {
            e.printStackTrace();
        }

        java.io.FileWriter writer;
        try {
            writer = new java.io.FileWriter(fileName);
            outputter.output(n, writer);
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        RegaDBSettings settings = new RegaDBSettings();
        settings.write(new File("settings" + File.separatorChar
                + "skeleton-settings.xml"));
    }

    public SequenceDatabaseConfig getSequenceDatabaseConfig(){
    	return seqdbCfg;
    }
    
    public ContaminationConfig getContaminationConfig(){
    	return contCfg;
    }
    
    public HibernateConfig getHibernateConfig(){
    	return hibernateCfg;
    }
    public InstituteConfig getInstituteConfig(){
    	return instituteCfg;
    }
    public ProxyConfig getProxyConfig(){
    	return proxyCfg;
    }
    public AccessPolicyConfig getAccessPolicyConfig(){
    	return apCfg;
    }
    public CronConfig getCronConfig(){
    	return cronCfg;
    }
    
    public String getDateFormat(){
    	return getInstituteConfig().getDateFormat();
    }
    
    public File getConfigFile(){
    	return configFile;
    }
}
