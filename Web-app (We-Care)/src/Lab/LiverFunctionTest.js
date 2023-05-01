import React from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import "./CBCTest.css";

// function MouseOver(event) {
//   event.target.style.background = "red";
// }
function LiverTest() {
  return (
    <div>
      <Topbar />
      <Sidebar />
      <div
        className="App container col-6"
        style={{ position: "relative", top:"50px", width: 1000 }}
      >
        <h3>Patient Demoghraphics</h3>
        <form noValidate>
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
            <div className="col md-6">
              <label htmlFor="email">Examination Date</label>
              <p className="patientdata">3/2/2022</p>
            </div>
          </div>x 

          <h3>Liver Function Test</h3>
          <div className="row mb-3">
            <h6 className="col md-3"> </h6>
            <h6 className="col md-3">Result</h6>
            <h6 className="col md-3">Unit</h6>
            <h6 className="col md-3">Ref.Range</h6>
          </div>
          <div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>ALT</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">U/L</label>
              <label className="col md-3">10 - 130</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>AST</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">U/L</label>
              <label className="col md-3">10 - 34</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>ALB</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3"> g/dL</label>
              <label className="col md-3">3.4 - 5.4</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>DBIL</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">mg/dL</label>
              <label className="col md-3">0 - 0.3</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>TBIL</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">mg/dL</label>
              <label className="col md-3">0.1 - 1.2</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>ALP</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">U/L</label>
              <label className="col md-3">24 - 147</label>
            </div>
          </div>

          <div>
            <label for="comments">Comments</label>
            <textarea
              className="commentbtn"
              id="comments"
              name="comments"
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
