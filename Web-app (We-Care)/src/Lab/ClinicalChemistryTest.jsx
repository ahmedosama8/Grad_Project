import React from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import "./clinicalchemistry.css";
export default function ClinicalChemistryTest() {
  return (
    <div>
      <Topbar />
      <Sidebar />
      <div
        className="App container col-6"
        style={{ position: "relative", top:20, width: 1000 }}
      >
        <h3>Patient Demoghraphics</h3>
        <form noValidate>
          <div className="row mb-3">
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
          </div>

          <h3>Lipid Profile</h3>
          <div className="row mb-3">
            <h6 className="col md-3"> </h6>
            <h6 className="col md-3">Result</h6>
            <h6 className="col md-3">Unit</h6>
            <h6 className="col md-3">Ref.Range</h6>
          </div>
          <div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>ALT (SGPT), serum</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">U/L</label>
              <label className="col md-3">10-65</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>AST (SGOT), serum</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">U/L</label>
              <label className="col md-3">0-48</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Albumin, serum</label>
              </div>
              <input
                className="form-control col md-3 boxentry"
                type="number"
                noValidate
              />
              <label className="col md-3">g/dL</label>
              <label className="col md-3">3.5-5.2</label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Cholestrol Total, serum</label>
              </div>
              <input
                className="form-control col md-3 cholestrolbox"
                type="number"
                noValidate
              />
              <label className="col md-3">mg/dL</label>
              <label className="col md-3">
                Desirable: &lt; 200 mg/dL <br />
                Borderline High: 200-239 mg/dl <br />
                High: &gt; or = 240 mg/dL
              </label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>HDL-C, serum</label>
              </div>
              <input
                className="form-control col md-3 cholestrolbox"
                type="number"
                noValidate
              />
              <label className="col md-3">mg/dL</label>
              <label className="col md-3">
                Low HDL: &lt; 40 mg/dL <br />
                Borderline Low: 40-60 mg/dL <br />
                Acceptable: &gt; 60 mg/dL
              </label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>LDL-C, serum</label>
              </div>
              <input
                className="form-control col md-3 cholestrolbox"
                type="number"
                noValidate
              />
              <label className="col md-3">mg/dL</label>
              <label className="col md-3">
                Desirable: &lt; 100 mg/dL <br />
                Above Desirable: 100-129 mg/dl <br />
                Borderline High: 130-159 mg/dL
                <br />
                High: 160-189 mg/dL
                <br /> Very High: &gt; or =190 mg/dL
              </label>
            </div>
            <div className="row mb-3">
              <div className="col-md-3">
                <label>Triglycerides, serum</label>
              </div>
              <input
                className="form-control col md-3 cholestrolbox"
                type="number"
                noValidate
              />
              <label className="col md-3">mg/dL</label>
              <label className="col md-3">
                &lt; 150 Desirable
                <br /> 150-199 Border High Line <br /> 200-499 High
                <br />
                &gt;=500 Very High
              </label>
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
