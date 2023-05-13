import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import Typography from "@mui/material/Typography";
import React, { useState, useEffect } from "react";

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

const LipidProfileResultPaper = () => {
  const [singletest, setSingleTest] = useState();
  const { id } = useParams();
  useEffect(() => {
    loadUser();
  }, []);

  const loadUser = async () => {
    const res = await axios.get(`http://localhost:3001/LipidTest/${id}`);
    setSingleTest(res.data);
    console.log("Lipid data", res);
  };
  return (
    <Paper className="paperstyle" sx={{ p: 2 }}>
      <Typography variant="h2" sx={paperStyle}>
        <h2>Lipid Profile Test</h2>
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
                <label>ALT (SGPT), serum</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.alt}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">U/L</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">10-65</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>AST (SGOT), serum</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.ast}</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3">U/L</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3">0-48</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Albumin, serum</label>
              </div>

              <div className="col-md-3">
                <label>{singletest?.albumin}</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3">g/dL</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3">3.5-5.2</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Cholestrol Total, serum</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.cholestrolTotal}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">mg/dL</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3">
                  Desirable: &lt; 200 mg/dL <br />
                  Borderline High: 200-239 mg/dl <br />
                  High: &gt; or = 240 mg/dL
                </label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>HDL-C, serum</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.hdl_C}</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3">mg/dL</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3">
                  Low HDL: &lt; 40 mg/dL <br />
                  Borderline Low: 40-60 mg/dL <br />
                  Acceptable: &gt; 60 mg/dL
                </label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>LDL-C, serum</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.ldl_C}</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3">mg/dL</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3">
                  Desirable: &lt; 100 mg/dL <br />
                  Above Desirable: 100-129 mg/dl <br />
                  Borderline High: 130-159 mg/dL
                  <br />
                  High: 160-189 mg/dL
                  <br /> Very High: &gt; or =190 mg/dL
                </label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Triglycerides, serum</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.triglycerides}</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3">mg/dL</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3">
                  &lt; 150 Desirable
                  <br /> 150-199 Border High Line <br /> 200-499 High
                  <br />
                  &gt;=500 Very High
                </label>
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

export default function LipidProfileResult() {
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
            <LipidProfileResultPaper />
          </Grid>
          <Grid item xs={12}></Grid>
        </Grid>
      </div>
    </div>
  );
}
