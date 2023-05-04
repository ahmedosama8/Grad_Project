package com.wecare.backend2.LiverFunc;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class LiverFunc {

    @Id
    @GeneratedValue
    private int LiverFunc_id;
    
    private String First_Name;
    
    private String Last_Name;
    
    private LocalDate Examination_Date;
    
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
    
    public LiverFunc() {
    	
    }

	public int getLiverFunc_id() {
		return LiverFunc_id;
	}


	public String getFirst_Name() {
		return First_Name;
	}

	public void setFirst_Name(String first_Name) {
		First_Name = first_Name;
	}

	public String getLast_Name() {
		return Last_Name;
	}

	public void setLast_Name(String last_Name) {
		Last_Name = last_Name;
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

	public LiverFunc(int liverFunc_id, String first_Name, String last_Name, LocalDate examination_Date, int aLT,
			int aST, int aLB, int dBIL, int tBIL, int aLP, String comments) {
		this.LiverFunc_id = liverFunc_id;
		this.First_Name = first_Name;
		this.Last_Name = last_Name;
		this.Examination_Date = examination_Date;
		this.ALT = aLT;
		this.AST = aST;
		this.ALB = aLB;
		this.DBIL = dBIL;
		this.TBIL = tBIL;
		this.ALP = aLP;
		this.Comments = comments;
	}
}
