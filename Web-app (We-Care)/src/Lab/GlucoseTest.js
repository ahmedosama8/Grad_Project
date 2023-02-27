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
        style={{ position: "relative", bottom: 730, width: 1000 }}
      >
        <h3>Patient Demoghraphics</h3>
        <form noValidate>
          <div className="row mb-3">
            <div className="col-md-6">
              <label htmlFor="firstName">First Name</label>
              <input
                // onMouseOver={MouseOver}
                className="form-control"
                placeholder="First Name"
                type="text"
                name="firstName"
                noValidate
              />
            </div>
            <div className="col-md-6">
              <label htmlFor="lastName">Last Name</label>
              <input
                className="form-control"
                placeholder="Last Name"
                type="text"
                name="lastName"
                noValidate
              />
            </div>
          </div>
          <div className="row mb-3">
            <div className="col md-6">
              <label htmlFor="email">Patient's ID</label>
              <input
                className="form-control"
                placeholder="ID"
                type="number"
                noValidate
              />
            </div>
            <div className="col md-6">
              <label htmlFor="email">Examination Date</label>
              <input
                className="form-control"
                placeholder="date"
                type="date"
                noValidate
              />
            </div>
          </div>

          <h3>Glucose Tests</h3>
          <div className="row mb-3">
            <h6 className="col md-3"> </h6>
            <h6 className="col md-3">Result</h6>
            <h6 className="col md-3">Unit</h6>
            <h6 className="col md-3">Ref.Range</h6>
          </div>
          <div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>R B G</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">mg/dL</label>
              <label className="col md-3">     -- </label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>R B S</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">mg/dL</label>
              <label className="col md-3">     -- </label>
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
