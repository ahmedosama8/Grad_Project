package com.wecare.backend2.Medication;

import com.wecare.backend2.Diagnosis.Diagnosis;
import com.wecare.backend2.Patient.Patient;
import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
public class Medication {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long medicationId;

    @ManyToOne
    @JoinColumn(name="patient_id")
    private Patient patient;

    @ManyToOne
    @JoinColumn(name="diagnosisId")
    private Diagnosis diagnosis;

    private String medicationName;

    private String medicationDose;

    private String instructions;

    private LocalDate startDate;
    private LocalDate endDate;

    public Medication() {
    }

    public Medication(Long medicationId, Patient patient, Diagnosis diagnosis, String medicationName, String medicationDose, String instructions, LocalDate startDate, LocalDate endDate) {
        this.medicationId = medicationId;
        this.patient = patient;
        this.diagnosis = diagnosis;
        this.medicationName = medicationName;
        this.medicationDose = medicationDose;
        this.instructions = instructions;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Long getMedicationId() {
        return medicationId;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Diagnosis getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(Diagnosis diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getMedicationName() {
        return medicationName;
    }

    public void setMedicationName(String medicationName) {
        this.medicationName = medicationName;
    }

    public String getMedicationDose() {
        return medicationDose;
    }

    public void setMedicationDose(String medicationDose) {
        this.medicationDose = medicationDose;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }
}
