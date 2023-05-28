import React, { useState } from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import "./clinicalchemistry.css";
import { useLocation, useParams } from "react-router-dom";
import axios from "axios";
import { calculateAge } from "../configure";
import configure from "../configure";
const lipidData = [
  {
    name: "Cholestrol Total, serum",
    Attribute: "cholesterol",
    unit: "mg/dL",
    range:
      "Desirable: < 200 mg/dL\nBorderline High: 200-239 mg/dl\nHigh: >= 240 mg/dL",
  },
  {
    name: "HDL-C, serum",
    Attribute: "hdl_c",
    unit: "mg/dL",
    range:
      "Low HDL: < 40 mg/dL\nBorderline Low: 40-60 mg/dL\nAcceptable: > 60 mg/dL",
  },
  {
    name: "LDL-C, serum",
    Attribute: "ldl_c",

    unit: "mg/dL",
    range:
      "Desirable: < 100 mg/dL\nAbove Desirable:100-129 mg/dl\nBorderline High:130-159 mg/dL\nHigh: 160-189 mg/dL\nVery High: >= 190 mg/dL",
  },
  {
    name: "Triglycerides, serum",
    Attribute: "triglycerides",
    unit: "mg/dL",
    range:
      "< 150 Desirable\n150-199 Border High Line\n200-499 High\n>= 500 Very High",
  },
  {
    name: "VLDL cholestrol",
    Attribute: "vldl_cholestrol",
    unit: "mg/dL",
    range: "Up to: 32",
  },
  {
    name: "Total Lipids",
    Attribute: "total_lipids",
    unit: "mg/dL",
    range: "Up to: 750",
  },
  {
    name: "Risk Ratio I",
    Attribute: "risk_ratio_1",
    unit: "",
    range: "Up to: 5.5",
  },
  {
    name: "Oxdized LDL",
    Attribute: "oxidized_ldl",
    unit: "U/L",
    range: "26-117",
  },
  {
    name: "Risk Ratio II",
    Attribute: "risk_ratio_2",
    unit: "",
    range: "1/2 Average: <3.9 \n Average: <5.0 \n 2 Average: <9.6 \n 3 Averaege: <23.4",
  },
  {
    name: "H-CRP",
    Attribute: "h_crp",
    unit: "mg/L",
    range: "0 - 3 ",
  },
  {
    name: "Ratio",
    Attribute: "ratio",
    unit: "",
    range: "Non CAD  0.2\nStable Angina  >1.7\nUnstable Angina  >4.3\nMyocardial infarction  >7.5",
  },
  {
    name: "Lipoprotein",
    Attribute: "lipo_protein",
    unit: "mg/dL",
    range: "Desirable <20\nBorderline risk 20-30\nHigh risk 31-50\nVery high risk >50",
  },
  {
    name: "APOA",
    Attribute: "apoa",
    unit: "g/L",
    range: "1.08-2.25",
  },
  {
    name: "APOB",
    Attribute: "apob",
    unit: "g/L",
    range: "0.5-1.3",
  },
];

export default function ClinicalChemistryTest() {
  const { id } = useParams();
  const location = useLocation();
  const entity_id=sessionStorage.getItem("User_id");


  const [formData, setFormData] = useState({
    patient_id: id,
    entity_id: entity_id,
  });

  const handleSubmit = (event) => {
    event.preventDefault();
    axios
      .post(`${configure.backURL}lipid/new`, formData)
      .then((response) => {
        console.log("Data posted:", response.data);
        if (response.status === 201) {
          // Navigate to another page
          window.location.href = `/allpatientspage/patientresultpage/${id}`;
        }
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
  const handleInput = (event) => {
    const fieldName = event.target.name;
    setFormData({
      ...formData,
      [fieldName]: event.target.value,
    });
  };

  console.log(formData);
  const age = calculateAge(location.state?.age);

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
              <label htmlFor="firstName">Name</label>
              <p className="patientdata">{location.state?.name} </p>
            </div>
            <div className="col-md-4">
              <label htmlFor="lastName">Age</label>
              <p className="patientdata">{age} </p>
            </div>
            <div className="col md-4">
              <label htmlFor="email">Patient's ID</label>
              <p className="patientdata">{id}</p>
            </div>
          </div>
          <div className="row mb-4">
            <div className="col-md-6">
              <label>Referring Doctor</label>
              <input
                className="form-control"
                type="text"
                name="referring_doctor"
                // value={formData.referring_doctor}
                onChange={handleInput}
                noValidate
              />
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
            <div className="row mb-3" key={item.Attribute}>
              <div className="col-md-3">
                <label>{item.name}</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                name={item.Attribute}
                value={formData[item.Attribute] || ""}
                onChange={handleChange}
              />
              <label className="col md-3">{item.unit}</label>
              <label className="col md-3 display-linebreak">{item.range}</label>
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

          <div className="mb-9">
            <button type="submit" className="submitform">
              Submit
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
