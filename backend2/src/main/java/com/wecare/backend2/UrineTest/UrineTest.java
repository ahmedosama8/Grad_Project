package com.wecare.backend2.UrineTest;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wecare.backend2.Doctor.Doctor;
import com.wecare.backend2.Patient.Patient;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
public class UrineTest {
	
    @Id
    @GeneratedValue
    private int UrineTest_id;
    
    private LocalDate Examination_Date;

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnore
	private Doctor doctor;

	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnore
	private Patient patient;

    @Nullable
    private String Color;
    
    @Nullable
    private String Clarity;
    
    @Nullable
    private int Specific_Gravity;
    
    @Nullable
    private int PH;
    
    @Nullable
    private String Protein;
    
    @Nullable
    private String Glucose;
    
    @Nullable
    private String Ketone;
    
    @Nullable
    private String Urobilinogen;
    
    @Nullable
    private String Bilirubin;
    
    @Nullable
    private String Nitrite;
    
    @Nullable
    private int Pus_Cells;
    
    @Nullable
    private int Red_Cells;
    
    @Nullable
    private String Epithelial_Cells;
    
    @Nullable
    private String Amorphous;
    
    @Nullable
    private String Crystals;
    
    @Nullable
    private String Casts;
    
    @Nullable
    private String Others;
    
    @Nullable
    private String Comments;

	private static String TestName = "Urine Test";

	public static String getTestName() {
		return TestName;
	}

    
    public UrineTest() {
    	
    }

	public int getUrineTest_id() {
		return UrineTest_id;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public LocalDate getExamination_Date() {
		return Examination_Date;
	}

	public void setExamination_Date(LocalDate examination_Date) {
		Examination_Date = examination_Date;
	}

	public String getColor() {
		return Color;
	}

	public void setColor(String color) {
		Color = color;
	}

	public String getClarity() {
		return Clarity;
	}

	public void setClarity(String clarity) {
		Clarity = clarity;
	}

	public int getSpecific_Gravity() {
		return Specific_Gravity;
	}

	public void setSpecific_Gravity(int specific_Gravity) {
		Specific_Gravity = specific_Gravity;
	}

	public int getPH() {
		return PH;
	}

	public void setPH(int pH) {
		PH = pH;
	}

	public String getProtein() {
		return Protein;
	}

	public void setProtein(String protein) {
		Protein = protein;
	}

	public String getGlucose() {
		return Glucose;
	}

	public void setGlucose(String glucose) {
		Glucose = glucose;
	}

	public String getKetone() {
		return Ketone;
	}

	public void setKetone(String ketone) {
		Ketone = ketone;
	}

	public String getUrobilinogen() {
		return Urobilinogen;
	}

	public void setUrobilinogen(String urobilinogen) {
		Urobilinogen = urobilinogen;
	}

	public String getBilirubin() {
		return Bilirubin;
	}

	public void setBilirubin(String bilirubin) {
		Bilirubin = bilirubin;
	}

	public String getNitrite() {
		return Nitrite;
	}

	public void setNitrite(String nitrite) {
		Nitrite = nitrite;
	}

	public int getPus_Cells() {
		return Pus_Cells;
	}

	public void setPus_Cells(int pus_Cells) {
		Pus_Cells = pus_Cells;
	}

	public int getRed_Cells() {
		return Red_Cells;
	}

	public void setRed_Cells(int red_Cells) {
		Red_Cells = red_Cells;
	}

	public String getEpithelial_Cells() {
		return Epithelial_Cells;
	}

	public void setEpithelial_Cells(String epithelial_Cells) {
		Epithelial_Cells = epithelial_Cells;
	}

	public String getAmorphous() {
		return Amorphous;
	}

	public void setAmorphous(String amorphous) {
		Amorphous = amorphous;
	}

	public String getCrystals() {
		return Crystals;
	}

	public void setCrystals(String crystals) {
		Crystals = crystals;
	}

	public String getCasts() {
		return Casts;
	}

	public void setCasts(String casts) {
		Casts = casts;
	}

	public String getOthers() {
		return Others;
	}

	public void setOthers(String others) {
		Others = others;
	}

	public String getComments() {
		return Comments;
	}

	public void setComments(String comments) {
		Comments = comments;
	}

	public UrineTest(int urineTest_id,Patient patient, Doctor doctor, LocalDate examination_Date, String color,
			String clarity, int specific_Gravity, int pH, String protein, String glucose, String ketone,
			String urobilinogen, String bilirubin, String nitrite, int pus_Cells, int red_Cells,
			String epithelial_Cells, String amorphous, String crystals, String casts, String others, String comments) {
		this.UrineTest_id = urineTest_id;
		this.Examination_Date = examination_Date;
		this.patient = patient;
		this.doctor = doctor;
		this.Color = color;
		this.Clarity = clarity;
		this.Specific_Gravity = specific_Gravity;
		this.PH = pH;
		this.Protein = protein;
		this.Glucose = glucose;
		this.Ketone = ketone;
		this.Urobilinogen = urobilinogen;
		this.Bilirubin = bilirubin;
		this.Nitrite = nitrite;
		this.Pus_Cells = pus_Cells;
		this.Red_Cells = red_Cells;
		this.Epithelial_Cells = epithelial_Cells;
		this.Amorphous = amorphous;
		this.Crystals = crystals;
		this.Casts = casts;
		this.Others = others;
		this.Comments = comments;
	}

}
