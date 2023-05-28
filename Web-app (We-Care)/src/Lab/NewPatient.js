import React, { useState } from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import axios from "axios";
import "./newpatient.css";
import SidebarRad from "../Sidebar/SidebarRad";
import SidebarClinic from "../Sidebar/SidebarClinic";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import configure from "../configure";

export default function NewPatient() {
  const [formData, setFormData] = useState({
    chronic: "No Chronic",
    allergies: "No Allergies",
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
    if (fieldValue.trim() === "") {
      setFirstNameError("Name is required");
    } else {
      setFirstNameError("");
    }
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
  const handleGender = (event) => {
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
  const notify = (message) => {
    toast.error(message, {
      position: toast.POSITION.BOTTOM_CENTER, // Change the position to top-right
      autoClose: 5000, // Close the toast after 5 seconds
      hideProgressBar: true, // Hide the progress bar
      className: "custom-toast", // Apply custom CSS class for styling
      bodyClassName: "custom-toast-body", // Apply custom CSS class for the toast body
    });
  };
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

  const handleEmailChange = (event) => {
    const fieldName = event.target.name;
    const fieldValue = event.target.value;
    setFormData({
      ...formData,
      [fieldName]: event.target.value,
    });
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(fieldValue)) {
      setEmailError("Invalid email address");
    } else {
      setEmailError("");
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const entity_type = sessionStorage.getItem("User_type");
    if (
      firstNameError !== "" ||
      lastnameerror !== "" ||
      phoneNumberError !== "" ||
      Emergency_phoneNumberError !== "" ||
      emailError !== "" ||
      nationaliderror !== "" ||
      !formData.name
    ) {
      notify("Check All inputs Are filled With There Validation");
      return; // Don't submit if there are validation errors
    }
    axios
      .post(`${configure.backURL}patient/new`, formData)
      .then((response) => {
        console.log("Data posted:", response.data);
        console.log("response", response);
        if (response.status === 201 && entity_type === "lab") {
          // Navigate to another page
          window.location.href = `/allpatientspage`;
        } else if (response.status === 201 && entity_type === "rad") {
          window.location.href = `/radpatientspage`;
        } else if (response.status === 201 && entity_type === "clinic") {
          window.location.href = `/clinicpatients`;
        }
        // Do something with the response, e.g. show a success message
      })
      .catch((error) => {
        toast("Error posting data:", error);
        // Handle the error, e.g. show an error message
      });
  };
  console.log("form data", formData);
  const entity_type = sessionStorage.getItem("User_type");

  return (
    <div>
      <Topbar />
      {entity_type === "lab" && <Sidebar />}
      {entity_type === "rad" && <SidebarRad />}
      {entity_type === "clinic" && <SidebarClinic />}

      <form
        onSubmit={handleSubmit}
        className="App container"
        style={{ position: "relative", top: "50px", width: 1000 }}
      >
        <div className="row">
          <div className="col-md-6 mb-3">
            <label htmlFor="firstName">Full Name</label>
            <input
              className="form-control"
              placeholder="Full Name"
              type="text"
              name="name"
              value={formData.name}
              onChange={handleFirstNameChange}
            />
            {firstNameError && (
              <p className="error" style={{ color: "red" }}>
                {firstNameError}
              </p>
            )}
          </div>
          <div className="col-md-6 mb-3">
            <label htmlFor="lastName">Username</label>
            <input
              className="form-control"
              placeholder="username"
              type="text"
              name="username"
              noValidate
              value={formData.username}
              onChange={handleLastNameChange}
            />
            {lastnameerror && (
              <p className="error" style={{ color: "red" }}>
                {lastnameerror}
              </p>
            )}
          </div>
        </div>
        <div className="row">
          <div className=" col md-6 mb-3">
            <label htmlFor="dateOfBirth">Date of Birth</label>
            <input
              className="form-control"
              placeholder="MM/DD/YYYY"
              type="date"
              name="birth_date"
              onChange={handleBirthDate}
              value={formData.birth_date}
              noValidate
            />
          </div>
          <div className="col-md-6 mb-3">
            <div>
              <label htmlFor="email">Password</label>
              <input
                className="form-control"
                placeholder="password"
                name="password"
                type="text"
                noValidate
                value={formData.password}
                onChange={handlePasswordChange}
              />
              {passworderror && (
                <p className="error" style={{ color: "red" }}>
                  {passworderror}
                </p>
              )}
            </div>
          </div>
          <div className="row">
            <div className="col md-6 mb-3">
              <label htmlFor="phoneNumber">Phone Number</label>
              <input
                className="form-control"
                placeholder="Phone Number"
                type="tel"
                name="phone"
                value={formData.phone}
                onChange={handlePhoneNumberChange}
              />
              {phoneNumberError && (
                <p className="error" style={{ color: "red" }}>
                  {phoneNumberError}
                </p>
              )}
            </div>
            <div className="col md-6 mb-3">
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
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col md-6 mb-3">
            <label htmlFor="address">Address</label>
            <input
              className="form-control"
              placeholder="Address"
              type="text"
              name="address"
              value={formData.address}
              onChange={handleAddress}
              noValidate
            />
          </div>
          <div className="col md-6 mb-3">
            <label htmlFor="gender">Gender</label>
            <select
              className="form-control"
              name="gender"
              value={formData.gender}
              onChange={handleGender}
              noValidate
            >
              <option value="">Select gender</option>
              <option value="male">Male</option>
              <option value="female">Female</option>
              <option value="other">Other</option>
            </select>
          </div>
        </div>
        <div className="row">
          <div className="col md-6 mb-3">
            <label htmlFor="address">National ID Number</label>
            <input
              className="form-control"
              placeholder="National_id"
              type="text"
              name="national_id_number"
              value={formData.national_id_number}
              onChange={handleNationalIDNumber}
              noValidate
            />
            {nationaliderror && (
              <p className="error" style={{ color: "red" }}>
                {nationaliderror}
              </p>
            )}
          </div>
          <div className="col md-6 mb-3">
            <label htmlFor="gender">Blood Type</label>
            <select
              className="form-control"
              name="blood_type"
              value={formData.blood_type}
              onChange={handleBloodType}
              noValidate
            >
              <option value="">Select type</option>
              <option value="none">none</option>
              <option value="AB+">AB+</option>
              <option value="AB-">AB-</option>
              <option value="A+">A+</option>
              <option value="A-">A-</option>
              <option value="B+">B+</option>
              <option value="B-">B-</option>
              <option value="O+">O+</option>
              <option value="O-">O-</option>
            </select>
          </div>
        </div>
        <div className="row mb-3">
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
        </div>

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
      <ToastContainer />
    </div>
  );
}
