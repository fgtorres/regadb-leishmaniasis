package net.sf.regadb.service.wts.test;

import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.Map;

import junit.framework.TestCase;
import net.sf.wts.client.WtsClient;

public class WtsServiceTestClient extends TestCase{
    WtsServiceTestClient testClient_;
    String xmlLocation;
    String regadb_hiv_resist_result;
    String regadb_hiv_resist_mutlist_result;
    String get_file_provider_file;

    private String url;
    private String userName;
    private String password;
    
    private String hiv1bRefSeq = ">AR06-275\ntcagaacagaccagaaccaacagccccaccagaagagagcttcaggtttggggaggagayaacaactccccctcmgaagcgggagacgggagacamggaaytgtatcctttaacctccctcagatcactctttggcaacgacccctcgtcacaataaagataggggggcaactaaaagaagctctattagatacaggagcagatgatacagtattagaagacatgaatttgccaggaagatggaaaccaaaaatgatagggggaattggaggttttatcaaagtaagacagtatgatcagatacccatagaartttgtgggcataaagctataggtacagtgttagtaggacctacacctgtcaacataattgggagaaatttgttgactaaaattggctgtactttaaattttcccattagtcctattgagactgtaccagtaaaattaaagccaggaatggatgggccaaaagttaaacaatggccattgacagaagaaaaaataaaagcattagtagaaatttgtacagaaatggaaaaggaaggaaagatttcaagaattgggcctgaaaatccatacaatactccaatatttgccataaagaaaaaagacagtactaaatggagaaaattagtagatttcagagaacttaacaagagaactcaagacttctgggaagttcaattaggaataccacatcccgcagggctaaaaaagaaaaaatcagtaacagtactggatgtgggtgatgcatatttttcagtgcccttagataaagacttcaggaagtatactgcatttaccatacctagtacaaacaatgagacaccaggaattagatatcagtacaatgtgcttccacagggatggaaaggatcaccagcaatatttcaaagtgccatgacaaaaatcttagagccttttagaaaacaaaatccagacatagttatctatcaatacatggatgatttatatgtaggatctgatttagaaatagggcaacacagaacaagagtagaggaactaagacaacatctgttaaagtggggatttaccacaccagacaaaaagcatcagaaagaccctccatttctttggatgggttatgaactccatcctgataaatggacagtgcagcctatagtgctgccagaaaaagacagctggactgtcaatgacatacagaagttagtgggaaaattgaattgggcaagtcagatttacccagggattaaaataaagcaattatgtaagctccttaggggagccaaagcactaacagaagtaataacaatgacagaagaagcagagctagaactggcagaaaacagggagattctaaaagaaccagtacatggagcgtattatgacccatcaaaagacttaatagcagaaata";
    private String hiv1bRefSeqSmallChanges = ">AR06-275\ntcagaccagatcagaaccaacagccccaccagaagagagcttcaggtttggggaggagayaacaactccccctcmgaagcgggagacgggagacamggaaytgtatcctttaacctccctcagatcactctttggcaacgacccctcgtcacaataaagataggggggcaactaaaagaagctctattagatacaggagcagatgatacagtattagaagacatgaatttgccaggaagatggaaaccaaaaatgatagggggaattggaggttttatcaaagtaagacagtatgatcagatacccatagaartttgtgggcataaagctataggtacagtgttagtaggacctacacctgtcaacataattgggagaaatttgttgactaaaattggctgtactttaaattttcccattagtcctattgagactgtaccagtaaaattaaagccaggaatggatgggccaaaagttaaacaatggccattgacagaagaaaaaataaaagcattagtagaaatttgtacagaaatggaaaaggaaggaaagatttcaagaattgggcctgaaaatccatacaatactccaatatttgccataaagaaaaaagacagtactaaatggagaaaattagtagatttcagagaacttaacaagagaactcaagacttctgggaagttcaattaggaataccacatcccgcagggctaaaaaagaaaaaatcagtaacagtactggatgtgggtgatgcatatttttcagtgcccttagataaagacttcaggaagtatactgcatttaccatacctagtacaaacaatgagacaccaggaattagatatcagtacaatgtgcttccacagggatggaaaggatcaccagcaatatttcaaagtgccatgacaaaaatcttagagccttttagaaaacaaaatccagacatagttatctatcaatacatggatgatttatatgtaggatctgatttagaaatagggcaacacagaacaagagtagaggaactaagacaacatctgttaaagtggggatttaccacaccagacaaaaagcatcagaaagaccctccatttctttggatgggttatgaactccatcctgataaatggacagtgcagcctatagtgctgccagaaaaagacagctggactgtcaatgacatacagaagttagtgggaaaattgaattgggcaagtcagatttacccagggattaaaataaagcaattatgtaagctccttaggggagccaaagcactaacagaagtaataacaatgacagaagaagcagagctagaactggcagaaaacagggagattctaaaagaaccagtacatggagcgtattatgacccatcaaaagacttaatagcagaaata";
    private String hiv1MutSeq = ">test_vi\ncctcagatcactctttggcaacgacccmtcgtcacaataaaggtaggggggcaactaaaggaagctctattagatacaggagcagatgatacagtattagaagaactaaatttgccaggaaaatggaaaccaaaaatratagggggaattggaggttttgtcaaagtaagrcagtatgatcaggtacccatagaaatctgtggacataaagtcctaagtacagtattagtaggacctacacctgccaacataattggaaggaatttgttgactcarcttggttgcactttaaattttcccattagtcctattgaaactgtaccagtaaaattaaagccaggaatggatggcccaaaagttaaacaatggccattgacagaagaaaaaataaaagcattagtggaaatttgtacagaattagaaaasgaaggaaaaatttcaaaaattgggcctgaaaatccatataatactccagtattcgccataaagaaaaaaracagtactaagtggagaaaattagtagatttcagagaacttaataagagaactcaagacttctgggaagttcaattaggaataccacatcccgcagggttaaagaagaaaaaatcagtaacagtactggatgtgggtgatgcatatttttcaattcccttagacaaagacttcaggaagtatactgcwtttaccatacctagtataaacaatgagacaccagggattagatatcagtacaatgtgcttccacagggatggaaaggatcaccatcaatattccaaagtagcatgacaaaaatcttagagccttttagaaaacaaaatccagacatagttatctatcagtatatggacgatctgtatgtaggatctgacttagagatagggcagcatagaacaaaaatagaggaactgagagaacatctatggaagtggggattttwcacaccagacaaaaaacatcagaaagaacctccattcctttggatgggttatgaactccaccctgataaatggacagtacagcctatagtgctgccagaaaaggacagctggactgtcaatgacatacagaagttagtgggaaaattgaattgggcaagtcaratttacccagggattaaagtmaggcagttatgcaaactccttaggggaaccaaagcactaacagaaataataccactaacaaaagaagcagagttagaactggcagaaaatagggaaattctaaaagaaccagtacatggagcatattatgacccatcaaaagacttaatagcagaaatacagaagcaggagctaggt";
    
