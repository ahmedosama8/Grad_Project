import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import Typography from "@mui/material/Typography";
import React, { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";

import { useParams } from "react-router-dom";

import "./patientresultpage.css";
import axios from "axios";
const paperStyle = {
  display: "flex",
  justifyContent: "center",
  padding: "8px",
  marginBottom: "20px",
  fontFamily: "Roboto",
  fontSize: "32px",
  fontWeight: "bold",
};


const TestPaper = () => {
  const [singletest, setSingleTest] = useState();
  const { id } = useParams();
  useEffect(() => {
    loadUser();
  }, []);

  const loadUser = async () => {
    const res = await axios.get(`http://localhost:3001/medicalLabTests/${id}`);
    setSingleTest(res.data);
  };
  return (
    <Paper sx={{ p: 2 }}>
      <Typography variant="h2" sx={paperStyle}>
        <h2>{singletest?.testType}</h2>
      </Typography>
      <Grid container spacing={3}>
        {singletest?.attributes?.map((item) => (
          <Grid item xs={12} key={item.name}>
            <div className="row mb-3">
              <div className="col md-3">
                <label>{item.name}</label>
              </div>
              <div className="col ">
                <label>{item.value}</label>
              </div>
              <div className="col md-3">
                <label>{item.unit}</label>
              </div>
              <div className="col md-3">
                <label>{item.range}</label>
              </div>
            </div>
          </Grid>
        ))}
      </Grid>
    </Paper>
  );
};

export default function WholeTest() {
  const location = useLocation();

  let selectedRow = new URLSearchParams(location.search);
  console.log(selectedRow);
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
            <TestPaper />
          </Grid>
        </Grid>
      </div>
    </div>
  );
}
// import axios from "axios";
// import React, { useEffect, useState } from "react";
// import { useParams } from "react-router-dom";

// const SelectedRow = ({ props }) => {

//   return (
//     <div>
//       <h2>Selected Row</h2>
//       <p>Patient Name: {singletest?.patientName}</p>
//       <p>Result: {singletest?.result}</p>
//       <p>Date: {singletest?.date}</p>
//     </div>
//   );
// };

// export default SelectedRow;
