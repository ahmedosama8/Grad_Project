import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import Typography from "@mui/material/Typography";
import React, { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";
import configure, { calculateAge } from "../configure";
import { useParams } from "react-router-dom";
import html2pdf from "html2pdf.js";
import Button from "@mui/material/Button";
import axios from "axios";
import "./scanresultpage.css";
import SidebarRad from "../Sidebar/SidebarRad";
import Topbar from "../Topbar/Topbar";
import PrintIcon from "@mui/icons-material/Print";

const ScanPaper = () => {
  const [singleReport, setSingleReport] = useState();
  const [patient, setPatientData] = useState();
  const [isDownloading, setIsDownloading] = useState(false);
  const patientAge = calculateAge(patient?.birth_date);

  const { id } = useParams();
  useEffect(() => {
    loadUser();
  }, []);

  const loadUser = async () => {
    const res = await axios.get(`${configure.backURL}radiology/${id}`);
    setSingleReport(res.data);
    const patientId = res.data.patient_id;

    // Call the patient API using the extracted patient ID
    const patientRes = await axios.get(
      `${configure.backURL}patient/${patientId}`
    );
    setPatientData(patientRes.data);
  };
  const handleDownload = (filename) => {
    setIsDownloading(true);

    const element = document.getElementById("pdf-content");
    const opt = {
      margin: 5,
      filename: filename, // Use the provided filename variable
      image: { type: "jpeg", quality: 0.98 },
      html2canvas: { scale: 2 },
      jsPDF: { unit: "mm", format: "a4", orientation: "portrait" },
    };

    html2pdf().set(opt).from(element).save();

    setIsDownloading(false);
  };
  
  return (
    <Paper elevation={3} className="paper">
      <div className="header">
        <h2>Radiology Scan Report</h2>
      </div>
      <div className="content">
        <div className="left-section">
          <p>
            <strong>Created At:</strong> {singleReport?.created_at.slice(0, 10)}{" "}
            at {singleReport?.created_at.slice(11, 16)}
          </p>
          <p>
            <strong>Patient ID:</strong> {singleReport?.patient_id}
          </p>
          <p>
            <strong>Patient Name:</strong> {patient?.name}
          </p>
          <p>
            <strong>Age / Sex:</strong> {patientAge} Y / {patient?.gender}
          </p>
          <p>
            <strong>Examination Type:</strong> {singleReport?.name}
          </p>
          <p>
            <strong>Examined Part:</strong> {singleReport?.examined_part}
          </p>
          <p>
            <strong>Performer:</strong> {singleReport?.performer}
          </p>
        </div>
        <div className="right-section">
          <p>
            <div className="right-section">
              <div className="clinic-logo">
                <img
                  className="logo_clinic"
                  src="https://www.shutterstock.com/image-vector/nuclear-medicine-abstract-logo-sample-260nw-1657174591.jpg" // Replace with the actual image source
                  alt="Clinic Logo"
                />
              </div>
            </div>
          </p>
        </div>
      </div>
      <div className="footer">
        <p>
          <strong>
            Report: <br></br>
          </strong>
          <div dangerouslySetInnerHTML={{ __html: singleReport?.report }} />
        </p>
      </div>
      <div data-html2canvas-ignore="true">
        <button
          className="submitform"
          variant="contained"
          onClick={() => handleDownload("custom_filename.pdf")} // Fix: wrap in an arrow function
          disabled={isDownloading}
        >
          {isDownloading ? "Downloading..." : "Download PDF"}
        </button>
      </div>
    </Paper>
  );
};
export default function WholePaper() {
  return (
    <div>
      <Topbar />
      <SidebarRad />
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
              <ScanPaper />
            </div>
          </Grid>
          <Grid item xs={12}></Grid>
        </Grid>
      </div>
    </div>
  );
}
