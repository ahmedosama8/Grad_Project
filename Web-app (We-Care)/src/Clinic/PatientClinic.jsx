import React, { useEffect, useState } from "react";
import SidebarClinic from "../Sidebar/SidebarClinic";
import Topbar from "../Topbar/Topbar";
import { IconButton } from "@mui/material";
import AddCircleIcon from "@mui/icons-material/AddCircle";
import RemoveIcon from "@mui/icons-material/Remove";
import "./patientclinic.css";
import "react-draft-wysiwyg/dist/react-draft-wysiwyg.css";
import ReactQuill from "react-quill";
import "react-quill/dist/quill.snow.css";
// import CKEditor from "@ckeditor/ckeditor5-react";
// import Editor from "@juniyadi/ckeditor5-custom-build";

//editor rich text

export default function PatientClinic() {
  const [inputBoxes, setInputBoxes] = useState([]);

  const handleAddInputBox = (event) => {
    event.preventDefault();
    setInputBoxes([...inputBoxes, ""]);
  };

  const handleInputChange = (event, index) => {
    const updatedInputBoxes = [...inputBoxes];
    updatedInputBoxes[index] = event.target.value;
    setInputBoxes(updatedInputBoxes);
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    // Do something with the input values
    console.log(inputBoxes);
  };
  const handleRemoveInputBox = (event) => {
    event.preventDefault();
    setInputBoxes(inputBoxes.slice(0, -1));
  };
  const [content, setContent] = useState("");

  function handleChange(value) {
    setContent(value);
  }

  const modules = {
    toolbar: [
      ["bold", "italic", "underline", "strike"],
      [{ header: 1 }, { header: 2 }],
      [{ list: "ordered" }, { list: "bullet" }],
      [{ indent: "-1" }, { indent: "+1" }],
      [{ align: [] }],
      ["link", "image", "video"],
      ["clean"],
    ],
  };
  const formats = [
    "header",
    "bold",
    "italic",
    "underline",
    "strike",
    "blockquote",
    "list",
    "bullet",
    "indent",
    "link",
    "image",
    "video",
    "align",
  ];
  
  
  return (
    <div>
      <Topbar />
      <SidebarClinic />
      <div
        className="container col-6"
        style={{ position: "relative", bottom: 950, right: 100, width: 1000 }}
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
            <ReactQuill
              value={content}
              onChange={handleChange}
              modules={modules}
              formats={formats}
              placeholder="Type something..."
            />
          </div>
          <h3 style={{ marginBottom: "20px",paddingTop:"10px" }}>Medications</h3>
          <div className="row">
            <div className="col-md-4">
              {/* <button
                className="btn btn-primary mb-3"
                onClick={handleAddInputBox}
                style={{ marginBottom: "10px" }} // Add margin-bottom style
              >
                Add Medicine
              </button> */}
              <IconButton
                color="success"
                aria-label="add to shopping cart"
                onClick={handleAddInputBox}
              >
                <AddCircleIcon style={{ fontSize: "70px" }} />
              </IconButton>
              <IconButton color="success" onClick={handleRemoveInputBox}>
                <RemoveIcon style={{ fontSize: "70px" }} />
              </IconButton>
            </div>
            <div className="col-md-8">
              <form onSubmit={handleSubmit}>
                {inputBoxes.map((value, index) => (
                  <input
                    key={index}
                    type="text"
                    className="form-control mb-3"
                    value={value}
                    onChange={(event) => handleInputChange(event, index)}
                  />
                ))}
                <button type="submit" className="btn btn-primary">
                  Submit
                </button>
              </form>
            </div>
          </div>
          <div />
        </form>
      </div>
    </div>
  );
}
