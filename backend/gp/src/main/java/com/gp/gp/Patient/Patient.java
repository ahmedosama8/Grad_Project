package com.gp.gp.Patient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.gp.gp.Diagnosis.Diagnosis;
import jakarta.annotation.Nullable;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

import java.time.LocalDate;
import java.util.List;

@Entity
public class Patient {
    @Id
    @GeneratedValue
    private int patient_id;

    private String gender;

    private String phone1;

    @Nullable
    private String phone2;

    private String mail;

    private int age;

    private String firstName;
    @Nullable
    private String MiddleName;
    private String LastName;

    private LocalDate birthDate;

    @OneToMany(mappedBy = "patient")
    @JsonIgnore
    private List<Diagnosis> diagnoses;

    private String nationalIdNumber;

    private String city;
    private String street;

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

    public Patient(int patient_id, String gender, String phone1, String phone2, String mail, int age, String firstName, String middleName, String lastName, LocalDate birthDate, List<Diagnosis> diagnoses, String nationalIdNumber, String city, String street) {
        this.patient_id = patient_id;
        this.gender = gender;
        this.phone1 = phone1;
        this.phone2 = phone2;
        this.mail = mail;
        this.age = age;
        this.firstName = firstName;
        MiddleName = middleName;
        LastName = lastName;
        this.birthDate = birthDate;
        this.diagnoses = diagnoses;
        this.nationalIdNumber = nationalIdNumber;
        this.city = city;
        this.street = street;
    }
}
