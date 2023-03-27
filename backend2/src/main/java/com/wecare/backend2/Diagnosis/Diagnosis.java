package com.wecare.backend2.Diagnosis;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wecare.backend2.Doctor.Doctor;
import com.wecare.backend2.Patient.Patient;
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

    public Diagnosis(int diagnosisId, Patient patient, Doctor doctor) {
        this.diagnosisId = diagnosisId;
        this.patient = patient;
        this.doctor = doctor;
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
