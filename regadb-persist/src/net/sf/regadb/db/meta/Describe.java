/*
 * Created on May 16, 2007
 *
 * To change the template for this generated file go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
package net.sf.regadb.db.meta;

import net.sf.regadb.db.AaInsertion;
import net.sf.regadb.db.AaMutation;
import net.sf.regadb.db.AaSequence;
import net.sf.regadb.db.Analysis;
import net.sf.regadb.db.AnalysisData;
import net.sf.regadb.db.Attribute;
import net.sf.regadb.db.AttributeGroup;
import net.sf.regadb.db.AttributeNominalValue;
import net.sf.regadb.db.Dataset;
import net.sf.regadb.db.DrugCommercial;
import net.sf.regadb.db.DrugGeneric;
import net.sf.regadb.db.Event;
import net.sf.regadb.db.EventNominalValue;
import net.sf.regadb.db.Genome;
import net.sf.regadb.db.NtSequence;
import net.sf.regadb.db.OpenReadingFrame;
import net.sf.regadb.db.Patient;
import net.sf.regadb.db.PatientAttributeValue;
import net.sf.regadb.db.PatientEventValue;
import net.sf.regadb.db.Protein;
import net.sf.regadb.db.Test;
import net.sf.regadb.db.TestNominalValue;
import net.sf.regadb.db.TestObject;
import net.sf.regadb.db.TestResult;
import net.sf.regadb.db.TestType;
import net.sf.regadb.db.Therapy;
import net.sf.regadb.db.TherapyCommercial;
import net.sf.regadb.db.TherapyGeneric;
import net.sf.regadb.db.ValueType;
import net.sf.regadb.db.ViralIsolate;

public class Describe {

    public static String describe(Patient o) {
        return "Patient (in " + describe(o.getSourceDataset()) + "): '" + o.getPatientId() + "'";
    }

    public static String describe(AttributeNominalValue o) {
        return "Attribute nominal value '" + o.getValue() + "'";
    }
    
    public static String describe(EventNominalValue o) {
        return "Event nominal value '" + o.getValue() + "'";
    }

    public static String describe(ViralIsolate o) {
        return "Viral isolate '" + o.getSampleId() + "'";
    }

    public static String describe(NtSequence o) {
        return "Nucleotide sequence '" + o.getLabel() + "'";
    }

    public static String describe(AaSequence o) {
        return "Amino Acid sequence for " + describe(o.getProtein()) + "";
    }

    public static String describe(Protein o) {
        return "Protein " + o.getAbbreviation();
    }

    public static String describe(AaMutation o) {
        return "Mutation at position " + o.getId().getMutationPosition();
    }

    public static String describe(AaInsertion o) {
        return "Insertion " + o.getId().getInsertionOrder() + " at position " + o.getId().getInsertionPosition();
    }

    public static String describe(Therapy o) {
        return "Therapy starting at date " + o.getStartDate();
    }

    public static String describe(TherapyCommercial o) {
        return "Drug " + o.getId().getDrugCommercial().getName();
    }

    public static String describe(TherapyGeneric o) {
        return "Drug " + o.getId().getDrugGeneric().getGenericId();
    }

    public static String describe(TestResult o) {
        String s = "Result for " + describe(o.getTest()) + " on date " + o.getTestDate();
        if (o.getDrugGeneric() != null)
            s += " for " + describe(o.getDrugGeneric());
        if (o.getViralIsolate() != null)
            s += " for " + describe(o.getViralIsolate());
        return s;
    }

    public static String describe(Test o) {
        return "Test '" + o.getDescription() + "'";
    }

    public static String describe(ValueType o) {
        return "Value type '" + o.getDescription() + "'";
    }

    public static String describe(TestObject o) {
        return "Test Category '" + o.getDescription() + "'";
    }

    public static String describe(TestNominalValue o) {
        return "Test nominal value '" + o.getValue() + "'";
    }

    public static String describe(PatientAttributeValue o) {
        return "Value for " + describe(o.getAttribute());
    }
    
    public static String describe(PatientEventValue o) {
        return "Value for " + describe(o.getEvent());
    }

    public static String describe(Attribute o) {
        return "Attribute '" + o.getName() + "'";
    }
    
    public static String describe(Event o) {
        return "Event '" + o.getName() + "'";
    }

    public static String describe(TestType o) {
        return "Test type '" + o.getDescription() + "' "+ (o.getGenome() != null ? describe(o.getGenome()):"");
    }

    public static String describe(Genome o){
        return "Genome '"+ o.getOrganismName() +"'";
    }
    
    public static String describe(DrugGeneric o) {
        return "Generic drug '" + o.getGenericId() + "'";
    }

    public static String describe(DrugCommercial o) {
        return "Commercial drug '" + o.getName() + "'";
    }

    public static String describe(Dataset o) {
        if (o == null)
            return "null Data set";
        else
            return "Data set '" + o.getDescription() + "'";
    }
    
    public static String describe(AttributeGroup o) {
        return "Attribute group '" + o.getGroupName() + "'";
    }

    public static String describe(Analysis o) {
        return "Analysis for '" + o.getUrl() + o.getServiceName();
    }

    public static String describe(AnalysisData o) {
        return "Analysis data'" + o.getName() + "'";
    }

    public static String describe(OpenReadingFrame o) {
        return "OpenReadingFrame '"+ o.getName() +"'";
    }

}
