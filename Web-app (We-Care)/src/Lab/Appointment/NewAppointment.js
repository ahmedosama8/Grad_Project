import React, { useState } from "react";
import axios from "axios";
import "../newpatient.css";
import Topbar from "../../Topbar/Topbar";
import Sidebar from "../../Sidebar/Sidebar";
import SidebarRad from "../../Sidebar/SidebarRad";
export default function NewAppointment() {
  const [patientID, setPatientID] = useState();
  const entity_id = sessionStorage.getItem("User_id");
  const entity_type = sessionStorage.getItem("User_type");
  const [formData, setFormData] = useState({
    entity_id: sessionStorage.getItem("User_id"),
  });

  const handleID = (event) => {
    const fieldName = event.target.name;
    const fieldValue = event.target.value;
    setFormData({
      ...formData,
      [fieldName]: fieldValue,
    });
    setPatientID(fieldValue);
  };

  const handledate = (event) => {
    const fieldName = event.target.name;
    setFormData({
      ...formData,
      [fieldName]: event.target.value,
    });
  };

  const handleTest = (event) => {
    const fieldName = event.target.name;
    setFormData({
      ...formData,
      [fieldName]: event.target.value,
    });
  };

  const handleNotes = (event) => {
    const fieldName = event.target.name;
    const fieldValue = event.target.value;
    setFormData({
      ...formData,
      [fieldName]: fieldValue,
    });
  };

  const handleScanType = (event) => {
    const fieldName = event.target.name;
    const fieldValue = event.target.value;
    setFormData({
      ...formData,
      [fieldName]: fieldValue,
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    // if (
    //   firstNameError !== "" ||
    //   lastnameerror !== "" ||
    //   phoneNumberError !== "" ||
    //   Emergency_phoneNumberError !== "" ||
    //   emailError !== "" ||
    //   nationaliderror !== "" ||
    //   !formData.name
    // ) {
    //   console.log("tex el dosh");
    //   return; // Don't submit if there are validation errors
    // }
    axios
      .post(
        `http://localhost:8080/api/appointment/${patientID}/${entity_id}`,
        formData,
      )
      .then((response) => {
        console.log("Data posted:", response.data);
        console.log("response", response);
        if (response.status === 201) {
          // Navigate to another page
          window.location.href = `/allapointments/${entity_id}`;
        }
        // Do something with the response, e.g. show a success message
      })
      .catch((error) => {
        console.error("Error posting data:", error);
        // Handle the error, e.g. show an error message
      });
  };
  const bodyParts = [
    "Back",
    "Heart",
    "Head",
    "Abdomen",
    "Chest",
    "Pelvis",
    "Spine",
    "Shoulder",
    "Neck",
    "Knee",
    "Hip",
    "Arm",
    "Leg",
    "Hand",
    "Foot",
    // Add more body parts here...
  ];
  console.log("form data", formData);

  return (
    <div>
    
    {entity_type === "Lab" && <Sidebar />}
      {entity_type === "Rad" && <SidebarRad />}

      <form
        onSubmit={handleSubmit}
        className="App container"
        style={{ position: "relative", top: "50px", width: 1000 }}
      >
        <div className="row">
          <div className="col-md-6 mb-3">
            <label htmlFor="firstName">Patient ID</label>
            <input
              className="form-control"
              placeholder="ID"
              type="text"
              name="patient_id"
              value={formData.patient_id}
              onChange={handleID}
            />
            {/* {firstNameError && (
              <p className="error" style={{ color: "red" }}>
                {firstNameError}
              </p>
            )} */}
          </div>
          <div className="col md-6 mb-3">
            {entity_type === "Lab" && (
              <>
                <label>Test Type</label>
                <select
                  className="form-control"
                  name="appointment_type"
                  value={formData.appointment_type}
                  onChange={handleTest}
                  noValidate
                >
                  <option value="">Select Test</option>
                  <option value="CBC">CBC</option>
                  <option value="Liver Test">Liver Function Test</option>
                  <option value="Lipid Profile">Lipid Profile</option>
                  <option value="Urine Test">Urine Test</option>
                  <option value="Glucose Test">Glucose Test</option>
                </select>
              </>
            )}
            {entity_type === "Rad" && (
              <div className="row">
                <div className="col md-6">
                  <label>Scan type</label>
                  <select
                    className="form-control "
                    name="appointment_type"
                    value={formData.appointment_type}
                    onChange={handleScanType}
                    noValidate
                  >
                    <option value="">Select Scan</option>
                    <option value="MRI">MRI</option>
                    <option value="CT-Scan">CT-Scan</option>
                    <option value="X-ray">X-ray</option>
                  </select>
                </div>
                <div className="col md-6">
                  <label>Body Part</label>

                  <select
                    className="form-control col md-6"
                    name="appointment_type"
                    value={formData.appointment_type}
                    onChange={handleScanType}
                    noValidate
                  >
                    <label>Body Part</label>

                    <option value="">Select Body Part</option>
                    {bodyParts.map((bodyPart, index) => (
                      <option key={index} value={bodyPart}>
                        {bodyPart}
                      </option>
                    ))}
                  </select>
                </div>
              </div>
            )}
          </div>
        </div>
        <div className="row">
          <div className=" col md-6 mb-3">
            <label htmlFor="dateOfBirth">Appointment Date</label>
            <input
              className="form-control"
              placeholder="MM/DD/YYYY"
              type="date"
              name="appointment_date"
              onChange={handledate}
              value={formData.appointment_date}
              noValidate
            />
          </div>
          <div className="col-md-6 mb-3">
            <div>
              <label>Payment Method</label>
              <select
                className="form-control "
                name="payment_method"
                value={formData.payment_method}
                onChange={handledate}
                noValidate
              >
                <option value="">Select Method</option>
                <option value="Cash">Cash</option>
                <option value="Credit Card">Credit Card</option>
                <option value="Debit Card">Debit Card</option>
              </select>
            </div>
          </div>
          <div className="row">
            <div className="col md-6 mb-3">
              <label htmlFor="phoneNumber">Appointment Status</label>
              <select
                className="form-control"
                placeholder="Status"
                type="tel"
                name="appointment_status"
                value={formData.appointment_status}
                onChange={handledate}
              >
                <option value="">Select Status</option>
                <option value="Done">Done</option>
                <option value="Ongoing">Ongoing</option>
              </select>
            </div>
            <div className="col md-6 mb-3">
              <label htmlFor="phoneNumber">Notes</label>
              <input
                className="form-control"
                placeholder="Notes"
                type="text"
                name="notes"
                value={formData.notes}
                onChange={handleNotes}
              />
            </div>
          </div>
        </div>
        <div className="mb-5">
          <button type="submit" className="submitform">
            Submit
          </button>
        </div>
      </form>
    </div>
  );
}
