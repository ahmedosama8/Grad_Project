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

const CbcTestResult = () => {
  const [singletest, setSingleTest] = useState();
  const { id } = useParams();
  useEffect(() => {
    loadUser();
  }, []);

  const loadUser = async () => {
    const res = await axios.get(`http://localhost:3001/CBCTest/${id}`);
    setSingleTest(res.data);
    console.log("cbc data", res);
  };
  return (
    <Paper className="paperstyle" sx={{ p: 2 }}>
      <Typography variant="h2" sx={paperStyle}>
        <h2>CBC Test</h2>
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
                <label>Haemoglobin</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.haemoglobin}</label>
              </div>
              <div className="col-md-3">
                <label>g/dL</label>
              </div>
              <div className="col-md-3">
                <label>13-17</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Haemoglobin</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.hematocrit}</label>
              </div>
              <div className="col-md-3">
                <label>%</label>
              </div>
              <div className="col-md-3">
                <label>40-50</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Red Cell Count</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.redCellCount}</label>
              </div>
              <div className="col-md-3">
                <label>x10⁶ /uL</label>
              </div>
              <div className="col-md-3">
                <label>4.5-6.2</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>MCV</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.mcv}</label>
              </div>
              <div className="col-md-3">
                <label>fL</label>
              </div>
              <div className="col-md-3">
                <label>78-96</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>MCH</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.mch}</label>
              </div>
              <div className="col-md-3">
                <label>pg</label>
              </div>
              <div className="col-md-3">
                <label>26-32</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>MCHC</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.mchc}</label>
              </div>
              <div className="col-md-3">
                <label>g/dL</label>
              </div>
              <div className="col-md-3">
                <label>31-36</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>RDW</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.rdw}</label>
              </div>
              <div className="col-md-3">
                <label>%</label>
              </div>
              <div className="col-md-3">
                <label>11.5-14.5</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Platelet Count</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.plateletCount}</label>
              </div>
              <div className="col-md-3">
                <label>x10³/uL</label>
              </div>
              <div className="col-md-3">
                <label>150-450</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>T.L.C</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.tlc}</label>
              </div>
              <div className="col-md-3">
                <label>x10³/uL</label>
              </div>
              <div className="col-md-3">
                <label>4-11</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Basophils</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.basophils}</label>
              </div>
              <div className="col-md-3">
                <label>%</label>
              </div>
              <div className="col-md-3">
                <label>0-1</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Eosinophils</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.basophils}</label>
              </div>
              <div className="col-md-3">
                <label>%</label>
              </div>
              <div className="col-md-3">
                <label>0-6</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Stab</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.stab}</label>
              </div>
              <div className="col-md-3">
                <label>%</label>
              </div>
              <div className="col-md-3">
                <label>0-7</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Segmented</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.segmented}</label>
              </div>
              <div className="col-md-3">
                <label>%</label>
              </div>
              <div className="col-md-3">
                <label>40-75</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Lymphocytes</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.lymphocytes}</label>
              </div>
              <div className="col-md-3">
                <label>%</label>
              </div>
              <div className="col-md-3">
                <label>20-45</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Monocytes</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.monocytes}</label>
              </div>
              <div className="col-md-3">
                <label>%</label>
              </div>
              <div className="col-md-3">
                <label>1-10</label>
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

export default function CbcTest() {
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
            <CbcTestResult />
          </Grid>
          <Grid item xs={12}></Grid>
        </Grid>
      </div>
    </div>
  );
}