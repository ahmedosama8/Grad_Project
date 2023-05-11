package com.wecare.backend2.RadiologyReport;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

import java.time.LocalDate;

@Entity
public class RadiologyReport {

    @Id
    @GeneratedValue
    private Long id;

    private String radName;

    private String performer;

    private String report;

    private String examinatedPart;

    private LocalDate date;

    public RadiologyReport() {
    }

    public RadiologyReport(Long id, String radName, String performer, String report, String examinatedPart, LocalDate date) {
        this.id = id;
        this.radName = radName;
        this.performer = performer;
        this.report = report;
        this.examinatedPart = examinatedPart;
        this.date = date;
    }

    public Long getId() {
        return id;
    }


    public String getRadName() {
        return radName;
    }

    public void setRadName(String radName) {
        this.radName = radName;
    }

    public String getPerformer() {
        return performer;
    }

    public void setPerformer(String performer) {
        this.performer = performer;
    }

    public String getReport() {
        return report;
    }

    public void setReport(String report) {
        this.report = report;
    }

    public String getExaminatedPart() {
        return examinatedPart;
    }

    public void setExaminatedPart(String examinatedPart) {
        this.examinatedPart = examinatedPart;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }
}