    private String hiv1AlnSeq1 = ">B.FR.83.HXB2_LAI_IIIB_BRU.K03455\nTTTTTTAGGGAAGATCTGGCCTTCCTACAA---GGGAAGGCCAGGGAATTTTCTTCAGAGCAG------------------------------------------------------ACCAGAGCCAACAGCCCCACC------AGAAGAGAGCTTCAGGTC------------------------------------------------TGGGGTAGAGACAAC---------AACTCCCCCTCA------------------------------------------------GAAGCAGGAGCCGAT---------------------------AGACAAGGAACT---------------------------GTATCCTTTAACTTCCCTCAGGTCACTCTTTGGCAACGACCCCTCGTCACAATAAAGATAGGGGGGCAACTAAAGGAAGCTCTATTA---GATACAGGAGCAGATGATACAGTATTAGAAGAA------ATGAGTTTGCCAGGA---AGATGGAAA---CCAAAAATGATAGGGGGAATTGGAGGTTTTATCAAA---GTAAGACAGTAT---GATCAGATACTCATAGAAATCTGTGGACATAAA---GCTATA---GGTACAGTA---TTAGT";
    private String hiv1AlnSeq2 = ">A1.AU.04.PS1044_Day177.DQ676873\nTTTTTTAGGGAAAATTTGGCCTTCCAGCAA---GGGGAGGCCAGGAAATTTCCCTCAGAGCAG------------------------------------------------------ACCAGAGCCAACAGCCCCACC------AGCGGAGCTCTTTGGGAT------------------------------------------------GGGGGAARAGAT------------AACCTCCCCTCC------------------------------------------------GAAGCAGGAGCAGAA---------------------------GGACAAGGAACA------------------------GGTYCCACCCTTAGTTTCCCTCAAATCACTCTTTGGCAACGACCCATCGTCACAGTAAGAATAGAGGGACAGCTAAGAGAAGCTCTATTA---GATACAGGAGCAGACGATACAGTATTAGAAGAC------ATAGATTTGYCAGGA---AAATGGAAA---CCAAGAATGATAGGGGGAATTGGAGGCTTCATCAAG---GTAAAACAGTAT---GATCAGATATCTATAGAAATTTGTGGAAAAAGA---GCTATA---GGTACAGTA---TTAGT";
    
    protected void setUp() throws Exception
    {
//        String url = "http://regadb.med.kuleuven.be/wts/services/";
//    	String url = "http://gbw-p-kev02.bm.icts.kuleuven.be:8081/wts/services/";
//    	String url = "http://gbw-p-kev02.bm.icts.kuleuven.be/wts/services/";
//    	String url = "http://10.33.245.44:8080/wts/services";
//    	String url = "http://192.168.0.12:8080/wts/services";
//    	String url = "http://regadb.ipk.sld.cu:8080/wts/services";
    	String url = "http://regadb.med.kuleuven.be/wts/services/";
//    	String url = "http://localhost:8080/wts/services/";
        String userName = "public";
        String password = "public";
          
        testClient_ = new WtsServiceTestClient(url,userName,password);
        
        //Rega XML File
    	xmlLocation = "/Users/ewout/eclipse/workspace/Stanford/src/test_copy.xml";
    	// TODO: change to recursive path
    	regadb_hiv_resist_result = "/Users/ewout/git/regadb/regadb-analyses/io-assist-files/regadb-hiv-resist-result.xml";
    	regadb_hiv_resist_mutlist_result = "/Users/ewout/git/regadb/regadb-analyses/io-assist-files/regadb-hiv-resist-mutlist-result.xml";
    	get_file_provider_file = "/Users/ewout/git/regadb/regadb-analyses/io-assist-files/get-file-provider-file-DrugClasses.xml";
    }
    
    public WtsServiceTestClient(){
        
    }
    
    public WtsServiceTestClient(String url, String userName, String password){
        setUrl(url);
        setUserName(userName);
        setPassword(password);
    }
    
    public void test_regadb_subtype() throws Exception{
        Map<String,byte[]> inputs = new HashMap<String,byte[]>();
        inputs.put("nt_sequence", getHiv1bRefSeq().getBytes());
        inputs.put("species", "HIV".getBytes());
        
        Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
        outputs.put("subtype", new StringOutputValidator("HIV-1 Subtype B"));
        
        testClient_.testService("regadb-subtype", inputs, outputs);
    }
    
