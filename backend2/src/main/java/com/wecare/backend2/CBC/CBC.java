package com.wecare.backend2.CBC;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wecare.backend2.Doctor.Doctor;
import com.wecare.backend2.Patient.Patient;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


@Entity
public class CBC {

	
    @Id
    @GeneratedValue
    private int cbc_id;

    private LocalDate Examination_Date;

	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnore
	private Patient patient;



	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnore
	private Doctor doctor;


	@Nullable
    private int Haemoglobin;
    
    @Nullable
    private int Hematocrit;
    
    @Nullable
    private int RedCellCount;
    
    @Nullable
    private int MCV;
    
    @Nullable
    private int MCH;
    
    @Nullable
    private int MCHC;
    
    @Nullable
    private int RDW;
    
    @Nullable
    private int PlateletCount;
    
    @Nullable
    private int TLC;
    
    @Nullable
    private int Basophils;
    
    @Nullable
    private int Eosinophils;
    
    @Nullable
    private int Stab;
    
    @Nullable
    private int Segmented;
    
    @Nullable
    private int Lymphocytes;
    
    @Nullable
    private int Monocytes;

    @Nullable
    private String Comments;



	private static String TestName = "CBC Test";

	public static String getTestName() {
		return TestName;
	}

	public CBC() {
    	
    }

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public int getCbc_id() {
		return cbc_id;
	}


	public LocalDate getExamination_Date() {
		return Examination_Date;
	}

	public void setExamination_Date(LocalDate examination_Date) {
		Examination_Date = examination_Date;
	}

	public int getHaemoglobin() {
		return Haemoglobin;
	}

	public void setHaemoglobin(int haemoglobin) {
		Haemoglobin = haemoglobin;
	}

	public int getHematocrit() {
		return Hematocrit;
	}

	public void setHematocrit(int hematocrit) {
		Hematocrit = hematocrit;
	}

	public int getRedCellCount() {
		return RedCellCount;
	}

	public void setRedCellCount(int redCellCount) {
		RedCellCount = redCellCount;
	}

	public int getMCV() {
		return MCV;
	}

	public void setMCV(int mCV) {
		MCV = mCV;
	}

	public int getMCH() {
		return MCH;
	}

	public void setMCH(int mCH) {
		MCH = mCH;
	}

	public int getMCHC() {
		return MCHC;
	}

	public void setMCHC(int mCHC) {
		MCHC = mCHC;
	}

	public int getRDW() {
		return RDW;
	}

	public void setRDW(int rDW) {
		RDW = rDW;
	}

	public int getPlateletCount() {
		return PlateletCount;
	}

	public void setPlateletCount(int plateletCount) {
		PlateletCount = plateletCount;
	}

	public int getTLC() {
		return TLC;
	}

	public void setTLC(int tLC) {
		TLC = tLC;
	}

	public int getBasophils() {
		return Basophils;
	}

	public void setBasophils(int basophils) {
		Basophils = basophils;
	}

	public int getEosinophils() {
		return Eosinophils;
	}

	public void setEosinophils(int eosinophils) {
		Eosinophils = eosinophils;
	}

	public int getStab() {
		return Stab;
	}

	public void setStab(int stab) {
		Stab = stab;
	}

	public int getSegmented() {
		return Segmented;
	}

	public void setSegmented(int segmented) {
		Segmented = segmented;
	}

	public int getLymphocytes() {
		return Lymphocytes;
	}

	public void setLymphocytes(int lymphocytes) {
		Lymphocytes = lymphocytes;
	}

	public int getMonocytes() {
		return Monocytes;
	}

	public void setMonocytes(int monocytes) {
		Monocytes = monocytes;
	}

	public String getComments() {
		return Comments;
	}

	public void setComments(String comments) {
		Comments = comments;
	}


	public CBC(int cbc_id, LocalDate examination_Date, Patient patient, Doctor doctor, int haemoglobin, int hematocrit, int redCellCount, int MCV, int MCH, int MCHC, int RDW, int plateletCount, int TLC, int basophils, int eosinophils, int stab, int segmented, int lymphocytes, int monocytes, String comments) {
		this.cbc_id = cbc_id;
		Examination_Date = examination_Date;
		this.patient = patient;
		this.doctor = doctor;
		Haemoglobin = haemoglobin;
		Hematocrit = hematocrit;
		RedCellCount = redCellCount;
		this.MCV = MCV;
		this.MCH = MCH;
		this.MCHC = MCHC;
		this.RDW = RDW;
		PlateletCount = plateletCount;
		this.TLC = TLC;
		Basophils = basophils;
		Eosinophils = eosinophils;
		Stab = stab;
		Segmented = segmented;
		Lymphocytes = lymphocytes;
		Monocytes = monocytes;
		Comments = comments;
	}
}
