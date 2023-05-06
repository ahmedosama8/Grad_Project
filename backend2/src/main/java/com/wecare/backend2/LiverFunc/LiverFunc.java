package com.wecare.backend2.LiverFunc;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wecare.backend2.Patient.Patient;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
public class LiverFunc {

    @Id
    @GeneratedValue
    private int LiverFunc_id;

    private LocalDate Examination_Date;

	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnore
	private Patient patient;

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	@Nullable
    private int ALT;
    
    @Nullable
    private int AST;
    
    @Nullable
    private int ALB;
    
    @Nullable
    private int DBIL;
    
    @Nullable
    private int TBIL;
    
    @Nullable
    private int ALP;
    
    @Nullable
    private String Comments;

	@Nullable
	public String getLabName() {
		return LabName;
	}

	public void setLabName(@Nullable String labName) {
		LabName = labName;
	}

	@Nullable
	private String LabName;

	private static String TestName = "Liver Function Test";

	public static String getTestName() {
		return TestName;
	}
    
    public LiverFunc() {
    	
    }

	public int getLiverFunc_id() {
		return LiverFunc_id;
	}


	public LocalDate getExamination_Date() {
		return Examination_Date;
	}

	public void setExamination_Date(LocalDate examination_Date) {
		Examination_Date = examination_Date;
	}

	public int getALT() {
		return ALT;
	}

	public void setALT(int aLT) {
		ALT = aLT;
	}

	public int getAST() {
		return AST;
	}

	public void setAST(int aST) {
		AST = aST;
	}

	public int getALB() {
		return ALB;
	}

	public void setALB(int aLB) {
		ALB = aLB;
	}

	public int getDBIL() {
		return DBIL;
	}

	public void setDBIL(int dBIL) {
		DBIL = dBIL;
	}

	public int getTBIL() {
		return TBIL;
	}

	public void setTBIL(int tBIL) {
		TBIL = tBIL;
	}

	public int getALP() {
		return ALP;
	}

	public void setALP(int aLP) {
		ALP = aLP;
	}

	public String getComments() {
		return Comments;
	}

	public void setComments(String comments) {
		Comments = comments;
	}

	public LiverFunc(int liverFunc_id,Patient patient, LocalDate examination_Date, int aLT,
			int aST, int aLB, int dBIL, int tBIL, int aLP, String comments, String labName) {
		this.LiverFunc_id = liverFunc_id;
		this.Examination_Date = examination_Date;
		this.patient = patient;
		this.ALT = aLT;
		this.AST = aST;
		this.ALB = aLB;
		this.DBIL = dBIL;
		this.TBIL = tBIL;
		this.ALP = aLP;
		this.Comments = comments;
		this.LabName = labName;
	}
}
