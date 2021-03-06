package net.sf.regadb.db;


/**
 * PatientDatasetId generated by hbm2java
 */
public class PatientDatasetId implements java.io.Serializable {

    private Dataset dataset;

    private PatientImpl patient;

    public PatientDatasetId() {
    }

    public PatientDatasetId(Dataset dataset, PatientImpl patient) {
        this.dataset = dataset;
        this.patient = patient;
    }

    public Dataset getDataset() {
        return this.dataset;
    }

    public void setDataset(Dataset dataset) {
        this.dataset = dataset;
    }

    public PatientImpl getPatient() {
        return this.patient;
    }

    public void setPatient(PatientImpl patient) {
        this.patient = patient;
    }

}
