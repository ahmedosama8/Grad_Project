import React, { useEffect, useState } from "react";
import SidebarClinic from "../Sidebar/SidebarClinic";
import Topbar from "../Topbar/Topbar";
import "./patientclinic.css";
import "react-draft-wysiwyg/dist/react-draft-wysiwyg.css";
// import CKEditor from "@ckeditor/ckeditor5-react";
// import Editor from "@juniyadi/ckeditor5-custom-build";

//editor rich text

export default function PatientClinic() {
  const [inputBoxes, setInputBoxes] = useState([]);

  const handleAddInputBox = (event) => {
    event.preventDefault();
    setInputBoxes([...inputBoxes, '']);
  }

  const handleInputChange = (event, index) => {
    const updatedInputBoxes = [...inputBoxes];
    updatedInputBoxes[index] = event.target.value;
    setInputBoxes(updatedInputBoxes);
  }

  const handleSubmit = (event) => {
    event.preventDefault();
    // Do something with the input values
    console.log(inputBoxes);
  }

  return (
    <div>
      <Topbar />
      <SidebarClinic />
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
              <label htmlFor="email">Visit Date</label>
              <input
                className="form-control"
                placeholder="date"
                type="date"
                noValidate
              />
            </div>
          </div>

          <h3>Visit Result</h3>
          <div>
            <label for="comments">Findings</label>
            {/* <CKEditor editor={Editor} data="<p>Hello from CKEditor 5!</p>" /> */}
            <textarea
              className="findingbox"
              id="comments"
              name="comments"
              placeholder="Write Comments.."
            ></textarea>
          </div>
          <label for="comments">Medications</label>
          <div className="row mb-3">
            <button onClick={handleAddInputBox}>Add Input Box</button>
            <form onSubmit={handleSubmit}>
              {inputBoxes.map((value, index) => (
                <input
                  key={index}
                  type="text"
                  value={value}
                  onChange={(event) => handleInputChange(event, index)}
                />
              ))}
              <button type="submit">Submit</button>
            </form>
          </div>
          <div />
        </form>
      </div>
    </div>
  );
}