    public void test_regadb_blast() throws Exception{
        Map<String,byte[]> inputs = new HashMap<String,byte[]>();
        inputs.put("nt_sequence", getHiv1bRefSeq().getBytes());
        
        Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
        outputs.put("species", new StringOutputValidator("HIV-1\n"
                                                            +"0.0\n"
                                                            +"1139"));
        
        testClient_.testService("regadb-blast", inputs, outputs);
    }
    
    public void test_regadb_align() throws Exception{
        Map<String,byte[]> inputs = new HashMap<String,byte[]>();
        inputs.put("sequences", getHiv1MutSeq().getBytes());
        inputs.put("genome", "HIV-1".getBytes());

        Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
//        outputs.put("mutations", new StringOutputValidator("seqid,status,score,frameshifts,begin,end,mutations\ntest,Success,4600,0,1,335,M41L K43KN D67DN V118I E122K A158S Q207E L210W R211K L214F T215FY V292I E297K V317A G333E Q334L"));
        outputs.put("mutations", new StringOutputValidator("sequence=test_vi\nprotein=PR,start=1,end=99,mutations=V3I;GTC3ATC L10IL;CTC10MTC I15V;ATA15GTA M36L;ATG36CTA S37N;AGT37AAT R41K;AGA41AAA M46IM;ATG46ATR I54V;ATC54GTC R57R;AGA57AGR I62V;ATA62GTA L63P;CTC63CCC A71V;GCT71GTC I72L;ATA72CTA G73S;GGT73AGT V82A;GTC82GCC R87R;AGA87AGG L89L;CTG89TTG Q92Q;CAG92CAR I93L;ATT93CTT,aa_mutations=V3I L10IL I15V M36L S37N R41K M46IM I54V I62V L63P A71V I72L G73S V82A I93L\nprotein=RT,start=1,end=335,mutations=S3S;AGC3AGT E6E;GAG6GAA V35V;GTA35GTG E40E;GAG40GAA M41L;ATG41TTA K43KN;AAG43AAS G45G;GGG45GGA Y56Y;TAC56TAT F61F;TTT61TTC D67DN;GAC67RAC K70K;AAA70AAG K101K;AAA101AAG V118I;GTT118ATT D121D;GAT121GAC E122K;GAA122AAA A129A;GCA129GCW A158S;GCA158TCA Q182Q;CAA182CAG Y183Y;TAC183TAT D185D;GAT185GAC L187L;TTG187CTG E194E;GAA194GAG E204E;GAG204GAA Q207E;CAA207GAA L209L;CTG209CTA L210W;TTG210TGG R211K;AGG211AAG L214F;CTT214TTT T215FY;ACC215TWC H235H;CAT235CAC K249K;AAA249AAG G262G;GGG262GGA Q269Q;CAG269CAR V276V;GTA276GTM Q278Q;CAA278CAG C280C;TGT280TGC R284R;AGA284AGG V292I;GTA292ATA E297K;GAA297AAA L301L;CTA301TTA N306N;AAC306AAT R307R;AGA307AGG E308E;GAG308GAA V317A;GTG317GCA G333E;GGG333GAG Q334L;CAA334CTA G335G;GGC335GGT,aa_mutations=M41L K43KN D67DN V118I E122K A158S Q207E L210W R211K L214F T215FY V292I E297K V317A G333E Q334L"));
        testClient_.testService("regadb-align", inputs, outputs);
    }
    
    public void test_regadb_nt_align() throws Exception {
        String hiv1bRefSeq = 
       		 ">AR06-275\n tcagaacagaccagaaccaa";
        String hiv1MutSeq = 
       		 ">test_vi \n tcagaagagatcagaaccaaccg";
    	
    	 Map<String,byte[]> inputs = new HashMap<String,byte[]>();
         inputs.put("organism_name", "HIV-1".getBytes());
         String nt_sequences = hiv1bRefSeq + "\n" + hiv1MutSeq;
         inputs.put("nt_sequences", nt_sequences.getBytes());
         inputs.put("min_signal", "0.7".getBytes());

         Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
         
         String expected = 
        		 ">AR06-275\n" +
        		 "TCAGAACAGACCAGAACCAA\n" + 
        		 ">test_vi\n" + 
        		 "TCAGAAGAGATCAGAACCAA";
         outputs.put("aligned_sequences", new StringOutputValidator(expected));
         
         testClient_.testService("regadb-nt-align", inputs, outputs);
    }
    
