import React, { useState } from "react";
import SidebarRad from "../Sidebar/SidebarRad";
import Topbar from "../Topbar/Topbar";
import { useLocation, useParams } from "react-router-dom";
import axios from "axios";
import ReactQuill from "react-quill";
import { calculateAge } from "../configure";

export default function RadScan() {
  const { id } = useParams();
  const location = useLocation();

  const [formData, setFormData] = useState({
    patient_id: id,
    entity_id: "3",
  });
  const [content,setContent]=useState()

  const handleSubmit = (event) => {
    event.preventDefault();
    axios
      .post(`http://localhost:8080/api/radiology/new`, formData)
      .then((response) => {
        console.log("Data posted:", response.data);
        console.log("response", response);
        if (response.status === 201) {
          // Navigate to another page
          window.location.href = `/patientresultrad/${id}`;
        }
        // Do something with the response, e.g. show a success message
      })
      .catch((error) => {
        console.error("Error posting data:", error);
        // Handle the error, e.g. show an error message
      });
  };
  console.log("cbc data", formData);
  const handleChange = (event) => {
    const fieldName = event.target.name.toLowerCase();
    setFormData({
      ...formData,
      [fieldName]: event.target.value,
    });
  };
  function handleBox(value) {
    setContent(value);
    setFormData({
      ...formData,
      report: value,
    });
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
  const age = calculateAge(location.state?.age)

  return (
    <div>
      <Topbar />
      <SidebarRad />
      <div
        className="App container col-6"
        style={{ position: "relative", top: "50px", width: 1000 }}
      >
        <h3>Patient Demoghraphics</h3>
        <form onSubmit={handleSubmit} noValidate>
          <div className="row mb-3">
            <div className="col-md-4">
              <label htmlFor="firstName">Name</label>
              <p className="patientdata"> {location.state?.name} </p>
            </div>
            <div className="col-md-4">
              <label htmlFor="lastName">Age</label>
              <p className="patientdata">{age} </p>
            </div>
            <div className="col md-4">
              <label htmlFor="email">Patient's ID</label>
              <p className="patientdata">{id}</p>
            </div>
          </div>
          <div className="row mb-3">
            <div className="col md-4">
              <label htmlFor="email">Examination Part</label>
              <input
                className="form-control"
                name="examined_part"
                placeholder="Body Part"
                value={formData.examined_part || ""}
                onChange={handleChange}
                type="text"
                noValidate
              />
            </div>
            <div className="col md-4">
              <label for="comments">Examination Type</label>
              <input
                className="form-control"
                name="name"
                placeholder="Type"
                value={formData.name || ""}
                onChange={handleChange}
                type="text"
                noValidate
              />
            </div>
            <div className="col md-4">
              <label for="comments">Referring Doctor</label>
              <input
                className="form-control"
                name="performer"
                placeholder="Dr/Drss.."
                value={formData.performer || ""}
                onChange={handleChange}
                type="text"
                noValidate
              />
            </div>
          </div>

          <h3>Scan Result</h3>
          <div className="col md-6 mb-3">
            <label htmlFor="email">Comment</label>
            <input
              className="form-control"
              name="comments"
              placeholder="Write Short Comment About The Result"
              value={formData.comments || ""}
              onChange={handleChange}
              type="text"
              noValidate
            />
          </div>
          <div>
            <label for="comments">Findings</label>
            {/* <textarea
              className="findingbox"
              name="report"
              value={formData.report || ""}
              onChange={handleChange}
              placeholder="Write The Report.."
            ></textarea> */}
            <ReactQuill
              value={content}
              onChange={handleBox}
              modules={modules}
              formats={formats}
              placeholder="Type something..."
            />
          </div>

          <div style={{paddingTop:"20px"}} >
            <button type="submit" className="submitform">Submit</button>
          </div>
        </form>
      </div>
    </div>
  );
}
