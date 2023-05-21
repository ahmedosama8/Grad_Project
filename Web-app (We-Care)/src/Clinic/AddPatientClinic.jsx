import React, { useEffect, useState } from "react";
import SidebarClinic from "../Sidebar/SidebarClinic";
import Topbar from "../Topbar/Topbar";
import { IconButton } from "@mui/material";
import AddCircleIcon from "@mui/icons-material/AddCircle";
import RemoveIcon from "@mui/icons-material/Remove";
import "./addpatient.css";
import "react-draft-wysiwyg/dist/react-draft-wysiwyg.css";
import ReactQuill from "react-quill";
import "react-quill/dist/quill.snow.css";
import { useLocation, useParams } from "react-router-dom";
import Select from "react-select";
import axios from "axios";

// import CKEditor from "@ckeditor/ckeditor5-react";
// import Editor from "@juniyadi/ckeditor5-custom-build";

//editor rich text

export default function AddPatientClinic() {
  const { id } = useParams();
  const location = useLocation();
  const entity_id = sessionStorage.getItem("User_id");

  const [formData, setFormData] = useState({});
  console.log("Pateint_id", id);
  const [inputBoxes, setInputBoxes] = useState([]);
  const [selectValues, setSelectValues] = useState([]);
  const [medicines, setMedicines] = useState([]);

  const handleAddInputBox = (event) => {
    event.preventDefault();
    setInputBoxes([...inputBoxes, ""]);
  };

  useEffect(() => {
    loadMedicines();
  }, []);

  const loadMedicines = async () => {
    const res = await axios.get(`http://localhost:8080/api/medications/list`);
    setMedicines(res.data);
    console.log("cbc data", res);
  };
  const medicationNames = medicines.map((medication) => medication.name);

  console.log(medicines);
  const handleInputChange = (selectedOption, index) => {
    const updatedInputBoxes = [...inputBoxes];
    updatedInputBoxes[index] = selectedOption.value;
    setInputBoxes(updatedInputBoxes);
    setSelectValues(updatedInputBoxes);
  };
  const [doses, setDoses] = useState([]);

  const handleDoseChange = (e, index) => {
    const updatedDoses = [...doses];
    updatedDoses[index] = e.target.value;
    setDoses(updatedDoses);
  };
  const requestBody = {
    patient_id: id,
    entity_id: entity_id,
    diagnoses: doses.filter(Boolean),
    medications: inputBoxes.filter(Boolean),
  };
  console.log("Doses", doses);

  const handleSubmit = (event) => {
    event.preventDefault();
    // Do something with the input values
    console.log("Dosh");
    axios
      .post(`http://localhost:8080/api/visit/new`, {
        ...formData,
        ...requestBody,
      })
      .then((response) => {
        console.log("Data posted:", response.data);
        console.log("response", response);
        if (response.status === 201) {
          // Navigate to another page
          window.location.href = `/clinicpatientspage`;
          console.log("success");
        }
        // Do something with the response, e.g. show a success message
      })
      .catch((error) => {
        console.error("Error posting data:", error);
        // Handle the error, e.g. show an error message
      });
  };
  const handleRemoveInputBox = (event) => {
    event.preventDefault();
    setInputBoxes(inputBoxes.slice(0, -1));
    setSelectValues(selectValues.slice(0, -1));
  };
  const [content, setContent] = useState("");
  // const handleDoseChange = (event, index) => {
  //   const updatedDoseValues = [...dose];
  //   updatedDoseValues[index] = event.target.value;
  //   setDoseValues(updatedDoseValues);
  // };
  function handleChange(value) {
    setContent(value);
    setFormData({
      ...formData,
      comments: value,
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
  const medications = [
    "Aspirin",
    "Ibuprofen",
    "Acetaminophen",
    "Amoxicillin",
    "Lisinopril",
    "Metformin",
    "Lipitor",
    "Levothyroxine",
    "Omeprazole",
    "Simvastatin",
    "Losartan",
    "Gabapentin",
    "Albuterol",
    "Sertraline",
    "Hydrochlorothiazide",
    // Add more medications here...
  ];

  console.log(selectValues);
  console.log("Data", formData);
  const calculateAge = (birthDate) => {
    const today = new Date();
    const birthDateObj = new Date(birthDate);
    let age = today.getFullYear() - birthDateObj.getFullYear();

    const monthDiff = today.getMonth() - birthDateObj.getMonth();
    if (
      monthDiff < 0 ||
      (monthDiff === 0 && today.getDate() < birthDateObj.getDate())
    ) {
      age--;
    }

    return age;
  };
  const age = calculateAge(location.state?.birthDate);
  const handleDose = (event) => {
    const fieldName = event.target.name;
    setFormData({
      ...formData,
      [fieldName]: event.target.value,
    });
  };

  return (
    <div>
      <Topbar />
      <SidebarClinic />
      <div
        className="container col-6"
        style={{ position: "relative", top: "50px", width: 1000 }}
      >
        <h3>Patient Demoghraphics</h3>
        <form noValidate onSubmit={handleSubmit}>
          <div className="row mb-3">
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
          <h3 style={{ marginBottom: "20px", paddingTop: "10px" }}>
            Medications
          </h3>
          <div className="row">
            <div className="col-md-4">
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
              <form>
                {inputBoxes.map((box, index) => (
                  <div className="row input-boxes">
                    <Select
                      className="col md-6"
                      key={index}
                      onChange={(selectedOption) =>
                        handleInputChange(selectedOption, index)
                      }
                      options={medicationNames.map((bodyPart) => ({
                        value: bodyPart,
                        label: bodyPart,
                      }))}
                    />
                    <input
                      className="col md-6"
                      type="text"
                      placeholder="Enter dose"
                      value={doses[index] || ""}
                      onChange={(e) => handleDoseChange(e, index)}
                    />
                  </div>
                ))}
              </form>
              <button type="submit" className="btn btn-success">
                Submit
              </button>
            </div>
          </div>
          <div />
        </form>
      </div>
    </div>
  );
}
