import React, { useEffect, useState } from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import "./CBCTest.css";
import axios from "axios";
import { useLocation, useParams } from "react-router-dom";
import { urinedata } from "../BackEndFunctions";
import { calculateAge } from "../configure";

export default function UrineExamTest() {
  const { id } = useParams();
  const location = useLocation();
  document.title = "Urine Test / Lab";
  const [formData, setFormData] = useState({
    patient_id: id,
    entity_id: "2",
  });

  const handleSubmit = (event) => {
    event.preventDefault();
    axios
      .post("http://localhost:8080/api/urine/new", formData)
      .then((response) => {
        console.log("Data posted:", response.data);
        window.location.href = `/allpatientspage/patientresultpage/${id}`;

        // Do something with the response, e.g. show a success message
      })
      .catch((error) => {
        console.error("Error posting data:", error);
        // Handle the error, e.g. show an error message
      });
  };

  const handleChange = (event) => {
    const fieldName = event.target.name;
    setFormData({
      ...formData,
      [fieldName]: event.target.value,
    });
  };
  const age = calculateAge(location.state?.age);
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
              <label htmlFor="firstName">Name</label>
              <p className="patientdata">{location.state?.name} </p>
            </div>
            <div className="col-md-4">
              <label htmlFor="lastName">ِAge</label>
              <p className="patientdata">{age} </p>
            </div>
            <div className="col md-4">
              <label htmlFor="email">Patient's ID</label>
              <p className="patientdata">{id}</p>
            </div>
          </div>
          <div>
          <div className="row mb-4">
            <div className="col-md-6">
              <label>Referring Doctor</label>
              <input
                className="form-control"
                type="text"
                name="referring_doctor"
                value={formData.referring_doctor}
                onChange={handleChange}
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
            <div className="row mb-3" key={item.Attribute}>
              <div className="col-md-3">
                <label>{item.name}</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                name={item.Attribute}
                value={formData[item.Attribute] || ""}
                onChange={handleChange}
              />
              <label className="col md-3">{item.unit}</label>
              <label className="col md-3 mb-4">{item.range}</label>
              {item.name === "Specific Gravity" && (
                <h4 className="mb-4 mt-4">Dipstick Chemical Estimition</h4>
              )}
              {item.name === "Nitrite" && (
                <h4 className="mb-4 mt-4">Microscopic Examination</h4>
              )}
            </div>
          ))}

          <div className="mb-9">
            <button type="submit" className="submitform">Submit</button>
          </div>
        </form>
      </div>
    </div>
  );
}
