import React, { useEffect, useState } from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import "./CBCTest.css";
import axios from "axios";

const urinedata = [
  {
    name: "Color",
    unit: "",
    range: "Amber yellow",
  },
  {
    name: "Clarity",
    unit: "",
    range: "Clear",
  },
  {
    name: "Specific Gravity",
    unit: "",
    range: "1015 - 1025",
  },
  {
    name: "PH",
    unit: "",
    range: "4.5 - 6.5",
  },
  {
    name: "Protein",
    unit: "",
    range: "Negative",
  },
  {
    name: "Glucose",
    unit: "",
    range: "Negative",
  },
  {
    name: "Ketone",
    unit: "",
    range: "Negative",
  },
  {
    name: "Urobilinogen",
    unit: "",
    range: "Normal Trace",
  },
  {
    name: "Bilirubin",
    unit: "",
    range: "Negative",
  },
  {
    name: "Nitrite",
    unit: "",
    range: "Negative",
  },
  {
    name: "Pus Cells",
    unit: "/HPF",
    range: "0 : 1",
  },
  {
    name: "Red Cells",
    unit: "/HPF",
    range: "0 : 1",
  },
  {
    name: "Epithelial Cells",
    unit: "/HPF",
    range: "Negative",
  },
  {
    name: "Amorphous",
    unit: "/HPF",
    range: "Negative",
  },
  {
    name: "Crystals",
    unit: "/HPF",
    range: "Negative",
  },
  {
    name: "Casts",
    unit: "/HPF",
    range: "Negative",
  },
  {
    name: "Others",
    unit: "/HPF",
    range: "",
  },
];

export default function UrineExamTest() {
  document.title = "Urine Test / Lab";
  const [formData, setFormData] = useState({ labname: "dosh" });

  const handleSubmit = (event) => {
    event.preventDefault();
    axios
      .post("http://localhost:3001/Urinetest", formData)
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
        className="App container"
        style={{ position: "relative", top: "50px", width: 1000 }}
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
            <div className="row mb-4">
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
          <h3 className="mb-4">Urine Test</h3>
          

          <h3 className="mb-4">Physiochemical Data</h3>
          
          <div className="row mb-3">
            <h6 className="col md-3"> </h6>
            <h6 className="col md-3">Result</h6>
            <h6 className="col md-3">Unit</h6>
            <h6 className="col md-3">Ref.Range</h6>
          </div>
          {urinedata.map((item) => (
            <div className="row mb-3" key={item.name.toLowerCase()}>
              <div className="col-md-3">
                <label>{item.name}</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                name={item.name.toLowerCase()}
                value={formData[item.name.toLowerCase()] || ""}
                onChange={handleChange}
              />
              <label className="col md-3">{item.unit}</label>
              <label className="col md-3 mb-4">{item.range}</label>
              {item.name === "Specific Gravity" && (
                <h4 className="mb-4">Dipstick Chemical Estimition</h4>
              )}
              {item.name === "Nitrite" && (
                <h4 className="mb-4">Microscopic Examination</h4>
              )}
            </div>
          ))}
          <div>
            <label htmlFor="comments">Comments</label>
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
