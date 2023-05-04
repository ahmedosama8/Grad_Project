package com.wecare.backend2.Patient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wecare.backend2.Allergy.Allergy;
import com.wecare.backend2.CBC.CBC;
import com.wecare.backend2.Diagnosis.Diagnosis;
import com.wecare.backend2.Glucose.Glucose;
import com.wecare.backend2.LipidProfile.LipidProfile;
import com.wecare.backend2.LiverFunc.LiverFunc;
import com.wecare.backend2.MedicalCondition.MedicalCondition;
import com.wecare.backend2.UrineTest.UrineTest;

import jakarta.annotation.Nullable;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Patient {
    @Id
    @GeneratedValue
    private int patient_id;

    @Nullable
    private String gender;

    @Nullable
    private String phone1;

    @Nullable
    private String phone2;

    @Nullable
    private String mail;

    @Nullable
    private String bloodType;

    @Nullable
    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Allergy> allergies = new ArrayList<>();

    @Nullable
    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<MedicalCondition> medicalConditions = new ArrayList<>();
    
    @Nullable
    @OneToMany(mappedBy = "patient")
    @JsonIgnore
    private List<CBC> CBCTests = new ArrayList<>();
    
    @Nullable
    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Glucose> GlucoseTests = new ArrayList<>();
    
    @Nullable
    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<LipidProfile> LipidProfileTests = new ArrayList<>();
    
    @Nullable
    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<LiverFunc> LiverFuncTests = new ArrayList<>();
    
    @Nullable
    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<UrineTest> UrineTests = new ArrayList<>();
    
    @Nullable
    private int age;
    @Nullable
    private String firstName;
    @Nullable
    private String MiddleName;
    @Nullable
    private String LastName;
    @Nullable
    private LocalDate birthDate;
    @Nullable
    @OneToMany(mappedBy = "patient")
    @JsonIgnore
    private List<Diagnosis> diagnoses;

    @Nullable
    private String nationalIdNumber;

    @Nullable
    private String city;
    @Nullable
    private String street;

    @Nullable
    private boolean maritalStatus;


    public boolean isMaritalStatus() {
        return maritalStatus;
    }

    public void setMaritalStatus(boolean maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public Patient() {
    }

    public int getPatient_id() {
        return patient_id;
    }


    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone1() {
        return phone1;
    }

    public void setPhone1(String phone1) {
        this.phone1 = phone1;
    }

    public String getPhone2() {
        return phone2;
    }

    public void setPhone2(String phone2) {
        this.phone2 = phone2;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return MiddleName;
    }

    public void setMiddleName(String middleName) {
        MiddleName = middleName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String lastName) {
        LastName = lastName;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public List<Diagnosis> getDiagnoses() {
        return diagnoses;
    }

    public void setDiagnoses(List<Diagnosis> diagnoses) {
        this.diagnoses = diagnoses;
    }

    public String getNationalIdNumber() {
        return nationalIdNumber;
    }

    public void setNationalIdNumber(String nationalIdNumber) {
        this.nationalIdNumber = nationalIdNumber;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getBloodType() {
        return bloodType;
    }

    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }

    public List<Allergy> getAllergies() {
        return allergies;
    }

    public void setAllergies(List<Allergy> allergies) {
        this.allergies = allergies;
    }

    public List<MedicalCondition> getMedicalConditions() {
        return medicalConditions;
    }

    public void setMedicalConditions(List<MedicalCondition> medicalConditions) {
        this.medicalConditions = medicalConditions;
    }

    public List<CBC> getCBCTests() {
		return CBCTests;
	}

	public void setCBCTests(List<CBC> cBCTests) {
		CBCTests = cBCTests;
	}

	public List<Glucose> getGlucoseTests() {
		return GlucoseTests;
	}

	public void setGlucoseTests(List<Glucose> glucoseTests) {
		GlucoseTests = glucoseTests;
	}

	public List<LipidProfile> getLipidProfileTests() {
		return LipidProfileTests;
	}

	public void setLipidProfileTests(List<LipidProfile> lipidProfileTests) {
		LipidProfileTests = lipidProfileTests;
	}

	public List<LiverFunc> getLiverFuncTests() {
		return LiverFuncTests;
	}

	public void setLiverFuncTests(List<LiverFunc> liverFuncTests) {
		LiverFuncTests = liverFuncTests;
	}

	public List<UrineTest> getUrineTests() {
		return UrineTests;
	}

	public void setUrineTests(List<UrineTest> urineTests) {
		UrineTests = urineTests;
	}

    public Patient(int patient_id, @Nullable String gender, @Nullable String phone1, @Nullable String phone2, @Nullable String mail, @Nullable String bloodType, @Nullable List<Allergy> allergies, @Nullable List<MedicalCondition> medicalConditions, @Nullable List<CBC> CBCTests, @Nullable List<Glucose> glucoseTests, @Nullable List<LipidProfile> lipidProfileTests, @Nullable List<LiverFunc> liverFuncTests, @Nullable List<UrineTest> urineTests, int age, @Nullable String firstName, @Nullable String middleName, @Nullable String lastName, @Nullable LocalDate birthDate, @Nullable List<Diagnosis> diagnoses, @Nullable String nationalIdNumber, @Nullable String city, @Nullable String street, boolean maritalStatus) {
        this.patient_id = patient_id;
        this.gender = gender;
        this.phone1 = phone1;
        this.phone2 = phone2;
        this.mail = mail;
        this.bloodType = bloodType;
        this.allergies = allergies;
        this.medicalConditions = medicalConditions;
        this.CBCTests = CBCTests;
        GlucoseTests = glucoseTests;
        LipidProfileTests = lipidProfileTests;
        LiverFuncTests = liverFuncTests;
        UrineTests = urineTests;
        this.age = age;
        this.firstName = firstName;
        MiddleName = middleName;
        LastName = lastName;
        this.birthDate = birthDate;
        this.diagnoses = diagnoses;
        this.nationalIdNumber = nationalIdNumber;
        this.city = city;
        this.street = street;
        this.maritalStatus = maritalStatus;
    }
}
