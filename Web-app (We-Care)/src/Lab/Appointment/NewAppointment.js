import React, { useState } from "react";
import axios from "axios";
import "../newpatient.css";
import Topbar from "../../Topbar/Topbar";
import Sidebar from "../../Sidebar/Sidebar";

export default function NewAppointment() {
  const [formData, setFormData] = useState({
    entity_id: sessionStorage.getItem("User_id"),
  });
  const [firstNameError, setFirstNameError] = useState("");
  const [lastnameerror, setLastNameError] = useState("");
  const [passworderror, setPasswordError] = useState("");
  const [phoneNumberError, setPhoneNumberError] = useState("");
  const [Emergency_phoneNumberError, setEmergencyPhoneNumberError] =
    useState("");
  const [emailError, setEmailError] = useState("");
  const [allergieserror, setAlergiesError] = useState("");
  const [nationaliderror, setNationalIDError] = useState("");

  const handleFirstNameChange = (event) => {
    const fieldName = event.target.name;
    const fieldValue = event.target.value;
    setFormData({
      ...formData,
      [fieldName]: event.target.value,
    });
    // if (fieldValue.trim() === "") {
    //   setFirstNameError("Name is required");
    // } else {
    //   setFirstNameError("");
    // }
  };
  const handlePasswordChange = (event) => {
    const fieldName = event.target.name;
    const fieldValue = event.target.value;
    setFormData({
      ...formData,
      [fieldName]: event.target.value,
    });

    if (fieldValue.length < 6) {
      setPasswordError("Password at least 6 digits");
    } else {
      setPasswordError("");
    }
  };
  const handleLastNameChange = (event) => {
    const fieldName = event.target.name;
    const fieldValue = event.target.value;
    setFormData({
      ...formData,
      [fieldName]: event.target.value,
    });

    if (fieldValue.length < 4) {
      setLastNameError("Username must be at least 4 characters long");
    } else {
      setLastNameError("");
    }
  };
  const handleBirthDate = (event) => {
    const fieldName = event.target.name;
    setFormData({
      ...formData,
      [fieldName]: event.target.value,
    });
  };
  const handleAddress = (event) => {
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
  const handleNationalIDNumber = (event) => {
    const fieldName = event.target.name;
    const fieldValue = event.target.value;

    setFormData({
      ...formData,
      [fieldName]: event.target.value,
    });
    if (fieldValue.length !== 14) {
      setNationalIDError("National ID Number Must Be 14 digits");
    } else {
      setNationalIDError("");
    }
  };
  // const handleAllergies=(event)=>{
  //   const fieldName = event.target.name;
  //   const fieldValue = event.target.value;
  //   setFormData({
  //     ...formData,
  //     [fieldName]: event.target.value,
  //   });
  //   if (fieldValue.trim() === "") {
  //     setAlergiesError("Allergies is required, if there is no allergies write none");
  //   } else {
  //     setAlergiesError("");
  //   }
  // }
  const handleBloodType = (event) => {
    const fieldName = event.target.name;
    setFormData({
      ...formData,
      [fieldName]: event.target.value,
    });
  };
  const handleMartialState = (event) => {
    const fieldName = event.target.name;
    setFormData({
      ...formData,
      [fieldName]: event.target.value,
    });
  };
  const handlePhoneNumberChange = (event) => {
    const fieldName = event.target.name;
    const fieldValue = event.target.value;
    setFormData({
      ...formData,
      [fieldName]: event.target.value,
    });

    if (fieldValue.length !== 11) {
      setPhoneNumberError("Phone Number must be exactly 11 digits");
    } else {
      setPhoneNumberError("");
    }
  };
  const handleEmergencyPhoneNumberChange = (event) => {
    const fieldName = event.target.name;
    const fieldValue = event.target.value;
    setFormData({
      ...formData,
      [fieldName]: event.target.value,
    });
    if (fieldValue.length !== 11) {
      setEmergencyPhoneNumberError(
        "Emergency Phone Number must be exactly 11 digits"
      );
    } else {
      setEmergencyPhoneNumberError("");
    }
  };

  const handleScanType = (event) => {
    const fieldName = event.target.name;
    const fieldValue = event.target.value;
    setFormData({
      ...formData,
      [fieldName]: event.target.value,
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
      .post(`http://localhost:8080/api/patient/new`, formData)
      .then((response) => {
        console.log("Data posted:", response.data);
        console.log("response", response);
        if (response.status === 201) {
          // Navigate to another page
          window.location.href = `/allpatientspage`;
        }
        // Do something with the response, e.g. show a success message
      })
      .catch((error) => {
        console.error("Error posting data:", error);
        // Handle the error, e.g. show an error message
      });
  };
  const enity_id = sessionStorage.getItem("User_id");
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
      <Topbar />
      <Sidebar />

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
              onChange={handleFirstNameChange}
            />
            {/* {firstNameError && (
              <p className="error" style={{ color: "red" }}>
                {firstNameError}
              </p>
            )} */}
          </div>
          <div className="col md-6 mb-3">
            {enity_id == 2 && (
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
                  <option value="female">Liver Function Test</option>
                  <option value="Lipid Profile">Lipid Profile</option>
                  <option value="Urine Test">Urine Test</option>
                  <option value="Glucose Test">Glucose Test</option>
                </select>
              </>
            )}
            {enity_id == 1 && (
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
                    <option value="CBC">MRI</option>
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
              //   onChange={handleBirthDate}
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
                //   onChange={handleGender}
                noValidate
              >
                <option value="">Select Method</option>
                <option value="Cash">Cash</option>
                <option value="Credit Card">Credit Card</option>
                <option value="Debit Card">Debit Card</option>
              </select>
              {passworderror && (
                <p className="error" style={{ color: "red" }}>
                  {passworderror}
                </p>
              )}
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
                // onChange={handlePhoneNumberChange}
              >
                <option value="">Select Status</option>
                <option value="Done">Done</option>
                <option value="Credit Card">Ongoing</option>
              </select>

              {/* <option value="Debit Card">Debit Card</option> */}
              {/* {phoneNumberError && (
                <p className="error" style={{ color: "red" }}>
                  {phoneNumberError}
                </p>
              )} */}
            </div>
            {/* <div className="col md-6 mb-3">
              <label htmlFor="emergency_phoneNumber">
                Emergency Phone Number
              </label>
              <input
                className="form-control"
                placeholder="Phone Number"
                type="tel"
                name="emergency_contact"
                value={formData.emergency_contact}
                onChange={handleEmergencyPhoneNumberChange}
              />
              {Emergency_phoneNumberError && (
                <p className="error" style={{ color: "red" }}>
                  {Emergency_phoneNumberError}
                </p>
              )}
            </div> */}
          </div>
        </div>
        {/* <div className="row mb-3">
          <div className="col md-6">
            <label htmlFor="email">Email Address</label>
            <input
              className="form-control"
              placeholder="Email Address"
              type="email"
              name="email"
              value={formData.email}
              onChange={handleEmailChange}
            />
            {emailError && (
              <p className="error" style={{ color: "red" }}>
                {emailError}
              </p>
            )}
          </div>
          <div className="col md-6 mb-3">
            <label htmlFor="gender">Martial State</label>
            <select
              className="form-control"
              name="marital_status"
              value={formData.marital_status}
              onChange={handleMartialState}
              noValidate
            >
              <option value="">Select type</option>
              <option value="Married">Married</option>
              <option value="Single">Single</option>
              <option value="Divorced">Divorced</option>
              <option value="Widowed">Widowed</option>
            </select>
          </div>
        </div> */}

        {/* <div className="mb-3">
          <label htmlFor="medicationsAllergies">
            Medications and Allergies
          </label>
          <textarea
            className="form-control"
            placeholder="Allergies"
            name="allergies"  
            noValidate
          />
        </div> */}
        <div className="mb-5">
          <button type="submit" className="submitform">
            Submit
          </button>
        </div>
      </form>
    </div>
  );
}
