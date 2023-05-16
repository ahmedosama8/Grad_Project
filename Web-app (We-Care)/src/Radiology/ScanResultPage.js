import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import Typography from "@mui/material/Typography";
import React, { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";

import { useParams } from "react-router-dom";

import axios from "axios";
import "./scanresultpage.css";
import SidebarRad from "../Sidebar/SidebarRad";
import Topbar from "../Topbar/Topbar";
const paperStyle = {
  display: "flex",
  justifyContent: "center",
  padding: "8px",
  marginBottom: "20px",
  fontFamily: "Roboto",
  fontSize: "32px",
  fontWeight: "bold",
};

const ScanPaper = () => {
  const [singleReport, setSingleReport] = useState();
  const { id } = useParams();
  useEffect(() => {
    loadUser();
  }, []);

  const loadUser = async () => {
    const res = await axios.get(`http://localhost:8080/api/radiology/${id}`);
    setSingleReport(res.data);
  };
  return (
    <Paper elevation={3} className="paper">
      <div className="header">
        <h2>Radiology Scan Report</h2>
      </div>
      <div className="content">
        <div className="left-section">
          <p><strong>ID:</strong> {id}</p>
          <p><strong>Patient ID:</strong> {singleReport?.patient_id}</p>
          <p><strong>Doctor ID:</strong> {singleReport?.doctor_id}</p>
          <p><strong>Appointment ID:</strong> {singleReport?.appointment_id}</p>
        </div>
        <div className="right-section">
          <p><strong>Name:</strong> {singleReport?.name}</p>
          <p><strong>Performer:</strong> {singleReport?.performer}</p>
          <p><strong>Report:</strong> {singleReport?.report}</p>
          <p><strong>Examined Part:</strong> {singleReport?.examined_part}</p>
        </div>
      </div>
      <div className="footer">
        <p><strong>Created At:</strong> {singleReport?.created_at.slice(0, 10)}</p>
        <p><strong>Updated At:</strong> {singleReport?.updated_at.slice(0, 10)}</p>
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
            <ScanPaper />
          </Grid>
          <Grid item xs={12}></Grid>
        </Grid>
      </div>
    </div>
  );
}
