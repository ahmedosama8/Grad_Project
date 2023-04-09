package com.wecare.backend2.Appointment;


import com.wecare.backend2.Doctor.Doctor;
import com.wecare.backend2.Patient.Patient;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
public class Appointment {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long AppointmentId;

    @ManyToOne
    @JoinColumn(name="patient_id")
    private Patient patient;

    @ManyToOne
    @JoinColumn(name="doctor_id")
    private Doctor doctor;

    private LocalDate appointmentDate;

    private String appointmentType;

    private String appointmentStatus;

    private String appointmentNotes;

    private String price;

    private String paymentMethod;

    private String discountPrice;

    private String procedure;

    @Nullable
    private String referral;

    public Appointment(Long appointmentId, Patient patient, Doctor doctor, LocalDate appointmentDate, String appointmentType, String appointmentStatus, String appointmentNotes, String price, String paymentMethod, String discountPrice, String procedure, String referral) {
        AppointmentId = appointmentId;
        this.patient = patient;
        this.doctor = doctor;
        this.appointmentDate = appointmentDate;
        this.appointmentType = appointmentType;
        this.appointmentStatus = appointmentStatus;
        this.appointmentNotes = appointmentNotes;
        this.price = price;
        this.paymentMethod = paymentMethod;
        this.discountPrice = discountPrice;
        this.procedure = procedure;
        this.referral = referral;
    }

    public Appointment() {
    }

    public Long getAppointmentId() {
        return AppointmentId;
    }


    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public LocalDate getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(LocalDate appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getAppointmentType() {
        return appointmentType;
    }

    public void setAppointmentType(String appointmentType) {
        this.appointmentType = appointmentType;
    }

    public String getAppointmentStatus() {
        return appointmentStatus;
    }

    public void setAppointmentStatus(String appointmentStatus) {
        this.appointmentStatus = appointmentStatus;
    }

    public String getAppointmentNotes() {
        return appointmentNotes;
    }

    public void setAppointmentNotes(String appointmentNotes) {
        this.appointmentNotes = appointmentNotes;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(String discountPrice) {
        this.discountPrice = discountPrice;
    }

    public String getProcedure() {
        return procedure;
    }

    public void setProcedure(String procedure) {
        this.procedure = procedure;
    }

    public String getReferral() {
        return referral;
    }

    public void setReferral(String referral) {
        this.referral = referral;
    }
}
