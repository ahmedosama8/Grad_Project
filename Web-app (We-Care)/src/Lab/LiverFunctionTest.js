import React, { useState } from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import "./CBCTest.css";
import axios from "axios";

const liverData = [
  { name: "ALT", value: "12", unit: "U/L", range: "10 - 130" },
  { name: "AST", value: "12", unit: "U/L", range: "10 - 34" },
  {
    name: "ALB",
    value: "12",
    unit: "g/dL",
    range: "3.4 - 5.4"
  },
  {
    name: "DBIL",
    value: "12",
    unit: "mg/dL",
    range: "0 - 0.3"
  },
  {
    name: "TBIL",
    value: "12",
    unit: "mg/dL",
    range: "0.1 - 1.2"
  },
  { name: "ALP", value: "12", unit: "U/L", range: "24 - 147" },
];
function LiverTest() {
  const [formData, setFormData] = useState({});

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
    setFormData({
      ...formData,
      [event.target.name]: event.target.value,
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
          <h3>Liver Function Test</h3>
          <div className="row mb-3">
            <h6 className="col md-3"> </h6>
            <h6 className="col md-3">Result</h6>
            <h6 className="col md-3">Unit</h6>
            <h6 className="col md-3">Ref.Range</h6>
          </div>
          {liverData.map((item) => (
            <div className="row mb-3" key={item.name}>
              <div className="col-md-3">
                <label htmlFor={item.name}>{item.name}</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                id={item.name}
                name={item.name}
                value={formData[item.name] || ""}
                onChange={handleChange}
                noValidate
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
