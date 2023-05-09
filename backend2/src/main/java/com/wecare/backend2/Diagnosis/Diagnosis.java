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

    private String code;
    private String diagnosis;

    public Diagnosis(int diagnosisId, String code, String diagnosis) {
        this.diagnosisId = diagnosisId;
        this.code = code;
        this.diagnosis = diagnosis;
    }

    public Diagnosis() {
    }

    public int getDiagnosisId() {
        return diagnosisId;
    }


    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }
}