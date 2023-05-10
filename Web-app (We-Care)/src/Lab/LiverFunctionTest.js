import React, { useState } from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import "./CBCTest.css";
import axios from "axios";

const liverData = [
  { name: "ALT", unit: "U/L", range: "10 - 130" },
  { name: "AST", unit: "U/L", range: "10 - 34" },
  {
    name: "ALB",
    unit: "g/dL",
    range: "3.4 - 5.4",
  },
  {
    name: "DBIL",
    unit: "mg/dL",
    range: "0 - 0.3",
  },
  {
    name: "TBIL",
    unit: "mg/dL",
    range: "0.1 - 1.2",
  },
  { name: "ALP", unit: "U/L", range: "24 - 147" },
];
function LiverTest() {
  const [formData, setFormData] = useState({ labname: "dosh" });

  const handleSubmit = (event) => {
    event.preventDefault();
    axios
      .post("http://localhost:3001/medicalLabTests", formData)
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
          <h3 className="mb-4">Liver Function Test</h3>

          <div className="row mb-3">
            <h6 className="col md-3"> </h6>
            <h6 className="col md-3">Result</h6>
            <h6 className="col md-3">Unit</h6>
            <h6 className="col md-3">Ref.Range</h6>
          </div>
          {liverData.map((item) => (
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

export default LiverTest;

// const [state, setState] = useState();
// const { name, attValue } = [];

// const addTest=async(data)=>{
//   const res = await axios .post(`http://localhost:3001/medicalLabTests`,data);
// }
// const handleSubmit = (e) => {
//   e.preventDefault();
//   addTest(state);
// };
// const handleInputChange = (e) => {
//   let { name, attValue } = e.target;
//   setState({ ...state, [name]: attValue });
// };

{
  /* <div className="row mb-3">
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
<div className="col md-6">
  <label htmlFor="email">Examination Date</label>
  <p className="patientdata">3/2/2022</p>
</div>
</div> */
}
