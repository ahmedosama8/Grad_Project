package com.gp.gp.Diagnosis;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.gp.gp.Patient.Patient;
import jakarta.persistence.*;

@Entity
public class Diagnosis {

    @Id
    @GeneratedValue
    private int diagnosisId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    private Patient patient;
}