    public void test_regadb_hiv_describe_mutations() throws Exception {
    	Map<String,byte[]> inputs = new HashMap<String,byte[]>();
    	
    	byte[] asi_rule = Files.readAllBytes(Paths.get(xmlLocation));
    	inputs.put("asi_rules", asi_rule);
    	
    	Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
    	
    	String expected = "protein,position,mutations\nPRO,10,FIVY\nPRO,11,IL\nPRO,20,IMRTV\nPRO,23,I\nPRO,24,FI\nPRO,30,N\nPRO,32,IL\nPRO,33,FIMV\nPRO,34,V\nPRO,35,GN\nPRO,38,W\nPRO,41,IT\nPRO,43,RT\nPRO,45,I\nPRO,46,IL\nPRO,47,AV\nPRO,48,AMV\nPRO,50,LV\nPRO,53,L\nPRO,54,ALMSTV\nPRO,58,E\nPRO,62,V\nPRO,64,MV\nPRO,66,F\nPRO,70,E\nPRO,71,ILTV\nPRO,73,ACFSTV\nPRO,74,AEPS\nPRO,76,V\nPRO,77,ATV\nPRO,82,AFLMST\nPRO,83,D\nPRO,84,ACV\nPRO,85,V\nPRO,88,DS\nPRO,89,ITV\nPRO,90,M\nPRO,93,M\nPRO,95,F\nRT,41,L\nRT,44,AD\nRT,65,NR\nRT,67,GN\nRT,69,ADGN\nRT,70,EGR\nRT,74,IV\nRT,75,AIMST\nRT,77,L\nRT,90,I\nRT,98,G\nRT,100,I\nRT,101,EHNPQRT\nRT,103,HNRST\nRT,106,AIM\nRT,108,I\nRT,115,F\nRT,116,Y\nRT,118,I\nRT,138,AGKQRS\nRT,151,M\nRT,179,DEFILT\nRT,181,CIV\nRT,184,IV\nRT,188,CFHL\nRT,189,I\nRT,190,ACEQSTV\nRT,210,W\nRT,215,ACDEFGHILNSVY\nRT,219,EHNQR\nRT,221,Y\nRT,225,H\nRT,227,CL\nRT,230,IL\nRT,234,I\nRT,236,L\nRT,238,NT\nRT,318,F\nGP41,36,DESV\nGP41,38,AEM\nGP41,40,H\nGP41,41,R\nGP41,42,DEHKQT\nGP41,43,DKQS\nGP41,44,MV\nGP41,45,MPQ\nIN,51,Y\nIN,66,AIK\nIN,74,M\nIN,92,GQ\nIN,97,A\nIN,114,Y\nIN,118,R\nIN,121,Y\nIN,124,A\nIN,138,AK\nIN,140,ACS\nIN,143,CHR\nIN,145,S\nIN,146,IKLPR\nIN,147,G\nIN,148,HKR\nIN,151,I\nIN,153,FY\nIN,155,HST\nIN,156,N\nIN,163,KR\nIN,206,S\nIN,230,N\nIN,232,N\nIN,263,K";
    	
    	outputs.put("description", new StringOutputValidator(expected));
    	
    	testClient_.testService("regadb-hiv-describe-mutations", inputs, outputs);
    }
    
    public void test_regadb_hiv_resist() throws Exception {
    	Map<String,byte[]> inputs = new HashMap<String,byte[]>();
    	
    	byte[] asi_rule = Files.readAllBytes(Paths.get(xmlLocation));
    	
    	inputs.put("viral_isolate", (hiv1bRefSeq + "\n" + hiv1MutSeq).getBytes());
    	inputs.put("asi_rules", asi_rule);
    	
    	Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
        
    	byte[] convert = Files.readAllBytes(Paths.get(regadb_hiv_resist_result));
    	String expected = new String(convert, Charset.defaultCharset());
//        String expected = new String("Expected value");
    	
        outputs.put("interpretation", new StringOutputValidator(expected));
        
        testClient_.testService("regadb-hiv-resist", inputs, outputs);
    }
    
    public void test_regadb_hiv_resist2() throws Exception {
    	Map<String,byte[]> inputs = new HashMap<String,byte[]>();
    	
    	byte[] asi_rule = Files.readAllBytes(Paths.get(xmlLocation));
    	
    	inputs.put("viral_isolate", "p6,2-53:T21IT,E6E,V19E,I31G,T39T,L35L,S17F,P30T,S3N,K33KT,R42R,Q28R,Q26PQ;PR,1-99:S37N,V75V,G94G,E35D,K20K,Q92K,L63P,G86G,V3I,L89L,I66IV,C95C,G68G;RT,1-329:K49R,V317A,F160F,V118V,P294T,K281K,T286A,E204E,V276I,K201R,L187L,H198H,L210L,I135T,L295M,D192D,K46K,E224D,V241V,G141G,Q197Q,R284R,L214F,G18G,G45G,R277K,F227F,L205L,K220K,I202V,V60I,N81N,R307R,G262G,L100L,E40E,S163A,R211K,S3S,E122K;".getBytes());
    	inputs.put("asi_rules", asi_rule);
    	
    	Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
        
    	byte[] convert = Files.readAllBytes(Paths.get(regadb_hiv_resist_result));
    	String expected = new String(convert, Charset.defaultCharset());
//        String expected = new String("Expected value");
    	
        outputs.put("interpretation", new StringOutputValidator(expected));
        
        testClient_.testService("regadb-hiv-resist", inputs, outputs);
    }
    
    // Potential error here could be due to a change in positions from (B,A1) to (A1,B)
    public void test_regadb_tree() throws Exception {
        Map<String,byte[]> inputs = new HashMap<String,byte[]>();
        inputs.put("sequences.fasta", (hiv1AlnSeq1 + "\n" + hiv1AlnSeq2).getBytes());

        Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
        String expected = "(\n"
        		+ "B.FR.83.HXB2_LAI_IIIB_BRU.K03455:0.08101,\n"
        		+ "A1.AU.04.PS1044_Day177.DQ676873:0.08101);";
        outputs.put("tree.phy", new StringOutputValidator(expected));
        
        testClient_.testService("regadb-tree", inputs, outputs);
    }
    
    public void test_get_file_provider_file() throws Exception {
        Map<String,byte[]> inputs = new HashMap<String,byte[]>();
        inputs.put("file_provider_name", "regadb-drugs".getBytes());
        inputs.put("file_name", "DrugClasses.xml".getBytes());
        
        Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
        byte[] convert = Files.readAllBytes(Paths.get(get_file_provider_file));
    	String expected = new String(convert, Charset.defaultCharset());
        
        outputs.put("file_provider_file", new StringOutputValidator(expected));
        
        testClient_.testService("get-file-provider-file", inputs, outputs);
    }
    
