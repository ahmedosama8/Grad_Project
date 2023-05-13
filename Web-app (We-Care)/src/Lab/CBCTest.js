import React, { useEffect, useState } from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import "./CBCTest.css";

// function MouseOver(event) {
//   event.target.style.background = "red";
// }

function CBCTest() {
  const [posts, setPosts] = useState([]);
  return (
    <div>
      <Topbar />
      <Sidebar />
      <div
        className="App container"
        style={{ position: "relative",top:"50px", width: 1000 }}
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
          </div>

          <h3>CBC Test</h3>
          <div className="row mb-3">
            <h6 className="col md-3"> </h6>
            <h6 className="col md-3">Result</h6>
            <h6 className="col md-3">Unit</h6>
            <h6 className="col md-3">Ref.Range</h6>
          </div>
          <div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Haemoglobin</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">g/dL</label>
              <label className="col md-3">13 - 17</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Hematocrit</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">%</label>
              <label className="col md-3">40-50</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Red Cell Count</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">x10⁶ /uL</label>
              <label className="col md-3">4.5 - 6.2</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>MCV</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">fL</label>
              <label className="col md-3">78 - 96</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>MCV</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">fL</label>
              <label className="col md-3">78 - 96</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>MCH</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">pg</label>
              <label className="col md-3">26 - 32</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>MCHC</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">g/dL</label>
              <label className="col md-3">31 - 36</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>RDW</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">% </label>
              <label className="col md-3">11.5 - 14.5</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Platelet Count</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">x10³/uL</label>
              <label className="col md-3">150 - 450</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>T.L.C</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">x10³/uL</label>
              <label className="col md-3">4 - 11</label>
            </div>
            <h4>Differential Count</h4>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Basophils</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">%</label>
              <label className="col md-3">0-1</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Eosinophils</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">%</label>
              <label className="col md-3">0-6</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Stab</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">%</label>
              <label className="col md-3">0-7</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Segmented</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">%</label>
              <label className="col md-3">40-75</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Lymphocytes</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">%</label>
              <label className="col md-3">20 - 45</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Monocytes</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">%</label>
              <label className="col md-3">1-10</label>
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

export default CBCTest;
