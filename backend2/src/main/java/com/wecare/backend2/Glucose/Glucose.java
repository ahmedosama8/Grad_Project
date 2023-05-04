package com.wecare.backend2.Glucose;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.wecare.backend2.Patient.Patient;
import jakarta.persistence.GeneratedValue;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;
import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
public class Glucose {


	@Id
    @GeneratedValue
    private int Glucose_id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="patient_id")
	@JsonIgnore
	private Patient patient;

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	private LocalDate Examination_Date;
    
    @Nullable
    private int RBC;
    
    @Nullable
    private int RBS;
    
    @Nullable
    private String Comments;
    
    public Glucose() {
    	
    }

	public int getGlucose_id() {
		return Glucose_id;
	}


	public LocalDate getExamination_Date() {
		return Examination_Date;
	}

	public void setExamination_Date(LocalDate examination_Date) {
		Examination_Date = examination_Date;
	}

	public int getRBC() {
		return RBC;
	}

	public void setRBC(int rBC) {
		RBC = rBC;
	}

	public int getRBS() {
		return RBS;
	}

	public void setRBS(int rBS) {
		RBS = rBS;
	}

	public String getComments() {
		return Comments;
	}

	public void setComments(String comments) {
		Comments = comments;
	}

	public Glucose(int glucose_id,Patient patient , LocalDate examination_Date, int rBC, int rBS,
			String comments) {
		this.Glucose_id = glucose_id;
		this.patient = patient;
		this.Examination_Date = examination_Date;
		this.RBC = rBC;
		this.RBS = rBS;
		this.Comments = comments;
	}

}
