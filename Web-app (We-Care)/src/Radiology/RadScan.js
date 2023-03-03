import React from "react";
import SidebarRad from "../Sidebar/SidebarRad";
import Topbar from "../Topbar/Topbar";
import "./radscan.css"

export default function RadScan() {
  return (
    <div>
      <Topbar />
      <SidebarRad />
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
          <div className="col md-6 mb-3">
            <label for="comments">Examination Type</label>
            <input
              className="form-control"
              placeholder="Type"
              type="text"
              noValidate
            />
          </div>

          <h3>Scan Result</h3>
          <div>
            <label for="comments">Findings</label>
            <textarea
              className="findingbox"
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
