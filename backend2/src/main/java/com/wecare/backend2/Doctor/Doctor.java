package com.wecare.backend2.Doctor;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wecare.backend2.Appointment.Appointment;
import com.wecare.backend2.CBC.CBC;
import com.wecare.backend2.Diagnosis.Diagnosis;
import com.wecare.backend2.Glucose.Glucose;
import com.wecare.backend2.LipidProfile.LipidProfile;
import com.wecare.backend2.LiverFunc.LiverFunc;
import com.wecare.backend2.Patient.Patient;
import com.wecare.backend2.UrineTest.UrineTest;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
public class Doctor {
    @Id
    @GeneratedValue
    private int doctor_id;

    @OneToMany(mappedBy = "doctor")
    @JsonIgnore
    @Nullable
    private List<Appointment> appointments;


    @Nullable
    private String gender;

    @Nullable
    private String phone1;

    @Nullable
    @ManyToMany
    private Set<Patient> patients = new HashSet<>();

    @Nullable
    private String mail;


    @Nullable
    private String name;

//    @Nullable
//    @OneToMany(mappedBy = "doctor")
//    @JsonIgnore
//    private List<Diagnosis> diagnoses;

    @Nullable
    private String city;

    @Nullable
    private String street;

    @Nullable
    @OneToMany(mappedBy = "doctor")
    @JsonIgnore
    private List<CBC> cbcTests = new ArrayList<>();

    @Nullable
    @OneToMany(mappedBy = "doctor")
    @JsonIgnore
    private List<Glucose> glucoseTests = new ArrayList<>();

    @Nullable
    @OneToMany(mappedBy = "doctor")
    @JsonIgnore
    private List<LipidProfile> lipidProfileTests = new ArrayList<>();

    @Nullable
    @OneToMany(mappedBy = "doctor")
    @JsonIgnore
    private List<LiverFunc> liverFuncTests = new ArrayList<>();

    @Nullable
    @OneToMany(mappedBy = "doctor")
    @JsonIgnore
    private List<UrineTest> urineTests = new ArrayList<>();

    public int getDoctor_id() {
        return doctor_id;
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

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

//    public List<Diagnosis> getDiagnoses() {
//        return diagnoses;
//    }
//
//    public void setDiagnoses(List<Diagnosis> diagnoses) {
//        this.diagnoses = diagnoses;
//    }

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

    public List<CBC> getCbcTests() {
        return cbcTests;
    }

    public void setCbcTests(List<CBC> cbcTests) {
        this.cbcTests = cbcTests;
    }

    public List<Glucose> getGlucoseTests() {
        return glucoseTests;
    }

    public void setGlucoseTests(List<Glucose> glucoseTests) {
        this.glucoseTests = glucoseTests;
    }

    public List<LipidProfile> getLipidProfileTests() {
        return lipidProfileTests;
    }

    public void setLipidProfileTests(List<LipidProfile> lipidProfileTests) {
        this.lipidProfileTests = lipidProfileTests;
    }

    public List<LiverFunc> getLiverFuncTests() {
        return liverFuncTests;
    }

    public void setLiverFuncTests(List<LiverFunc> liverFuncTests) {
        this.liverFuncTests = liverFuncTests;
    }

    public List<UrineTest> getUrineTests() {
        return urineTests;
    }

    public void setUrineTests(List<UrineTest> urineTests) {
        this.urineTests = urineTests;
    }

    public Set<Patient> getPatients() {
        return patients;
    }

    public void setPatients(Set<Patient> patients) {
        this.patients = patients;
    }

    public List<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(List<Appointment> appointments) {
        this.appointments = appointments;
    }

    public Doctor() {
    }

    public Doctor(int doctor_id, List<Appointment> appointments, String gender, String phone1, Set<Patient> patients, String mail, String name, String city, String street, List<CBC> cbcTests, List<Glucose> glucoseTests, List<LipidProfile> lipidProfileTests, List<LiverFunc> liverFuncTests, List<UrineTest> urineTests) {
        this.doctor_id = doctor_id;
        this.appointments = appointments;
        this.gender = gender;
        this.phone1 = phone1;
        this.patients = patients;
        this.mail = mail;
        this.name = name;
        this.city = city;
        this.street = street;
        this.cbcTests = cbcTests;
        this.glucoseTests = glucoseTests;
        this.lipidProfileTests = lipidProfileTests;
        this.liverFuncTests = liverFuncTests;
        this.urineTests = urineTests;
    }
}
