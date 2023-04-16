package com.wecare.backend2.Allergy;

import com.wecare.backend2.Patient.Patient;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
public class Allergy {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long allergyId;

    @ManyToOne
    @JoinColumn(name="patient_id")
    private Patient patient;

    private String allergyName;

    @Nullable
    private String allergySeverity;

    @Nullable
    private LocalDate allergyOnsetDate;

    public Allergy(Long allergyId, Patient patient, String allergyName, String allergySeverity, LocalDate allergyOnsetDate) {
        this.allergyId = allergyId;
        this.patient = patient;
        this.allergyName = allergyName;
        this.allergySeverity = allergySeverity;
        this.allergyOnsetDate = allergyOnsetDate;
    }

    public Allergy() {
    }

    public Long getAllergyId() {
        return allergyId;
    }


    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public String getAllergyName() {
        return allergyName;
    }

    public void setAllergyName(String allergyName) {
        this.allergyName = allergyName;
    }

    public String getAllergySeverity() {
        return allergySeverity;
    }

    public void setAllergySeverity(String allergySeverity) {
        this.allergySeverity = allergySeverity;
    }

    public LocalDate getAllergyOnsetDate() {
        return allergyOnsetDate;
    }

    public void setAllergyOnsetDate(LocalDate allergyOnsetDate) {
        this.allergyOnsetDate = allergyOnsetDate;
    }
}