    // TODO: Check if some of the files are in the list, not the whole filelist, what to do if new files added?
    public void test_get_file_provider_filelist() throws Exception {
        Map<String,byte[]> inputs = new HashMap<String,byte[]>();
        inputs.put("file_provider_name", "regadb-drugs".getBytes());
        
        Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
    	String expected = "DrugClasses-em-hcv.xml\nDrugClasses-genomes.svn.2621.xml\nDrugClasses-genomes.xml\nDrugClasses-genomes.xml.20130424\nDrugClasses-genomes.xml.20140204\nDrugClasses-genomes.xml.20140213\nDrugClasses-genomes.xml.20140214\nDrugClasses-genomes.xml.20150603\nDrugClasses-genomes.xml.20150917\nDrugClasses-genomes.xml.20160114\nDrugClasses-genomes.xml.20160225\nDrugClasses-hcv.xml\nDrugClasses-hcv.xml.20111104\nDrugClasses-hcv.xml.20120716\nDrugClasses-leishmaniasis.xml\nDrugClasses.xml\nDrugCommercials-em-hcv.xml\nDrugCommercials-genomes.xml\nDrugCommercials-genomes.xml.20101015\nDrugCommercials-genomes.xml.20110629\nDrugCommercials-genomes.xml.20120118\nDrugCommercials-genomes.xml.20120224\nDrugCommercials-genomes.xml.20120620\nDrugCommercials-genomes.xml.20120628\nDrugCommercials-genomes.xml.20120925\nDrugCommercials-genomes.xml.20130424\nDrugCommercials-genomes.xml.20140204\nDrugCommercials-genomes.xml.20140213\nDrugCommercials-genomes.xml.20140214\nDrugCommercials-genomes.xml.20150603\nDrugCommercials-genomes.xml.20150917\nDrugCommercials-genomes.xml.20160114\nDrugCommercials-genomes.xml.20160225\nDrugCommercials-hcv.xml\nDrugCommercials-hcv.xml.20111104\nDrugCommercials-hcv.xml.20120716\nDrugCommercials-leishmaniasis.xml\nDrugCommercials.xml\nDrugGenerics-em-hcv.xml\nDrugGenerics-genomes-fossie.xml\nDrugGenerics-genomes.xml\nDrugGenerics-genomes.xml.20110706\nDrugGenerics-genomes.xml.20111213\nDrugGenerics-genomes.xml.20120224\nDrugGenerics-genomes.xml.20130424\nDrugGenerics-genomes.xml.20140204\nDrugGenerics-genomes.xml.20140213\nDrugGenerics-genomes.xml.20140214\nDrugGenerics-genomes.xml.20150603\nDrugGenerics-genomes.xml.20150917\nDrugGenerics-genomes.xml.20160114\nDrugGenerics-genomes.xml.20160225\nDrugGenerics-hcv.xml\nDrugGenerics-hcv.xml.20111104\nDrugGenerics-hcv.xml.20120716\nDrugGenerics-leishmaniasis.xml\nDrugGenerics.xml\nmonitor_file\nWEB-INF";
        
        outputs.put("file_provider_file_list", new StringOutputValidator(expected));
        
        testClient_.testService("get-file-provider-filelist", inputs, outputs);
    }
    
    public void test_inkscape_convert() throws Exception {
    	// TODO: Make those links dynamic
    	String inkscape_input_image = "/Users/ewout/git/regadb/regadb-analyses/io-assist-files/inkscape_input_image.svg";
    	byte[] convertInput = Files.readAllBytes(Paths.get(inkscape_input_image));
    	String inkscape_output_image = "/Users/ewout/git/regadb/regadb-analyses/io-assist-files/inkscape_output_image.png";
    	byte[] convertOutput = Files.readAllBytes(Paths.get(inkscape_output_image));
    	
        Map<String,byte[]> inputs = new HashMap<String,byte[]>();
        inputs.put("in", convertInput);
        inputs.put("type", "png".getBytes());
        
        Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
    	String expected = new String(convertOutput, Charset.defaultCharset());
        
        outputs.put("out", new StringOutputValidator(expected));
        
        testClient_.testService("inkscape-convert", inputs, outputs);
    }
    
    public void test_list_file_providers() throws Exception {
        Map<String,byte[]> inputs = new HashMap<String,byte[]>();
        
        Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
    	String expected = "regadb-attributes\nregadb-drugs\nregadb-events\nregadb-genomes\nregadb-tests";
        
        outputs.put("file_providers_list", new StringOutputValidator(expected));
        
        testClient_.testService("list-file-providers", inputs, outputs);
    }
    
