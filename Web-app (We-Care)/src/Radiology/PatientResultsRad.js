import React, { useState, useEffect } from "react";
import Topbar from "../Topbar/Topbar";
import { Link, useParams } from "react-router-dom";
import { Button } from "@mui/material";
import axios from "axios";

import "./patientresultrad.css";
import SidebarRad from "../Sidebar/SidebarRad";

function PatietnResultRad({}) {
  const [radscans, setRadScans] = useState([]);
  const { id } = useParams();

  useEffect(() => {
    async function fetchRows() {
      const response = await fetch(
        `http://localhost:8080/api/radiology/patient/${id}`
      );
      const data = await response.json();
      setRadScans(data);
    }
    fetchRows();
  }, []);
  return (
    <div>
      <Topbar />
      <SidebarRad />
      <div
        className="App container col-6"
        style={{ position: "relative", top: "50px", width: 1000 }}
      >
        <table className="styled-table">
          <thead>
            <tr>
              <th style={{ textAlign: "center" }}>Scan Type</th>
              <th style={{ textAlign: "center" }}>Referring Doctor</th>
              <th style={{ textAlign: "center" }}>Examination Date</th>
              <th style={{ textAlign: "center" }}>Examination Part</th>
              <th style={{ textAlign: "center" }}>Comments  </th>

              <th style={{ textAlign: "center" }}>Action</th>
              {/* Add other relevant columns as necessary */}
            </tr>
          </thead>
          <tbody>
            {radscans?.map((test) => (
              <tr key={test.id}>
                <td>{test.name}</td>
                <td>{test.performer}</td>
                <td>{test.created_at.slice(0, 10)}</td>
                <td>{test.examined_part}</td>
                <td>{test.comments}</td>

                <td>
                  <Link to={`/wholereport/${test.id}`}>
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

export default PatietnResultRad;
