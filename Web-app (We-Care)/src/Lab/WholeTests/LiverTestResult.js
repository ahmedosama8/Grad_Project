import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import Typography from "@mui/material/Typography";
import React, { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";

import { useParams } from "react-router-dom";

import axios from "axios";
import Topbar from "../../Topbar/Topbar";
import Sidebar from "../../Sidebar/Sidebar";
import "./cbctestresult.css";
import { calculateAge } from "../../configure";
const paperStyle = {
  display: "flex",
  justifyContent: "center",
  padding: "8px",
  marginBottom: "20px",
  fontFamily: "Roboto",
  fontSize: "32px",
  fontWeight: "bold",
};

const LiverResultPaper = () => {
  const [singletest, setSingleTest] = useState();
  const { id } = useParams();
  const [patient, setPatientData] = useState();

  useEffect(() => {
    loadUser();
  }, []);

  const loadUser = async () => {
    const res = await axios.get(`http://localhost:8080/api/liver/${id}`);
    setSingleTest(res.data);
    console.log("Liver data", res);
    const patientId = res.data.patient_id;

    // Call the patient API using the extracted patient ID
    const patientRes = await axios.get(
      `http://localhost:8080/api/patient/${patientId}`
    );
    setPatientData(patientRes.data);
  };
  
  const patientAge=calculateAge(patient?.birth_date);
  return (
    <Paper className="paperstyle" sx={{ p: 2 }}>
      <Typography variant="h2" sx={paperStyle}>
        <h2>Liver Function Test</h2>
      </Typography>
      <Grid container spacing={3}>
        <Grid className="gridtest" item xs={12}>
          <div>
            <div className="left-section">
              <p>
                <strong>Patient ID:</strong> {patient?.id}
              </p>
              <p>
                <strong>Patient Name:</strong> {patient?.name}
              </p>
              <p>
                <strong>Age / Sex:</strong> {patientAge} Y / {patient?.gender} 
              </p>
              <p>
                <strong>Examination Date:</strong>
                {singletest?.created_at.slice(0, 10)}
              </p>
              <p>
                <strong>Referring Doctor:</strong>
                {singletest?.referring_doctor}
              </p>
              {/* <p><strong>Appointment ID:</strong> {singleReport?.appointment_id}</p> */}
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <h5>Test</h5>
              </div>
              <div className="col-md-3">
                <h5>Value</h5>
              </div>
              <div className="col-md-3">
                <h5>Unit</h5>
              </div>
              <div className="col-md-3">
                <h5>Range</h5>
              </div>
            </div>
            <div
              className={`row mb-4 testitem ${
                singletest?.alt < 10 || singletest?.alt > 130 ? "text-red" : ""
              }`}
            >
              <div className="col-md-3">
                <label>ALT</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.alt}</label>
              </div>
              <div className="col-md-3">
                <label>U/L</label>
              </div>
              <div className="col-md-3">
                <label>10-130</label>
              </div>
            </div>
            <div
              className={`row mb-4 testitem ${
                singletest?.ast < 10 || singletest?.ast > 34 ? "text-red" : ""
              }`}
            >
              <div className="col-md-3">
                <label>AST</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.ast}</label>
              </div>
              <div className="col-md-3">
                <label>U/L</label>
              </div>
              <div className="col-md-3">
                <label>10 - 34</label>
              </div>
            </div>
            <div
              className={`row mb-4 testitem ${
                singletest?.alb < 3.4 || singletest?.alb > 5.4 ? "text-red" : ""
              }`}
            >
              
              <div className="col-md-3">
                <label>ALB</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.alb}</label>
              </div>
              <div className="col-md-3">
                <label>g/dL</label>
              </div>
              <div className="col-md-3">
                <label>3.4 - 5.4</label>
              </div>
            </div>
            <div
              className={`row mb-4 testitem ${
                singletest?.dbil < 0 || singletest?.dbil > 0.3 ? "text-red" : ""
              }`}
            >
              
              <div className="col-md-3">
                <label>DBIL</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.dbil}</label>
              </div>
              <div className="col-md-3">
                <label>mg/dL</label>
              </div>
              <div className="col-md-3">
                <label>0 - 0.3</label>
              </div>
            </div>
            <div
              className={`row mb-4 testitem ${
                singletest?.tbil < 0.1 || singletest?.tbil > 1.2
                  ? "text-red"
                  : ""
              }`}
            >
              
              <div className="col-md-3">
                <label>TBIL</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.tbil}</label>
              </div>
              <div className="col-md-3">
                <label>mg/dL</label>
              </div>
              <div className="col-md-3">
                <label>0.1 - 1.2</label>
              </div>
            </div>
            <div
              className={`row mb-4 testitem ${
                singletest?.alp < 24 || singletest?.alp > 147 ? "text-red" : ""
              }`}
            >
              
              <div className="col-md-3">
                <label>ALP</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.alp}</label>
              </div>
              <div className="col-md-3">
                <label>U/L</label>
              </div>
              <div className="col-md-3">
                <label>24 - 147</label>
              </div>
            </div>

            <h5>Comments</h5>
            <p>{singletest?.comments}</p>
          </div>
        </Grid>
      </Grid>
    </Paper>
  );
};
export default function LiverTestResult() {
  return (
    <div>
      <Topbar />
      <Sidebar />
      <div
        className="App container"
        style={{ position: "relative", top: 20, width: 1000 }}
      >
        <Grid
          container
          spacing={3}
          style={{
            display: "flex",
            margin: 10,
          }}
          className="app__container"
        >
          <Grid item xs={12}>
            <LiverResultPaper />
          </Grid>
          <Grid item xs={12}></Grid>
        </Grid>
      </div>
    </div>
  );
}
