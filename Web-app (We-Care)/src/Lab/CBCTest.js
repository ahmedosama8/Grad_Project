import React, { useEffect, useState } from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import "./CBCTest.css";
import axios from "axios";

// function MouseOver(event) {
//   event.target.style.background = "red";
// }
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

function CBCTest() {
  const [formData, setFormData] = useState({ labname: "dosh" });

  const handleSubmit = (event) => {
    event.preventDefault();
    axios
      .post(`http://localhost:8080/CBC/new`, formData)
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
      <Sidebar />ؤ
      <div
        className="App container"
        style={{ position: "relative", top: "50px", width: 1000 }}
      >
        <h3>Patient Demoghraphics</h3>
        <form onSubmit={handleSubmit} noValidate>
          <div className="row mb-3">
            <div className="col-md-6">
              <label htmlFor="firstName">First Name</label>
              <p className="patientdata">Mahmoud </p>
            </div>
            <div className="col-md-6">
              <label htmlFor="lastName">Last Name</label>
              <p className="patientdata">Ahmed </p>
            </div>
          </div>
          <div className="row mb-3">
            <div className="col md-6">
              <label htmlFor="email">Patient's ID</label>
              <p className="patientdata">HOSP-12345</p>
            </div>
          </div>
          <h3>CBC Test</h3>
          <div className="row mb-3">
            <h6 className="col md-3"> </h6>
            <h6 className="col md-3">Result</h6>
            <h6 className="col md-3">Unit</h6>
            <h6 className="col md-3">Ref.Range</h6>
          </div>
          <div>
            {cbcData.map((item) => (
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
          </div>

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

export default CBCTest;