    public void test_regadb_align_clustalw() throws Exception {
        Map<String,byte[]> inputs = new HashMap<String,byte[]>();
        inputs.put("type", "NT".getBytes());
        inputs.put("sequences", (hiv1bRefSeq + "\n" + hiv1MutSeq).getBytes());
        inputs.put("gapopen", "10".getBytes());
        inputs.put("gapext", "3.3".getBytes());
        
        Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
    	String expectedSequences = ">AR06-275\ntcagaacagaccagaaccaacagccccaccagaagagagcttcaggtttggggaggagay\naacaactccccctcmgaagcgggagacgggagacamggaaytgtatcctttaacctccct\ncagatcactctttggcaacgacccctcgtcacaataaagataggggggcaactaaaagaa\ngctctattagatacaggagcagatgatacagtattagaagacatgaatttgccaggaaga\ntggaaaccaaaaatgatagggggaattggaggttttatcaaagtaagacagtatgatcag\natacccatagaartttgtgggcataaagctataggtacagtgttagtaggacctacacct\ngtcaacataattgggagaaatttgttgactaaaattggctgtactttaaattttcccatt\nagtcctattgagactgtaccagtaaaattaaagccaggaatggatgggccaaaagttaaa\ncaatggccattgacagaagaaaaaataaaagcattagtagaaatttgtacagaaatggaa\naaggaaggaaagatttcaagaattgggcctgaaaatccatacaatactccaatatttgcc\nataaagaaaaaagacagtactaaatggagaaaattagtagatttcagagaacttaacaag\nagaactcaagacttctgggaagttcaattaggaataccacatcccgcagggctaaaaaag\naaaaaatcagtaacagtactggatgtgggtgatgcatatttttcagtgcccttagataaa\ngacttcaggaagtatactgcatttaccatacctagtacaaacaatgagacaccaggaatt\nagatatcagtacaatgtgcttccacagggatggaaaggatcaccagcaatatttcaaagt\ngccatgacaaaaatcttagagccttttagaaaacaaaatccagacatagttatctatcaa\ntacatggatgatttatatgtaggatctgatttagaaatagggcaacacagaacaagagta\ngaggaactaagacaacatctgttaaagtggggatttaccacaccagacaaaaagcatcag\naaagaccctccatttctttggatgggttatgaactccatcctgataaatggacagtgcag\ncctatagtgctgccagaaaaagacagctggactgtcaatgacatacagaagttagtggga\naaattgaattgggcaagtcagatttacccagggattaaaataaagcaattatgtaagctc\ncttaggggagccaaagcactaacagaagtaataacaatgacagaagaagcagagctagaa\nctggcagaaaacagggagattctaaaagaaccagtacatggagcgtattatgacccatca\naaagacttaatagcagaaata------------------\n>test_vi\n------------------------------------------------------------\n---------------------------------------------------------cct\ncagatcactctttggcaacgacccmtcgtcacaataaaggtaggggggcaactaaaggaa\ngctctattagatacaggagcagatgatacagtattagaagaactaaatttgccaggaaaa\ntggaaaccaaaaatratagggggaattggaggttttgtcaaagtaagrcagtatgatcag\ngtacccatagaaatctgtggacataaagtcctaagtacagtattagtaggacctacacct\ngccaacataattggaaggaatttgttgactcarcttggttgcactttaaattttcccatt\nagtcctattgaaactgtaccagtaaaattaaagccaggaatggatggcccaaaagttaaa\ncaatggccattgacagaagaaaaaataaaagcattagtggaaatttgtacagaattagaa\naasgaaggaaaaatttcaaaaattgggcctgaaaatccatataatactccagtattcgcc\nataaagaaaaaaracagtactaagtggagaaaattagtagatttcagagaacttaataag\nagaactcaagacttctgggaagttcaattaggaataccacatcccgcagggttaaagaag\naaaaaatcagtaacagtactggatgtgggtgatgcatatttttcaattcccttagacaaa\ngacttcaggaagtatactgcwtttaccatacctagtataaacaatgagacaccagggatt\nagatatcagtacaatgtgcttccacagggatggaaaggatcaccatcaatattccaaagt\nagcatgacaaaaatcttagagccttttagaaaacaaaatccagacatagttatctatcag\ntatatggacgatctgtatgtaggatctgacttagagatagggcagcatagaacaaaaata\ngaggaactgagagaacatctatggaagtggggattttwcacaccagacaaaaaacatcag\naaagaacctccattcctttggatgggttatgaactccaccctgataaatggacagtacag\ncctatagtgctgccagaaaaggacagctggactgtcaatgacatacagaagttagtggga\naaattgaattgggcaagtcaratttacccagggattaaagtmaggcagttatgcaaactc\ncttaggggaaccaaagcactaacagaaataataccactaacaaaagaagcagagttagaa\nctggcagaaaatagggaaattctaaaagaaccagtacatggagcatattatgacccatca\naaagacttaatagcagaaatacagaagcaggagctaggt";
        String expectedScore = "7699";
        
        outputs.put("sequences", new StringOutputValidator(expectedSequences));
        outputs.put("score", new StringOutputValidator(expectedScore));
        
        testClient_.testService("regadb-align-clustalw", inputs, outputs);
    }
    
