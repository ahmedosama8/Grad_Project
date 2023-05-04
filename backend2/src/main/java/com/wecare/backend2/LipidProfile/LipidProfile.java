package com.wecare.backend2.LipidProfile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
public class LipidProfile {
	
    @Id
    @GeneratedValue
    private int LipidProfile_id;
    
    private String First_Name;
    
    private String Last_Name;
    
    private LocalDate Examination_Date;
    
    @Nullable
    private int ALT;
    
    @Nullable
    private int AST;
    
    @Nullable
    private int Albumin;
    
    @Nullable
    private int CholestrolTotal;
    
    @Nullable
    private int HDL_C;
    
    @Nullable
    private int LDL_C;
    
    @Nullable
    private int Triglycerides;
    
    @Nullable
    private String Comments;

    public LipidProfile() {
    	
    }
    
	public int getLipidProfile_id() {
		return LipidProfile_id;
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

	public int getAlbumin() {
		return Albumin;
	}

	public void setAlbumin(int albumin) {
		Albumin = albumin;
	}

	public int getCholestrolTotal() {
		return CholestrolTotal;
	}

	public void setCholestrolTotal(int cholestrolTotal) {
		CholestrolTotal = cholestrolTotal;
	}

	public int getHDL_C() {
		return HDL_C;
	}

	public void setHDL_C(int hDL_C) {
		HDL_C = hDL_C;
	}

	public int getLDL_C() {
		return LDL_C;
	}

	public void setLDL_C(int lDL_C) {
		LDL_C = lDL_C;
	}

	public int getTriglycerides() {
		return Triglycerides;
	}

	public void setTriglycerides(int triglycerides) {
		Triglycerides = triglycerides;
	}

	public String getComments() {
		return Comments;
	}

	public void setComments(String comments) {
		Comments = comments;
	}

	public LipidProfile(int lipidProfile_id, String first_Name, String last_Name, LocalDate examination_Date, int aLT,
			int aST, int albumin, int cholestrolTotal, int hDL_C, int lDL_C, int triglycerides, String comments) {
		this.LipidProfile_id = lipidProfile_id;
		this.First_Name = first_Name;
		this.Last_Name = last_Name;
		this.Examination_Date = examination_Date;
		this.ALT = aLT;
		this.AST = aST;
		this.Albumin = albumin;
		this.CholestrolTotal = cholestrolTotal;
		this.HDL_C = hDL_C;
		this.LDL_C = lDL_C;
		this.Triglycerides = triglycerides;
		this.Comments = comments;
	}

}
