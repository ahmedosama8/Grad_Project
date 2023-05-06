package com.wecare.backend2.Diagnosis;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wecare.backend2.Doctor.Doctor;
import com.wecare.backend2.Patient.Patient;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;

@Entity
public class Diagnosis {

    @Id
    @GeneratedValue
    private int diagnosisId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    private Patient patient;

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    private Doctor doctor;

    @Nullable
    private String BodyPartExamined;
    
    @Nullable
    private String Medications;

    @Nullable
    private String Report;

    public String getBodyPartExamined() {
        return BodyPartExamined;
    }

    public void setBodyPartExamined(String bodyPartExamined) {
        this.BodyPartExamined = bodyPartExamined;
    }

    public String getMedications() {
        return Medications;
    }

    public void setMedications(String medications) {
        Medications = medications;
    }

    public String getReport() {
        return Report;
    }

    public void setReport(String report) {
        Report = report;
    }

    public Diagnosis(int diagnosisId, Patient patient, Doctor doctor,String bodyPartExamined,String medications ,String report) {
        this.diagnosisId = diagnosisId;
        this.patient = patient;
        this.doctor = doctor;
        this.BodyPartExamined = bodyPartExamined;
        this.Medications = medications;
        this.Report = report;
    }

    public Diagnosis() {
    }

    public int getDiagnosisId() {
        return diagnosisId;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }
}
