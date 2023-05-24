import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import Typography from "@mui/material/Typography";
import React, { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";

import { useParams } from "react-router-dom";

import axios from "axios";
import "./visitresult.css";
import SidebarRad from "../Sidebar/SidebarRad";
import Topbar from "../Topbar/Topbar";
import SidebarClinic from "../Sidebar/SidebarClinic";
import { calculateAge } from "../configure";

const ScanPaper = () => {
  const [singleReport, setSingleReport] = useState();
  const [patient, setPatientData] = useState();

  const { id } = useParams();
  const entity_id = sessionStorage.getItem("User_id");
  useEffect(() => {
    loadVisit();
  }, []);

  const loadVisit = async () => {
    try {
      const res = await axios.get(`http://localhost:8080/api/visit/${id}`);
      setSingleReport(res.data);

      // Extract the patient ID from the visit data
      const patientId = res.data.patient_id;

      // Call the patient API using the extracted patient ID
      const patientRes = await axios.get(
        `http://localhost:8080/api/patient/${patientId}`
      );
      setPatientData(patientRes.data);
    } catch (error) {
      // Handle any errors
      console.error(error);
    }
  };
  console.log("Patient Data", patient);
  console.log("Result", singleReport);
  const parsedMedications = singleReport?.medications
    ? JSON.parse(singleReport.medications)
    : [];
  const parsedDoses = singleReport?.diagnoses
    ? JSON.parse(singleReport.diagnoses)
    : [];

    const age=calculateAge(patient?.birth_date)
  console.log("medicines Assigned", parsedMedications);
  return (
    <Paper elevation={3} className="paper">
      <div className="header_visit">
        <h2>Visit Report</h2>
      </div>
      <div className="content_visit">
        <div className="left-section">
          <p>
            <strong>Visit ID:</strong> {id}
          </p>
          <p>
            <strong>Patient Name:</strong> {patient?.name}
          </p>
          <p>
            <strong>Patient Age / Sex:</strong> {age} / {patient?.gender}
          </p>
          <p>
            <strong>Doctor Name:</strong> {singleReport?.referring_doctor}
          </p>
          <p>
            <strong>Created At:</strong> {singleReport?.created_at.slice(0, 10)}
          </p>
          {/* <p><strong>Appointment ID:</strong> {singleReport?.appointment_id}</p> */}
        </div>
        <div className="right-section">
          <p>
            <div className="right-section">
              <div className="clinic-logo">
                <img
                  className="logo_clinic"
                  src="https://thumbs.dreamstime.com/z/medical-clinic-logo-design-health-136404736.jpg" // Replace with the actual image source
                  alt="Clinic Logo"
                />
              </div>
            </div>
          </p>
        </div>
      </div>
      <div className="footer">
        <p>
          <strong>Statement:</strong> {singleReport?.diagnosed_by}
        </p>
        <p>
          <strong>Report:</strong>
          <div dangerouslySetInnerHTML={{ __html: singleReport?.comments }} />
        </p>
        <div>
          <strong>Medications:</strong>
          {parsedMedications && parsedMedications.length > 0 ? (
            <ul>
              {parsedMedications.map((medication, index) => (
                <li key={index}>
                  {medication}- {parsedDoses[index]}
                </li>
              ))}
            </ul>
          ) : (
            <p>No medications available</p>
          )}
        </div>
      </div>
    </Paper>
  );
};
export default function VisitResult() {
  return (
    <div>
      <Topbar />
      <SidebarClinic />
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
