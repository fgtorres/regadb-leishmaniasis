package net.sf.regadb.install.generateGenomes;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import net.sf.regadb.db.Genome;
import net.sf.regadb.db.OpenReadingFrame;
import net.sf.regadb.db.Protein;
import net.sf.regadb.db.SplicingPosition;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;

public class ExportGenome {
    public static void main(String[] args){
        Collection<Genome> genomes = new ArrayList<Genome>();

        GenerateGenome hiv1gen = new GenerateGenome("HIV-1","K03455.1|HIVHXB2CG Human immunodeficiency virus type 1 (HXB2)","K03455",GenerateGenome.getReferenceSequence("k03455.fasta"));
        Genome hiv1 = hiv1gen.generateFromFile("k03455.genome");
        genomes.add(hiv1);
        
        GenerateGenome hiv2rodGen = new GenerateGenome("HIV-2A","ROD Human immunodeficiency virus type 2A","M15390",GenerateGenome.getReferenceSequence("hiv2rod.fasta"));
        Genome hiv2rod = hiv2rodGen.generateFromFile("hiv2rod.genome");
        genomes.add(hiv2rod);
        
        GenerateGenome hiv2ehoGen = new GenerateGenome("HIV-2B","EHO Human immunodeficiency virus type 2B","U27200",GenerateGenome.getReferenceSequence("hiv2eho.fasta"));
        Genome hiv2eho = hiv2ehoGen.generateFromFile("hiv2eho.genome");
        genomes.add(hiv2eho);
        
        GenerateGenome hcvGen = new GenerateGenome("HCV","Hepatitis C virus","AF009606",GenerateGenome.getReferenceSequence("AF009606.fasta"));
        Genome hcv = hcvGen.generateFromFile("AF009606.genome");
        genomes.add(hcv);
        
        GenerateGenome htlv1Gen = new GenerateGenome("HTLV-1","Human T-lymphotropic virus Type 1","J02029",GenerateGenome.getReferenceSequence("J02029.fasta"));
        Genome htlv1 = htlv1Gen.generateFromFile("J02029.genome");
        genomes.add(htlv1);
        
        GenerateGenome hiv1ogen = new GenerateGenome("HIV-1 O","Human immunodeficiency virus type 1 (group O)","L20587",GenerateGenome.getReferenceSequence("L20587.fasta"));
        Genome hiv1o = hiv1ogen.generateFromFile("L20587.genome");
        genomes.add(hiv1o);
        
        Genome leishmaniasis = new Genome("Leishmaniasis", "Leishmaniasis");
        leishmaniasis.setGenbankNumber("U31221.1");
        genomes.add(leishmaniasis);

        String fileName = "genomes.xml";
        ExportGenome export = new ExportGenome();
        export.exportToXml(genomes, fileName);
    }
    
    public void exportToXml(Collection<Genome> genomes, String fileName){
        Element root = toXml(genomes);
        writeXMLFile(root, fileName);
    }
    
    public Element toXml(Collection<Genome> genomes){
        Element root = new Element("genomes");
        for(Genome g : genomes)
            root.addContent(toXml(g));
        return root;
    }
    
    public static void writeXMLFile(Element root, String fileName)
    {
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
    
    public Element toXml(Genome g){
        Element genomeEl = new Element("genome");
        genomeEl.setAttribute("organismName", g.getOrganismName());
        genomeEl.setAttribute("organismDescription", g.getOrganismDescription());
        genomeEl.setAttribute("genbankNumber", g.getGenbankNumber());
        genomeEl.setAttribute("version",g.getVersion()+"");
        
        for(OpenReadingFrame orf : g.getOpenReadingFrames())
            genomeEl.addContent(toXml(orf));
        
        return genomeEl;
    }
    
    public Element toXml(OpenReadingFrame orf){
        Element orfEl = new Element("openReadingFrame");
        orfEl.setAttribute("name",orf.getName());
        orfEl.setAttribute("description",orf.getDescription());
        orfEl.setAttribute("referenceSequence",orf.getReferenceSequence());
        orfEl.setAttribute("version",orf.getVersion()+"");
        
        for(Protein p : orf.getProteins())
            orfEl.addContent(toXml(p));
        return orfEl;
    }
    
    public Element toXml(Protein p){
        Element pEl = new Element("protein");
        pEl.setAttribute("fullName", p.getFullName());
        pEl.setAttribute("abbreviation", p.getAbbreviation());
        pEl.setAttribute("startPosition", p.getStartPosition() +"");
        pEl.setAttribute("stopPosition", p.getStopPosition() +"");
        pEl.setAttribute("version",p.getVersion()+"");
        
        for(SplicingPosition sp : p.getSplicingPositions())
            pEl.addContent(toXml(sp));
        return pEl;
    }
    
    public Element toXml(SplicingPosition sp){
        Element spEl = new Element("splicingPosition");
        spEl.setAttribute("ntPosition",sp.getNtPosition()+"");
        spEl.setAttribute("version",sp.getVersion()+"");
        return spEl;
    }
}
