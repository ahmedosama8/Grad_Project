import React, { useEffect, useState } from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import "./CBCTest.css";

export default function UrineExamTest() {
  document.title = "Urine Test / Lab";

  return (
    <div>
      <Topbar />
      <Sidebar />
      <div
        className="App container"
        style={{ position: "relative", top: "50px", width: 1000 }}
      >
        <h3>Patient Demoghraphics</h3>
        <form noValidate>
          <div className="row mb-3">
            <div className="col-md-6">
              <label htmlFor="firstName">First Name</label>
              <p className="patientdata">Mohamed </p>
            </div>
            <div className="col-md-6">
              <label htmlFor="lastName">Last Name</label>
              <p className="patientdata">Fathy </p>
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
          <div className="texts">
            <div className="row mb-3">
              <h6 className="col md-3">Test</h6>
              <h6 className="col md-3">Result</h6>
              <h6 className="col md-3">Unit</h6>
              <h6 className="col md-3">Ref.Range</h6>
            </div>
          </div>
          <h3 className="mb-4">Physiochemical Data</h3>
          <div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Color</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                noValidate
              />
              <label className="col md-3"></label>
              <label className="col md-3">Amber yellow</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Clarity</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                noValidate
              />
              <label className="col md-3"></label>
              <label className="col md-3">Clear</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Specific Gravity</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                noValidate
              />
              <label className="col md-3"></label>
              <label className="col md-3">1015 - 1025</label>
            </div>
            <div className="row mb-3"></div>
            <h3 className="mb-4">Dipstick Chemical Estimition </h3>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>PH</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                noValidate
              />
              <label className="col md-3"></label>
              <label className="col md-3">4.5 - 6.5</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Protein</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                noValidate
              />
              <label className="col md-3"></label>
              <label className="col md-3">Negative</label>
            </div>

            <div className="row mb-3">
              <div className="col-md-3">
                <label>Glucose</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                noValidate
              />
              <label className="col md-3"></label>
              <label className="col md-3">Negative</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Ketone</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                noValidate
              />
              <label className="col md-3"></label>
              <label className="col md-3">Negative</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Urobilinogen</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                noValidate
              />
              <label className="col md-3"></label>
              <label className="col md-3">Normal Trace</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Bilirubin</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                noValidate
              />
              <label className="col md-3"></label>
              <label className="col md-3">Negative</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Nitrite</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                noValidate
              />
              <label className="col md-3"></label>
              <label className="col md-3">Negative</label>
            </div>

            <h3 className="mb-4">Microscopic Examination </h3>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Pus Cells</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                noValidate
              />
              <label className="col md-3">/HPF</label>
              <label className="col md-3">0 : 1</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Red Cells</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                noValidate
              />
              <label className="col md-3">/HPF</label>
              <label className="col md-3">0 : 1</label>
            </div>

            <div className="row mb-3">
              <div className="col-md-3">
                <label>Epithelial Cells</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                noValidate
              />
              <label className="col md-3">/HPF</label>
              <label className="col md-3">Negative</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Amorphous</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                noValidate
              />
              <label className="col md-3">/HPF</label>
              <label className="col md-3">Negative</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Crystals</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                noValidate
              />
              <label className="col md-3">/HPF</label>
              <label className="col md-3">Negative</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Casts</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                noValidate
              />
              <label className="col md-3">/HPF</label>
              <label className="col md-3">Negative</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Others</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="text"
                noValidate
              />
              <label className="col md-3">/HPF</label>
              <label className="col md-3"></label>
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
          </div>
        </form>
      </div>
    </div>
  );
}
