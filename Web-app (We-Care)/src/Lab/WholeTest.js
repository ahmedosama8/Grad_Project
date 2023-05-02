
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import Typography from "@mui/material/Typography";

import "./patientresultpage.css";
const paperStyle = {
  display: "flex",
  justifyContent: "center",
  padding: "8px",
  marginBottom: "20px",
  fontFamily: "Roboto",
  fontSize: "32px",
  fontWeight: "bold",
};

const cbcData = [
  { name: "Haemoglobin", value: "12", unit: "g/dL", range: "13-17" },
  { name: "Hematocrit", value: "12", unit: "%", range: "40-50" },
  { name: "Red Cell Count", value: "12", unit: "x10⁶ /uL", range: "4.5-6.2" },
  { name: "MCV", value: "12", unit: "fL", range: "78-96" },
  { name: "MCH", value: "12", unit: "pg", range: "26-32" },
  { name: "MCHC", value: "12", unit: "g/dL", range: "31-36" },
  { name: "RDW", value: "12", unit: "%", range: "11.5-14.5" },
  { name: "Platelet Count", value: "12", unit: "x10³/uL", range: "150-450" },
  { name: "T.L.C", value: "12", unit: "x10³/uL", range: "4-11" },
  { name: "Basophils", value: "12", unit: "%", range: "0-1" },
  { name: "Eosinophils", value: "12", unit: "%", range: "0-6" },
  { name: "Stab", value: "12", unit: "%", range: "0-7" },
  { name: "Segmented", value: "12", unit: "%", range: "40-75" },
  { name: "Lymphocytes", value: "12", unit: "%", range: "20-45" },
  { name: "Monocytes", value: "12", unit: "%", range: "1-10" },
];
const liverFunctionData = [
  { name: "ALT", value: "12", unit: "U/dL", range: "10-130" },
  { name: "AST", value: "12", unit: "UdL", range: "10-34" },
  { name: "ALB", value: "12", unit: "g/dL", range: "3.4/5.4" },
  { name: "DBIL", value: "12", unit: "mg/dL", range: "0-0.3" },
  { name: "TBIL", value: "12", unit: "mg/dL", range: "0.1-1.2" },
  { name: "ALP", value: "12", unit: "U/L", range: "24-147" },
];

const CBCBlock = () => {
  return (
    <Paper sx={{ p: 2 }}>
      <Typography variant="h2" sx={paperStyle}>
        <h2>CBC Test</h2>
      </Typography>
      <Grid container spacing={3}>
        {cbcData.map((item) => (
          <Grid item md={12} key={item.name}>
            <div className="row mb-3">
              <div className="col ">
                <label>{item.name}</label>
              </div>
              <div className="col ">
                <label>{item.value}</label>
              </div>
              <div className="col ">
                <label>{item.unit}</label>
              </div>
              <div className="col ">
                <label>{item.range}</label>
              </div>
            </div>
          </Grid>
        ))}
      </Grid>
    </Paper>
  );
};

const LiverFunctionBlock = () => {
  return (
    <Paper sx={{ p: 2 }}>
      <Typography variant="h2" sx={paperStyle}>
        <h2>Liver Function Test</h2>
      </Typography>
      <Grid container spacing={3}>
        {liverFunctionData.map((item) => (
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
  return (
    <div>
      <Topbar />
      <Sidebar />
      <div
        className="App container"
        style={{ position: "relative", top:20, width: 1000 }}
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
            <CBCBlock />
          </Grid>
        </Grid>
      </div>
    </div>
  );
}