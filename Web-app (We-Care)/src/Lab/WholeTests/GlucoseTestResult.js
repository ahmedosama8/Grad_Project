import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import Typography from "@mui/material/Typography";
import React, { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";
import configure, { handleDownload } from "../../configure";
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

const GlucoseTestPaper = () => {
  const [singletest, setSingleTest] = useState();
  const [patient, setPatientData] = useState();
  const [isDownloading, setIsDownloading] = useState(false);

  const { id } = useParams();
  useEffect(() => {
    loadUser();
  }, []);

  const loadUser = async () => {
    const res = await axios.get(`${configure.backURL}glucose/${id}`);
    setSingleTest(res.data);
    const patientId = res.data.patient_id;

    // Call the patient API using the extracted patient ID
    const patientRes = await axios.get(
      `${configure.backURL}patient/${patientId}`
    );
    setPatientData(patientRes.data);
  };
  const handlePDF = () => {
    // Use the handleDownload function from pdfUtils.js
    handleDownload(`Glucose_${patient?.name}_${patientAge}.pdf`, "pdf-content");
    setIsDownloading(true);
  };

  const patientAge = calculateAge(patient?.birth_date);
  return (
    <Paper className="paperstyle" sx={{ p: 2 }}>
      <Typography variant="h2" sx={paperStyle}>
        <h2>Glucose Test</h2>
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
                singletest?.fpg < 60 || singletest?.fpg > 110 ? "text-red" : ""
              }`}
            >
              <div className="col-md-3">
                <label>Fasting Plasma Glucose (FPG)</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.fpg}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">mg/dL</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3"> 60-110 </label>
              </div>
            </div>
            <div
              className={`row mb-4 testitem ${
                singletest?.rbg > 160 ? "text-red" : ""
              }`}
            >
              <div className="col-md-3">
                <label>Random Blood Glucose (RBG)</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.rbg}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">mg/dL</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">60-160</label>
              </div>
            </div>
            <div
              className={`row mb-4 testitem ${
                singletest?.ppg > 140 ? "text-red" : ""
              }`}
            >
              <div className="col-md-3">
                <label>Postprandial Glucose (PPG)</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.ppg}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">mg/dL</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">&gt;140</label>
              </div>
            </div>

            <h5>Comments</h5>
            <p>{singletest?.comments}</p>
            <div data-html2canvas-ignore="true">
              <button
                className="submitform"
                variant="contained"
                onClick={handlePDF} // Use the imported handleDownload function
                disabled={isDownloading}
              >
                {isDownloading ? "Downloading..." : "Download PDF"}
              </button>
            </div>
          </div>
        </Grid>
      </Grid>
    </Paper>
  );
};
export default function GlucoseTestResult() {
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
            <div id="pdf-content">
              <GlucoseTestPaper />
            </div>
          </Grid>
          <Grid item xs={12}></Grid>
        </Grid>
      </div>
    </div>
  );
}
