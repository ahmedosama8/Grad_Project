import React, { useState } from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import axios from 'axios';

export default function NewPatient() {
  const [name, setName] = useState("");
  const [age, setAge] = useState("");
  const [gender, setGender] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await axios.post("http://localhost:3001/fakeusers", {
        name,
        age,
        gender,
      });

      console.log(response.data); // handle response here
    } catch (error) {
      console.error(error);
    }
  };
  return (
    <div>
      <Topbar />
      <Sidebar />
      
      <form onSubmit={handleSubmit}
        className="App container"
        style={{ position: "relative", top: "50px", width: 1000 }}
      >
        <div className="row">
          <div className="col-md-6 mb-3">
            <label htmlFor="firstName">First Name</label>
            <input
              className="form-control"
              placeholder="First Name"
              type="text"
              name="firstName"
              noValidate
            />
          </div>
          <div className="col-md-6 mb-3">
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
        <div className="row">
          {" "}
          <div className=" col md-6 mb-3">
            <label htmlFor="dateOfBirth">Date of Birth</label>
            <input
              className="form-control"
              placeholder="MM/DD/YYYY"
              type="date"
              name="dateOfBirth"
              noValidate
            />
          </div>
          <div className="col-md-6 mb-3">
            <div>
              <label htmlFor="email">Patient's ID</label>
              <input
                className="form-control"
                placeholder="ID"
                type="number"
                noValidate
              />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col md-6 mb-3">
            <label htmlFor="gender">Gender</label>
            <select className="form-control" name="gender" noValidate>
              <option value="">Select gender</option>
              <option value="male">Male</option>
              <option value="female">Female</option>
              <option value="other">Other</option>
            </select>
          </div>
          <div className="col md-6 mb-3">
            <label htmlFor="phoneNumber">Phone Number</label>
            <input
              className="form-control"
              placeholder="Phone Number"
              type="tel"
              name="phoneNumber"
              noValidate
            />
          </div>
        </div>

        <div className="mb-3">
          <label htmlFor="address">Address</label>
          <input
            className="form-control"
            placeholder="Address"
            type="text"
            name="address"
            noValidate
          />
        </div>

        <div className="mb-3">
          <label htmlFor="email">Email Address</label>
          <input
            className="form-control"
            placeholder="Email Address"
            type="email"
            name="email"
            noValidate
          />
        </div>
        <div className="mb-3">
          <label htmlFor="insurance">Insurance Information</label>
          <textarea
            className="form-control"
            placeholder="Insurance Information"
            name="insurance"
            noValidate
          />
        </div>
        <div className="mb-3">
          <label htmlFor="medicalHistory">Medical History</label>
          <textarea
            className="form-control"
            placeholder="Medical History"
            name="medicalHistory"
            noValidate
          />
        </div>
        <div className="mb-3">
          <label htmlFor="medicationsAllergies">
            Medications and Allergies
          </label>
          <textarea
            className="form-control"
            placeholder="Medications and Allergies"
            name="medicationsAllergies"
            noValidate
          />
        </div>
        <div className="row">
          <div className="col-md-6 mb-3">
            <label htmlFor="emergencyContactName">Emergency Contact Name</label>
            <input
              className="form-control"
              placeholder="Emergency Contact Name"
              type="text"
              name="emergencyContactName"
              noValidate
            />
          </div>
          <div className="col-md-6 mb-3">
            <label htmlFor="emergencyContactPhone">
              Emergency Contact Phone
            </label>
            <input
              className="form-control"
              placeholder="Emergency Contact Phone"
              type="tel"
              name="emergencyContactPhone"
              noValidate
            />
          </div>
        </div>

        <div className="mb-5">
          <button  type="submit">
            Submit
          </button>
        </div>
      </form>
    </div>
  );
}
