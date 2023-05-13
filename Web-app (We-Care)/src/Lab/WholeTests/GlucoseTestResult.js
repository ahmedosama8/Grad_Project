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
  const { id } = useParams();
  useEffect(() => {
    loadUser();
  }, []);

  const loadUser = async () => {
    const res = await axios.get(`http://localhost:3001/Glucosetest/${id}`);
    setSingleTest(res.data);
  };
  return (
    <Paper className="paperstyle" sx={{ p: 2 }}>
      <Typography variant="h2" sx={paperStyle}>
        <h2>Glucose Test</h2>
      </Typography>
      <Grid container spacing={3}>
        <Grid className="gridtest" item xs={12}>
          <div>
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
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>R B G</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.rbc}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">mg/dL</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3"> -- </label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>R B S</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.rbs}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">mg/dL</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3"> -- </label>
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
            <GlucoseTestPaper />
          </Grid>
          <Grid item xs={12}></Grid>
        </Grid>
      </div>
    </div>
  );
}