    public void test_regadb_consensus() throws Exception {
        Map<String,byte[]> inputs = new HashMap<String,byte[]>();
        inputs.put("reference", hiv1bRefSeq.getBytes());
        inputs.put("sequences", hiv1bRefSeqSmallChanges.getBytes());
        
        Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
        String expected = ">consensus\nTCAGACCAGATCAGAACCAACAGCCCCACCAGAAGAGAGCTTCAGGTTTGGGGAGGAGAYAACAACTCCCCCTCMGAAGCGGGAGACGGGAGACAMGGAAYTGTATCCTTTAACCTCCCTCAGATCACTCTTTGGCAACGACCCCTCGTCACAATAAAGATAGGGGGGCAACTAAAAGAAGCTCTATTAGATACAGGAGCAGATGATACAGTATTAGAAGACATGAATTTGCCAGGAAGATGGAAACCAAAAATGATAGGGGGAATTGGAGGTTTTATCAAAGTAAGACAGTATGATCAGATACCCATAGAARTTTGTGGGCATAAAGCTATAGGTACAGTGTTAGTAGGACCTACACCTGTCAACATAATTGGGAGAAATTTGTTGACTAAAATTGGCTGTACTTTAAATTTTCCCATTAGTCCTATTGAGACTGTACCAGTAAAATTAAAGCCAGGAATGGATGGGCCAAAAGTTAAACAATGGCCATTGACAGAAGAAAAAATAAAAGCATTAGTAGAAATTTGTACAGAAATGGAAAAGGAAGGAAAGATTTCAAGAATTGGGCCTGAAAATCCATACAATACTCCAATATTTGCCATAAAGAAAAAAGACAGTACTAAATGGAGAAAATTAGTAGATTTCAGAGAACTTAACAAGAGAACTCAAGACTTCTGGGAAGTTCAATTAGGAATACCACATCCCGCAGGGCTAAAAAAGAAAAAATCAGTAACAGTACTGGATGTGGGTGATGCATATTTTTCAGTGCCCTTAGATAAAGACTTCAGGAAGTATACTGCATTTACCATACCTAGTACAAACAATGAGACACCAGGAATTAGATATCAGTACAATGTGCTTCCACAGGGATGGAAAGGATCACCAGCAATATTTCAAAGTGCCATGACAAAAATCTTAGAGCCTTTTAGAAAACAAAATCCAGACATAGTTATCTATCAATACATGGATGATTTATATGTAGGATCTGATTTAGAAATAGGGCAACACAGAACAAGAGTAGAGGAACTAAGACAACATCTGTTAAAGTGGGGATTTACCACACCAGACAAAAAGCATCAGAAAGACCCTCCATTTCTTTGGATGGGTTATGAACTCCATCCTGATAAATGGACAGTGCAGCCTATAGTGCTGCCAGAAAAAGACAGCTGGACTGTCAATGACATACAGAAGTTAGTGGGAAAATTGAATTGGGCAAGTCAGATTTACCCAGGGATTAAAATAAAGCAATTATGTAAGCTCCTTAGGGGAGCCAAAGCACTAACAGAAGTAATAACAATGACAGAAGAAGCAGAGCTAGAACTGGCAGAAAACAGGGAGATTCTAAAAGAACCAGTACATGGAGCGTATTATGACCCATCAAAAGACTTAATAGCAGAAATA";
        
        outputs.put("consensus", new StringOutputValidator(expected));
        
        testClient_.testService("regadb-consensus", inputs, outputs);
    }
    
    public void test_regadb_hiv_align() throws Exception {
        Map<String,byte[]> inputs = new HashMap<String,byte[]>();
        inputs.put("organism_name", "HIV-1".getBytes());
        String nt_sequence = hiv1MutSeq;
        inputs.put("nt_sequence", nt_sequence.getBytes());
        
        Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
        String expected = "sequence=test_vi\nprotein=PR,start=1,end=99,mutations=V3I;GTC3ATC L10IL;CTC10MTC I15V;ATA15GTA M36L;ATG36CTA S37N;AGT37AAT R41K;AGA41AAA M46IM;ATG46ATR I54V;ATC54GTC R57R;AGA57AGR I62V;ATA62GTA L63P;CTC63CCC A71V;GCT71GTC I72L;ATA72CTA G73S;GGT73AGT V82A;GTC82GCC R87R;AGA87AGG L89L;CTG89TTG Q92Q;CAG92CAR I93L;ATT93CTT,aa_mutations=V3I L10IL I15V M36L S37N R41K M46IM I54V I62V L63P A71V I72L G73S V82A I93L\nprotein=RT,start=1,end=335,mutations=S3S;AGC3AGT E6E;GAG6GAA V35V;GTA35GTG E40E;GAG40GAA M41L;ATG41TTA K43KN;AAG43AAS G45G;GGG45GGA Y56Y;TAC56TAT F61F;TTT61TTC D67DN;GAC67RAC K70K;AAA70AAG K101K;AAA101AAG V118I;GTT118ATT D121D;GAT121GAC E122K;GAA122AAA A129A;GCA129GCW A158S;GCA158TCA Q182Q;CAA182CAG Y183Y;TAC183TAT D185D;GAT185GAC L187L;TTG187CTG E194E;GAA194GAG E204E;GAG204GAA Q207E;CAA207GAA L209L;CTG209CTA L210W;TTG210TGG R211K;AGG211AAG L214F;CTT214TTT T215FY;ACC215TWC H235H;CAT235CAC K249K;AAA249AAG G262G;GGG262GGA Q269Q;CAG269CAR V276V;GTA276GTM Q278Q;CAA278CAG C280C;TGT280TGC R284R;AGA284AGG V292I;GTA292ATA E297K;GAA297AAA L301L;CTA301TTA N306N;AAC306AAT R307R;AGA307AGG E308E;GAG308GAA V317A;GTG317GCA G333E;GGG333GAG Q334L;CAA334CTA G335G;GGC335GGT,aa_mutations=M41L K43KN D67DN V118I E122K A158S Q207E L210W R211K L214F T215FY V292I E297K V317A G333E Q334L";
        
        outputs.put("codon_mutations", new StringOutputValidator(expected));
        
        testClient_.testService("regadb-hiv-align", inputs, outputs);
    }
    
    public void test_regadb_hiv_subtype() throws Exception {
    	 Map<String,byte[]> inputs = new HashMap<String,byte[]>();
    	 inputs.put("nt_sequence", getHiv1bRefSeq().getBytes());
         
         Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
         outputs.put("subtype", new StringOutputValidator("HIV-1 Subtype B"));
         
         testClient_.testService("regadb-hiv-subtype", inputs, outputs);
    }
    
    public void test_regadb_hiv_type() throws Exception {
   	 Map<String,byte[]> inputs = new HashMap<String,byte[]>();
   	 inputs.put("nt_sequence", getHiv1bRefSeq().getBytes());
        
     Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
     outputs.put("type", new StringOutputValidator("HIV 1"));
        
        testClient_.testService("regadb-hiv-type", inputs, outputs);
    }
    
