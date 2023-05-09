package com.wecare.backend2.Tests;

import com.wecare.backend2.CBC.CBC;
import com.wecare.backend2.Glucose.Glucose;
import com.wecare.backend2.LipidProfile.LipidProfile;
import com.wecare.backend2.LiverFunc.LiverFunc;
import com.wecare.backend2.UrineTest.UrineTest;

import java.util.List;

public class Tests {
    private List<CBC> cbcList;
    private List<Glucose> glucosesList;
    private List<LipidProfile> lipidProfiles;
    private List<LiverFunc> liverFuncs;
    private List<UrineTest> urineTests;

    public Tests(List<CBC> cbcList, List<Glucose> glucosesList, List<LipidProfile> lipidProfiles, List<LiverFunc> liverFuncs, List<UrineTest> urineTests) {
        this.cbcList = cbcList;
        this.glucosesList = glucosesList;
        this.lipidProfiles = lipidProfiles;
        this.liverFuncs = liverFuncs;
        this.urineTests = urineTests;
    }

    public Tests() {
    }

    public List<CBC> getCbcList() {
        return cbcList;
    }

    public void setCbcList(List<CBC> cbcList) {
        this.cbcList = cbcList;
    }

    public List<Glucose> getGlucosesList() {
        return glucosesList;
    }

    public void setGlucosesList(List<Glucose> glucosesList) {
        this.glucosesList = glucosesList;
    }

    public List<LipidProfile> getLipidProfiles() {
        return lipidProfiles;
    }

    public void setLipidProfiles(List<LipidProfile> lipidProfiles) {
        this.lipidProfiles = lipidProfiles;
    }

    public List<LiverFunc> getLiverFuncs() {
        return liverFuncs;
    }

    public void setLiverFuncs(List<LiverFunc> liverFuncs) {
        this.liverFuncs = liverFuncs;
    }

    public List<UrineTest> getUrineTests() {
        return urineTests;
    }

    public void setUrineTests(List<UrineTest> urineTests) {
        this.urineTests = urineTests;
    }
}
