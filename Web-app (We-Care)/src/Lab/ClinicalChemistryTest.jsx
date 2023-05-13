import React, { useState } from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import "./clinicalchemistry.css";
import { useParams } from "react-router-dom";
import axios from "axios";

const lipidData = [
  {
    name: "ALT (SGPT), serum",
    unit: "U/L",
    range: "10-65",
  },
  {
    name: "AST (SGOT), serum",
    unit: "U/L",
    range: "0-48",
  },
  {
    name: "Albumin, serum",
    unit: "g/dL",
    range: "3.5-5.2",
  },
  {
    name: "Cholestrol Total, serum",
    unit: "mg/dL",
    range:
      "Desirable: < 200 mg/dL\nBorderline High: 200-239 mg/dl\nHigh: >= 240 mg/dL",
  },
  {
    name: "HDL-C, serum",
    unit: "mg/dL",
    range:
      "Low HDL: < 40 mg/dL\nBorderline Low: 40-60 mg/dL\nAcceptable: > 60 mg/dL",
  },
  {
    name: "LDL-C, serum",
    unit: "mg/dL",
    range:
      "Desirable: < 100 mg/dL\nAbove Desirable: 100-129 mg/dl\nBorderline High: 130-159 mg/dL\nHigh: 160-189 mg/dL\nVery High: >= 190 mg/dL",
  },
  {
    name: "Triglycerides, serum",
    unit: "mg/dL",
    range:
      "< 150 Desirable\n150-199 Border High Line\n200-499 High\n>= 500 Very High",
  },
];

export default function ClinicalChemistryTest() {
  const [formData, setFormData] = useState({ labname: "dosh" });
  const { patient_id } = useParams();

  const handleSubmit = (event) => {
    event.preventDefault();
    axios
      .post(`http://localhost:3001/LipidTest`, formData)
      .then((response) => {
        console.log("Data posted:", response.data);
        // Do something with the response, e.g. show a success message
      })
      .catch((error) => {
        console.error("Error posting data:", error);
        // Handle the error, e.g. show an error message
      });
  };

  const handleChange = (event) => {
    const fieldName = event.target.name.toLowerCase();
    setFormData({
      ...formData,
      [fieldName]: event.target.value,
    });
  };
  return (
    <div>
      <Topbar />
      <Sidebar />
      <div
        className="App container col-6"
        style={{ position: "relative", top: 20, width: 1000 }}
      >
        <h3>Patient Demoghraphics</h3>
        <form onSubmit={handleSubmit} noValidate>
        <div className="row mb-3">
            <div className="col-md-4">
              <label htmlFor="firstName">First Name</label>
              <p className="patientdata">Mahmoud </p>
            </div>
            <div className="col-md-4">
              <label htmlFor="lastName">Last Name</label>
              <p className="patientdata">Ahmed </p>
            </div>
            <div className="col md-4">
              <label htmlFor="email">Patient's ID</label>
              <p className="patientdata">HOSP-12345</p>
            </div>
          </div>
          <div>
            <div className="row mb-5">
              <div className="col-md-6">
                <label>Examination Date</label>
                <input
                  className="form-control boxentry"
                  type="date"
                  noValidate
                />
              </div>
              <div className="col-md-6">
                <label>Doctor Name</label>
                <input
                  className="form-control boxentry"
                  type="text"
                  noValidate
                />
              </div>
            </div>
          </div>

          <h3 className="mb-4">Lipid Profile</h3>
          <div className="row mb-3">
            <h6 className="col md-3"> </h6>
            <h6 className="col md-3">Result</h6>
            <h6 className="col md-3">Unit</h6>
            <h6 className="col md-3">Ref.Range</h6>
          </div>
          {lipidData.map((item) => (
            <div className="row mb-3" key={item.name.toLowerCase()}>
              <div className="col-md-3">
                <label>{item.name}</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                name={item.name.toLowerCase()}
                value={formData[item.name.toLowerCase()] || ""}
                onChange={handleChange}
              />
              <label className="col md-3">{item.unit}</label>
              <label className="col md-3">{item.range}</label>
              {item.name === "T.L.C" && <h4>Differential Count</h4>}
            </div>
          ))}
          <div>
            <label for="comments">Comments</label>
            <textarea
              className="commentbtn"
              id="comments"
              name="comments"
              value={formData.comments || ""}
              onChange={handleChange}
              placeholder="Write Comments.."
            ></textarea>
          </div>

          <div className="mb-5">
            <button type="submit">Submit</button>
          </div>
        </form>
      </div>
    </div>
  );
}