    public void test_regadb_hiv_subtype_v3() throws Exception {
      	 Map<String,byte[]> inputs = new HashMap<String,byte[]>();
      	 inputs.put("nt_sequence", getHiv1bRefSeq().getBytes());
           
         Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
         outputs.put("subtype", new StringOutputValidator("HIV-1 Subtype B"));
           
         testClient_.testService("regadb-hiv-subtype-v3", inputs, outputs);
    }
    
    public void test_regadb_hiv_resist_mutlist() throws Exception {
    	Map<String,byte[]> inputs = new HashMap<String,byte[]>();
    	
    	byte[] asi_rule = Files.readAllBytes(Paths.get(xmlLocation));
    	
    	inputs.put("viral_isolate", "PR,1-99:K20K,E35D,L89L,L63P,G68G,G94G,G86G,I66IV,Q92K,S37N,C95C,V75V,V3I;RT,1-329:L187L,E40E,R307R,K201R,L295M,H198H,K46K,Q197Q,I202V,V60I,L210L,K281K,F160F,V276I,E122K,L214F,R277K,G18G,F227F,D192D,I135T,T286A,G141G,V317A,P294T,V118V,L100L,V241V,E204E,G45G,G262G,S163A,S3S,N81N,R284R,L205L,R211K,K220K,K49R,E224D;p6,2-53:S3N,I31G,P30T,Q28R,L35L,R42R,K33KT,T21IT,T39T,V19E,E6E,Q26PQ,S17F;".getBytes());
    	inputs.put("asi_rules", asi_rule);
    	
    	Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
        
    	byte[] convert = Files.readAllBytes(Paths.get(regadb_hiv_resist_mutlist_result));
    	String expected = new String(convert, Charset.defaultCharset());
//        String expected = new String("Expected value");
    	
        outputs.put("interpretation", new StringOutputValidator(expected));
        
        testClient_.testService("regadb-hiv-resist-mutlist", inputs, outputs);
    }
    
//    public void test_bright_prepobb() throws Exception {
//    	Map<String,byte[]> inputs = new HashMap<String,byte[]>();
//      	inputs.put("vd", getHiv1bRefSeq().getBytes());
//      	inputs.put("idt", getHiv1bRefSeq().getBytes());
//      	inputs.put("str", getHiv1bRefSeq().getBytes());
//        Map<String,IOutputValidator> outputs = new HashMap<String,IOutputValidator>();
//        outputs.put("pla", new StringOutputValidator("HIV 1"));
//        outputs.put("qjt", new StringOutputValidator("HIV 1"));
//        outputs.put("dpa", new StringOutputValidator("HIV 1"));
//           
//        testClient_.testService("bright-prepobb", inputs, outputs);
//    }
    
    public void testService(String serviceName, Map<String,byte[]> inputs, Map<String,IOutputValidator> outputs) throws Exception{
        int timeout = 1000 * 60 * 5; //5 minutes
        testService(serviceName, inputs, outputs, timeout);
    }

    public void testService(String serviceName, Map<String,byte[]> inputs, Map<String,IOutputValidator> outputs, int timeout) throws Exception{
        WtsClient wtsClient = new WtsClient(getUrl());
        System.out.println("URL: " + getUrl());
        System.out.println("Username: " + getUserName());
        System.out.println(wtsClient.getUrl());
        String challenge = "";
        try {
        	challenge = wtsClient.getChallenge(getUserName());
        } catch(RemoteException e) {
        	e.printStackTrace();
        }
        	System.out.println("Challenge: " + challenge);
        String sessionTicket = wtsClient.login(getUserName(), challenge, getPassword(), serviceName);
        
        for(Map.Entry<String,byte[]> e : inputs.entrySet()){
            wtsClient.upload(sessionTicket, serviceName, e.getKey(), e.getValue());
        }
        wtsClient.start(sessionTicket, serviceName);
        
        int totalTime=0;
        int sleep=500;
        
        while(!wtsClient.monitorStatus(sessionTicket, serviceName).startsWith("ENDED")){
            if(totalTime >= timeout){
                throw new TimeOutException();
            }
            Thread.sleep(sleep);
            totalTime += sleep;
        }
        
        for(Map.Entry<String, IOutputValidator> e : outputs.entrySet()){
        	System.out.println("ServiceName: " + serviceName + " Key: " + e.getKey());
            byte[] res = wtsClient.download(sessionTicket, serviceName, e.getKey());
            e.getValue().validate(res);
        }
    }

    private void setUrl(String url) {
        this.url = url;
    }

    private String getUrl() {
        return url;
    }

    private void setUserName(String userName) {
        this.userName = userName;
    }

    private String getUserName() {
        return userName;
    }

    private void setPassword(String password) {
        this.password = password;
    }

    private String getPassword() {
        return password;
    }

    private void setHiv1bRefSeq(String hiv1bRefSeq) {
        this.hiv1bRefSeq = hiv1bRefSeq;
    }

    private String getHiv1bRefSeq() {
        return hiv1bRefSeq;
    }

    private void setHiv1MutSeq(String hiv1MutSeq) {
        this.hiv1MutSeq = hiv1MutSeq;
    }

    private String getHiv1MutSeq() {
        return hiv1MutSeq;
    }

    public interface IOutputValidator{
        void validate(byte[] output);
    }
    
    public class StringOutputValidator implements IOutputValidator{
        private String expected;
        
        public StringOutputValidator(String expected){
            this.expected = expected;
        }
        public void validate(byte[] output){
            assertEquals(expected, new String(output).trim());
        }
    }
    
    public class TimeOutException extends Exception{
        
    }
}