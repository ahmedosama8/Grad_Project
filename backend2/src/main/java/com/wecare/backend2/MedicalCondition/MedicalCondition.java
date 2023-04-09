package com.wecare.backend2.MedicalCondition;

import com.wecare.backend2.Patient.Patient;
import jakarta.persistence.*;

@Entity
public class MedicalCondition {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long medicalConditionId;

    @ManyToOne
    @JoinColumn(name="patient_id")
    private Patient patient;

    private String conditionName;

    private String conditionSeverity;

    private String conditionOnsetDate;

    public MedicalCondition(Long medicalConditionId, Patient patient, String conditionName, String conditionSeverity, String conditionOnsetDate) {
        this.medicalConditionId = medicalConditionId;
        this.patient = patient;
        this.conditionName = conditionName;
        this.conditionSeverity = conditionSeverity;
        this.conditionOnsetDate = conditionOnsetDate;
    }

    public MedicalCondition() {
    }

    public Long getMedicalConditionId() {
        return medicalConditionId;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public String getConditionName() {
        return conditionName;
    }

    public void setConditionName(String conditionName) {
        this.conditionName = conditionName;
    }

    public String getConditionSeverity() {
        return conditionSeverity;
    }

    public void setConditionSeverity(String conditionSeverity) {
        this.conditionSeverity = conditionSeverity;
    }

    public String getConditionOnsetDate() {
        return conditionOnsetDate;
    }

    public void setConditionOnsetDate(String conditionOnsetDate) {
        this.conditionOnsetDate = conditionOnsetDate;
    }
}
