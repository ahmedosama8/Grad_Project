import React, { useState, useEffect } from "react";
import { DataGrid } from "@mui/x-data-grid";
import Sidebar from "../Sidebar/Sidebar";
import Topbar from "../Topbar/Topbar";
import { Link, useParams } from "react-router-dom";
import { Button } from "@mui/material";
import axios from "axios";
import configure from "../configure";

import "./patientresultpage.css";

function TestResultsTable({}) {
  const [cbctests, setcbcTests] = useState([]);
  const [livertests, setLiverTests] = useState([]);
  const [lipidtests, setLipidTests] = useState([]);
  const [urinetests, setUrineTests] = useState([]);
  const [glucosetests, setGlucoseTests] = useState([]);
  const [searchDate, setSearchDate] = useState("");
  const [searchtesttype, setSearchTestType] = useState("");
  const [searchdoctor, setSearchDoctor] = useState("");
  const testTypes = [
    { id: 1, name: "CBC Test" },
    { id: 2, name: "Lipid Profile Test" },
    { id: 3, name: "Liver Function Test" },
    { id: 4, name: "Urine Test" },
    { id: 5, name: "Glucose Test" },
  ];

  const [selectedTestType, setSelectedTestType] = useState("");

  const { id } = useParams();

  useEffect(() => {
    async function fetchRows() {
      const response = await fetch(`${configure.backURL}cbc/patient/${id}`);
      const data = await response.json();
      setcbcTests(data);
    }
    fetchRows();
  }, []);
  useEffect(() => {
    async function fetchRows() {
      const response = await fetch(`${configure.backURL}liver/patient/${id}`);
      const data = await response.json();
      setLiverTests(data);
    }
    fetchRows();
  }, []);
  useEffect(() => {
    async function fetchRows() {
      const response = await fetch(`${configure.backURL}urine/patient/${id}`);
      const data = await response.json();
      setUrineTests(data);
    }
    fetchRows();
  }, []);
  useEffect(() => {
    async function fetchRows() {
      const response = await fetch(`${configure.backURL}glucose/patient/${id}`);
      const data = await response.json();
      setGlucoseTests(data);
    }
    fetchRows();
  }, []);
  useEffect(() => {
    async function fetchRows() {
      const response = await fetch(`${configure.backURL}lipid/patient/${id}`);
      const data = await response.json();
      setLipidTests(data);
    }
    fetchRows();
  }, []);

  return (
    <div>
      <Topbar />
      <Sidebar />
      <div
        className="App container col-6"
        style={{ position: "relative", top: "50px", width: 1000 }}
      >
        <table className="styled-table">
          <thead>
            <tr>
              <th style={{ textAlign: "center" }}>
                <div className="header-column">
                  <span>Test Type</span>
                  <select
                    value={selectedTestType}
                    style={{ width: "124px" }}
                    onChange={(e) => setSelectedTestType(e.target.value)}
                    className="dropdown-select"
                  >
                    <option value="">All Tests</option>
                    {testTypes.map((type) => (
                      <option key={type.id} value={type.name}>
                        {type.name}
                      </option>
                    ))}
                  </select>
                </div>
              </th>{" "}
              <th>
                <div className="header-column">
                  <span>Examination Date</span>
                  <input
                    type="date"
                    value={searchDate}
                    onChange={(e) => setSearchDate(e.target.value)}
                    className="date-input"
                  />
                </div>
              </th>
              <th style={{ textAlign: "center" }}>
                <div className="header-column">
                  <span>Referring Doctor</span>
                  <input
                    style={{ width: "124px" }}
                    type="text"
                    value={searchdoctor}
                    onChange={(e) => setSearchDoctor(e.target.value)}
                    className="date-input"
                  />
                </div>
              </th>
              <th style={{ textAlign: "center" }}>Comments</th>
              <th style={{ textAlign: "center" }}>Action</th>
              {/* Add other relevant columns as necessary */}
            </tr>
          </thead>
          <tbody>
            {cbctests
              .filter((test) => {
                // Check if the search date is empty or matches the examination date
                return (
                  (searchDate === "" || test.created_at.includes(searchDate)) &&
                  (searchdoctor === "" ||
                    test.referring_doctor.includes(searchdoctor)) &&
                  (selectedTestType === "" || selectedTestType === "CBC Test")
                );
              })
              .map((test) => (
                <tr key={test.id}>
                  <td>CBC Test</td>
                  <td>{test.created_at.slice(0, 10)}</td>
                  <td>{test.referring_doctor}</td>

                  <td>{test.comments}</td>
                  <td>
                    <Link to={`/cbc-page/${test.id}`}>
                      <button className="btn btn-edit">View</button>
                    </Link>
                  </td>
                  {/* Add other relevant columns as necessary */}
                </tr>
              ))}

            {lipidtests
              .filter((test) => {
                // Check if the search date is empty or matches the examination date
                return (
                  (searchDate === "" || test.created_at.includes(searchDate)) &&
                  (searchdoctor === "" ||
                    test.referring_doctor.includes(searchdoctor))&&
                  (selectedTestType === "" || selectedTestType === "Lipid Profile Test")
                );
              })
              .map((test) => (
                <tr key={test.id}>
                  <td>Lipid Profile Test</td>
                  <td>{test.created_at.slice(0, 10)}</td>
                  <td>{test.referring_doctor}</td>

                  <td>{test.comments}</td>
                  <td>
                    <Link to={`/lipid-profile-page/${test.id}`}>
                      <button className="btn btn-edit">View</button>
                    </Link>
                  </td>
                  {/* Add other relevant columns as necessary */}
                </tr>
              ))}
            {livertests
              .filter((test) => {
                // Check if the search date is empty or matches the examination date
                return (
                  (searchDate === "" || test.created_at.includes(searchDate)) &&
                  (searchdoctor === "" ||
                    test.referring_doctor.includes(searchdoctor))&&
                  (selectedTestType === "" || selectedTestType === "Liver Function Test")
                );
              })
              .map((test) => (
                <tr key={test.id}>
                  <td>Liver Function Test</td>
                  <td>{test.created_at.slice(0, 10)}</td>
                  <td>{test.referring_doctor}</td>

                  <td>{test.comments}</td>
                  <td>
                    <Link to={`/liver-page/${test.id}`}>
                      <button className="btn btn-edit">View</button>
                    </Link>
                  </td>
                  {/* Add other relevant columns as necessary */}
                </tr>
              ))}
            {urinetests
              .filter((test) => {
                // Check if the search date is empty or matches the examination date
                return (
                  (searchDate === "" || test.created_at.includes(searchDate)) &&
                  (searchdoctor === "" ||
                    test.referring_doctor.includes(searchdoctor))&&
                  (selectedTestType === "" || selectedTestType === "Urine Test")
                );
              })
              .map((test) => (
                <tr key={test.id}>
                  <td>Urine Test</td>
                  <td>{test.created_at.slice(0, 10)}</td>
                  <td>{test.referring_doctor}</td>

                  <td>{test.comments}</td>
                  <td>
                    <Link to={`/urine-page/${test.id}`}>
                      <button className="btn btn-edit">View</button>
                    </Link>
                  </td>
                  {/* Add other relevant columns as necessary */}
                </tr>
              ))}
            {glucosetests
              .filter((test) => {
                // Check if the search date is empty or matches the examination date
                return (
                  (searchDate === "" || test.created_at.includes(searchDate)) &&
                  (searchdoctor === "" ||
                    test.referring_doctor.includes(searchdoctor))&&
                  (selectedTestType === "" || selectedTestType === "Glucose Test")
                );
              })
              .map((test) => (
                <tr key={test.id}>
                  <td>Glucose Test</td>
                  <td>{test.created_at.slice(0, 10)}</td>
                  <td>{test.referring_doctor}</td>

                  <td>{test.comments}</td>
                  <td>
                    <Link to={`/glucose-page/${test.id}`}>
                      <button className="btn btn-edit">View</button>
                    </Link>
                  </td>
                  {/* Add other relevant columns as necessary */}
                </tr>
              ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default TestResultsTable;
