import React, { useState, useEffect } from "react";
import Topbar from "../Topbar/Topbar";
import { Link, useParams } from "react-router-dom";

import "./patientresultrad.css";
import SidebarRad from "../Sidebar/SidebarRad";
import Sidebar from "../Sidebar/Sidebar";
import configure from "../configure";

function PatietnResultRad({}) {
  const [radscans, setRadScans] = useState([]);
  const entity_type = sessionStorage.getItem("User_type");
  const { id } = useParams();
  const [searchDate, setSearchDate] = useState("");
  const [searchscantype, setSearchScanType] = useState("");
  const [searchscanpart, setSearchScanPart] = useState("");
  const [searchdoctor, setSearchDoctor] = useState("");

  useEffect(() => {
    async function fetchRows() {
      const response = await fetch(
        `${configure.backURL}radiology/patient/${id}`
      );
      const data = await response.json();
      setRadScans(data);
    }
    fetchRows();
  }, []);
  return (
    <div>
      <Topbar />
      {entity_type === "Lab" && <Sidebar />}
      {entity_type === "Rad" && <SidebarRad />}
      <SidebarRad />
      <div
        className="App container col-6"
        style={{ position: "relative", top: "50px", width: 1000 }}
      >
        <table className="styled-table">
          <thead>
            <tr>
              <th style={{ textAlign: "center" }}>
                <div className="header-column">
                  <span>Scan Type</span>
                  <input
                    style={{ width: "124px" }}
                    type="text"
                    value={searchscantype}
                    onChange={(e) => setSearchScanType(e.target.value)}
                    className="date-input"
                  />
                </div>
              </th>
              <th style={{ textAlign: "center" }}>
                <div className="header-column">
                  <span>Referring Doctor</span>
                  <input
                    type="text"
                    style={{ width: "124px" }}

                    value={searchdoctor}
                    onChange={(e) => setSearchDoctor(e.target.value)}
                    className="date-input"
                  />
                </div>{" "}
              </th>
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
                  <span>Examination Part</span>
                  <input
                    style={{ width: "124px" }}
                    type="text"
                    value={searchscanpart}
                    onChange={(e) => setSearchScanPart(e.target.value)}
                    className="date-input"
                  />
                </div>
              </th>
              <th style={{ textAlign: "center" }} className="header-column">
                Comments{" "}
              </th>
              <th style={{ textAlign: "center" }} >Action</th>
              {/* Add other relevant columns as necessary */}
            </tr>
          </thead>
          <tbody>
            {radscans
              .filter((test) => {
                // Check if the search date is empty or matches the examination date
                return (
                  (searchDate === "" || test.created_at.includes(searchDate)) &&
                  (searchscantype === "" ||
                    test.name.includes(searchscantype)) &&
                  (searchscanpart === "" ||
                    test.examined_part.includes(searchscanpart)) &&
                  (searchdoctor === "" ||
                    test.performer.includes(searchdoctor))
                );
              })
              .map((test) => (
                // ... rest of the code
                <tr key={test.id}>
                  <td>{test.name}</td>
                  <td>{test.performer}</td>
                  <td>{test.created_at.slice(0, 10)}</td>
                  <td>{test.examined_part}</td>
                  <td>{test.comments}</td>

                  <td>
                    <Link to={`/wholereport/${test.id}`}>
                      <button className="btn btn-edit ">View</button>
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

export default PatietnResultRad;
