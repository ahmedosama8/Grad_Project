import React, { useState, useEffect } from "react";
import Topbar from "../Topbar/Topbar";
import { Link, useParams } from "react-router-dom";

import SidebarClinic from "../Sidebar/SidebarClinic";

function AllVisitsTable({}) {
  const [visits, setVisits] = useState([]);
  const entity_id = sessionStorage.getItem("User_id");
  const { id } = useParams();

  useEffect(() => {
    async function fetchRows() {
      const response = await fetch(
        `http://localhost:8080/api/visit/${entity_id}/${id}`
      );
      const data = await response.json();
      setVisits(data);
    }
    fetchRows();
  }, []);
  console.log("Visits",visits)
  
  return (
    <div>
      <Topbar />
      <SidebarClinic/>

      <div
        className="App container col-6"
        style={{ position: "relative", top: "50px", width: 1000 }}
      >
        <table className="styled-table">
          <thead>
            <tr>
              <th style={{ textAlign: "center" }}>Patient ID</th>
              <th style={{ textAlign: "center" }}>Referring Doctor</th>
              <th style={{ textAlign: "center" }}>Examination Date</th>
              <th style={{ textAlign: "center" }}>Medications </th>



              <th style={{ textAlign: "center" }}>Action</th>
              {/* Add other relevant columns as necessary */}
            </tr>
          </thead>
          <tbody>
            {visits?.map((test) => (
              <tr key={test.id}>
                <td>{test.patient_id}</td>
                <td>{test.performer}</td>
                <td>{test.created_at?.slice(0, 10)}</td>
                <td>{test.medications.length > 0 ? test.medications :""}</td>


                <td>
                  <Link to={`/visitresult/${test.id}`}>
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

export default AllVisitsTable;