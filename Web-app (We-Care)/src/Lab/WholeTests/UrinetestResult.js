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

const UrineTestPaper = () => {
  const [singletest, setSingleTest] = useState();
  const { id } = useParams();
  useEffect(() => {
    loadUser();
  }, []);

  const loadUser = async () => {
    const res = await axios.get(`http://localhost:8080/api/urine/${id}`);
    setSingleTest(res.data);
  };
  return (
    <Paper className="paperstyle" sx={{ p: 2 }}>
      <Typography variant="h2" sx={paperStyle}>
        <h2>Urine Test</h2>
      </Typography>
      <Grid container spacing={3}>
        <Grid className="gridtest" item xs={12}>
          <div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Color</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.color}</label>
              </div>
              <div className="col-md-3">
                <label>--</label>
              </div>
              <div className="col-md-3">
                <label>Amber yellow</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Clarity</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.clarity}</label>
              </div>
              <div className="col-md-3">
                <label>--</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">Clear</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Specific Gravity</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.specific_Gravity}</label>
              </div>
              <div className="col-md-3">
                <label>--</label>
              </div>
              <div className="col-md-3">
                <label>1015 - 1025</label>
              </div>
            </div>
            <h3 className="mb-4">Dipstick Chemical Estimition </h3>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>PH</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.ph}</label>
              </div>
              <div className="col-md-3">
                <label>--</label>
              </div>
              <div className="col-md-3">
                <label>4.5 - 6.5</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Protein</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.protein}</label>
              </div>
              <div className="col-md-3">
                <label>--</label>
              </div>

              <div className="col-md-3">
                <label>Negative</label>
              </div>
            </div>

            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Glucose</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.glucose}</label>
              </div>
              <div className="col-md-3">
                <label>--</label>
              </div>

              <div className="col-md-3">
                <label>Negative</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Ketone</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.ketone}</label>
              </div>
              <div className="col-md-3">
                <label>--</label>
              </div>

              <div className="col-md-3">
                <label>Negative</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Urobilinogen</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.urobilinogen}</label>
              </div>
              <div className="col-md-3">
                <label>--</label>
              </div>

              <div className="col-md-3">
                <label>Normal Trace</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Bilirubin</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.bilirubin}</label>
              </div>
              <div className="col-md-3">
                <label>--</label>
              </div>

              <div className="col-md-3">
                <label>Negative</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Nitrite</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.nitrite}</label>
              </div>
              <div className="col-md-3">
                <label>--</label>
              </div>

              <div className="col-md-3">
                <label>Negative</label>
              </div>
            </div>

            <h3 className="mb-4">Microscopic Examination </h3>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Pus Cells</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.pus_cells}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">/HPF</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3">0 : 1</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Red Cells</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.red_cells}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">/HPF</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3">0 : 1</label>
              </div>
            </div>

            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Epithelial Cells</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.epithelial_cells}</label>
              </div>
              <div className="col-md-3">
                <label>/HPF</label>
              </div>

              <div className="col-md-3">
                <label>Negative</label>
              </div>
            </div>

            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Amorphous</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.amorphous}</label>
              </div>
              <div className="col-md-3">
                <label>/HPF</label>
              </div>

              <div className="col-md-3">
                <label>Negative</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Crystals</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.crystals}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">/HPF</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3">Negative</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Casts</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.casts}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">/HPF</label>
              </div>

              <div className="col-md-3">
                <label className="col md-3">Negative</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Others</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.others}</label>
              </div>
              <label className="col md-3">/HPF</label>
              <label className="col md-3"></label>
            </div>
            <h5>Comments</h5>
            <p>{singletest?.comments}</p>
          </div>
        </Grid>
      </Grid>
    </Paper>
  );
};
export default function UrinetestResult() {
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
            <UrineTestPaper />
          </Grid>
          <Grid item xs={12}></Grid>
        </Grid>
      </div>
    </div>
  );
}
