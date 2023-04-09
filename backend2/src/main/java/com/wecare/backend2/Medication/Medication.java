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


}
