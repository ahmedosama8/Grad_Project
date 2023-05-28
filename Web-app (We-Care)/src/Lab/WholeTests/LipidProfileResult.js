import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import Typography from "@mui/material/Typography";
import React, { useState, useEffect } from "react";
import configure from "../../configure";
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

const LipidProfileResultPaper = () => {
  const [singletest, setSingleTest] = useState();
  const [patient, setPatientData] = useState();

  const { id } = useParams();
  useEffect(() => {
    loadUser();
  }, []);

  const loadUser = async () => {
    const res = await axios.get(`${configure.backURL}lipid/${id}`);
    setSingleTest(res.data);
    console.log("Lipid data", res);
    const patientId = res.data.patient_id;

    // Call the patient API using the extracted patient ID
    const patientRes = await axios.get(
      `${configure.backURL}patient/${patientId}`
    );
    setPatientData(patientRes.data);
  };

  const patientAge = calculateAge(patient?.birth_date);
  return (
    <Paper className="paperstyle" sx={{ p: 2 }}>
      <Typography variant="h2" sx={paperStyle}>
        <h2>Lipid Profile Test</h2>
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
                <strong>Examination Date:</strong>{" "}
                {singletest?.created_at.slice(0, 10)}
              </p>
              <p>
                <strong>Referring Doctor:</strong>{" "}
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
                singletest?.cholesterol < 200 || singletest?.cholesterol > 239
                  ? "text-orange"
                  : singletest?.cholesterol >= 240
                  ? "text-red"
                  : ""
              }`}
            >
              <div className="col-md-3">
                <label>Cholestrol Total, serum</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.cholesterol}</label>
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
            <div
              className={`row mb-4 testitem ${
                singletest?.hdl_c > 40 && singletest?.hdl_c < 60
                  ? "text-orange"
                  : singletest?.hdl_c < 40
                  ? "text-red"
                  : ""
              }`}
            >
              <div className="col-md-3">
                <label>HDL-C, serum</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.hdl_c}</label>
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
            <div
              className={`row mb-4 testitem ${
                singletest?.ldl_c >= 100 && singletest?.ldl_c <= 129
                  ? "text-blue"
                  : singletest?.ldl_c >= 130 && singletest?.ldl_c <= 159
                  ? "text-yellow"
                  : singletest?.ldl_c >= 160 && singletest?.ldl_c <= 189
                  ? "text-orange"
                  : singletest?.ldl_c >= 190
                  ? "text-red"
                  : ""
              }`}
            >
              <div className="col-md-3">
                <label>LDL-C, serum</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.ldl_c}</label>
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
            <div
              className={`row mb-4 testitem ${
                singletest?.triglycerides >= 150 &&
                singletest?.triglycerides <= 199
                  ? "text-yellow"
                  : singletest?.triglycerides >= 200 &&
                    singletest?.triglycerides <= 499
                  ? "text-orange"
                  : singletest?.triglycerides >= 500
                  ? "text-red"
                  : ""
              }`}
            >
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
                  <br />
                  150-199 Border High Line
                  <br />
                  200-499 High
                  <br />
                  &gt;=500 Very High
                </label>
              </div>
            </div>
            <div
              className={`row mb-4 testitem ${
                singletest?.vldl_cholestrol < 0 ||
                singletest?.vldl_cholestrol > 32
                  ? "text-red"
                  : ""
              }`}
            >
              <div className="col-md-3">
                <label>VLDL cholesterol</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.vldl_cholestrol}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">mg/dL</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">Up to: 32</label>
              </div>
            </div>
            <div
              className={`row mb-4 testitem ${
                singletest?.total_lipids < 0 || singletest?.total_lipids > 750
                  ? "text-red"
                  : ""
              }`}
            >
              <div className="col-md-3">
                <label>Total Lipids</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.total_lipids}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">mg/dL</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">Up to: 750</label>
              </div>
            </div>
            <div
              className={`row mb-4 testitem ${
                singletest?.risk_ratio_1 < 0 || singletest?.risk_ratio_1 > 5.5
                  ? "text-red"
                  : ""
              }`}
            >
              <div className="col-md-3">
                <label>Risk Ratio I</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.risk_ratio_1}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">mg/dL</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">Up to: 5.5</label>
              </div>
            </div>
            <div
              className={`row mb-4 testitem ${
                singletest?.oxidized_ldl < 26 || singletest?.oxidized_ldl > 117
                  ? "text-red"
                  : ""
              }`}
            >
              <div className="col-md-3">
                <label>Oxdized LDL</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.oxidized_ldl}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">U/L</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">26-117</label>
              </div>
            </div>
            <div className="row mb-4 testitem ">
              <div className="col-md-3">
                <label>Risk Ratio II</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.risk_ratio_2}</label>
              </div>
              <div className="col-md-3"></div>
              <div className="col-md-3">
                <label>
                  1/2 Average: &lt; 3.9
                  <br />
                  Average: &lt; 5.0
                  <br />
                  2 Average: &lt; 9.6
                  <br />3 Average: &lt; 23.4
                </label>
              </div>
            </div>
            <div
              className={`row mb-4 testitem ${
                singletest?.h_crp < 0 || singletest?.h_crp > 3 ? "text-red" : ""
              }`}
            >
              <div className="col-md-3">
                <label>H-CRP</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.h_crp}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">mg/L</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">0-3</label>
              </div>
            </div>
            <div className="row mb-4 testitem">
              <div className="col-md-3">
                <label>Ratio</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.ratio}</label>
              </div>
              <div className="col-md-3"></div>
              <div className="col-md-3">
                <label className="col md-3">
                  Non CAD 0.2
                  <br />
                  Stable Angina &gt;1.7 <br /> Unstable Angina &gt;4.3 <br />{" "}
                  Myocardial infraction &gt;7.5{" "}
                </label>
              </div>
            </div>
            <div
              className={`row mb-4 testitem ${
                singletest?.lipo_protein > 50
                  ? "text-red"
                  : singletest?.lipo_protein > 31 &&
                    singletest?.lipo_protein < 50
                  ? "text-orange"
                  : singletest?.lipo_protein > 20 &&
                    singletest?.lipo_protein < 30
                  ? "text-yellow"
                  : ""
              }`}
            >
              <div className="col-md-3">
                <label>Lipoprtein(a)</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.lipo_protein}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">mg/dL</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">
                  Desirable: &lt; 20 <br /> Borderline risk: 20-30 <br /> High
                  risk: 31-50 <br /> Very High Risk: &gt; 50
                </label>
              </div>
            </div>
            <div
              className={`row mb-4 testitem ${
                singletest?.apoa < 1.08 || singletest?.apoa > 2.25
                  ? "text-red"
                  : ""
              }`}
            >
              <div className="col-md-3">
                <label>APOA</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.apoa}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">g/L</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">1.08-2.25</label>
              </div>
            </div>
            <div
              className={`row mb-4 testitem ${
                singletest?.apob < 0.5 || singletest?.apob > 1.3
                  ? "text-red"
                  : ""
              }`}
            >
              <div className="col-md-3">
                <label>APOB</label>
              </div>
              <div className="col-md-3">
                <label>{singletest?.apob}</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">g/L</label>
              </div>
              <div className="col-md-3">
                <label className="col md-3">0.5-1.3</label>
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
