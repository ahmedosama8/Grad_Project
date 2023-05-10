import React, { useState, useEffect } from "react";
import { DataGrid } from "@mui/x-data-grid";
import Sidebar from "../Sidebar/Sidebar";
import Topbar from "../Topbar/Topbar";
import { Link, useParams } from "react-router-dom";
import { Button } from "@mui/material";
import axios from "axios";

import "./patientresultpage.css";

// function RadiologyScans() {
//   const [rows, setRows] = useState([]);

//   const columns = [
//     { field: "testType", headerName: "Test Type", width: 150 },
//     { field: "date", headerName: "Date", width: 120 },
//     { field: "referringDoctor", headerName: "Referring Doctor", width: 150 },
//     { field: "branch", headerName: "Branch", width: 150 },
//     { field: "testID", headerName: "Test ID", width: 150 },
//     { field: "result", headerName: "Result", width: 300 },
//     {
//       headerName: "Whole Test",
//       width: 140,
//       renderCell: (params) => (
//         <Link to={`/selected-row/${params.row.id}`}>
//           <Button
//             variant="outlined"
//             size="small"
//             color="secondary"
//             style={{ color: "#00000098" }}
//           >
//             View
//           </Button>
//         </Link>
//       ),
//     },
//   ];

//   useEffect(() => {
//     async function fetchRows() {
//       const response = await fetch("http://localhost:3001/medicalLabTests");
//       const data = await response.json();
//       setRows(data);
//     }
//     fetchRows();
//   }, []);

//   return (
//     <div>
//       <Topbar />
//       <Sidebar />
//       <div style={{ height: 600, width: "100%" }}>
//         <DataGrid
//           style={{ position: "relative", top: "20px" }}
//           rows={rows}
//           columns={columns}
//           pageSize={5}
//           rowsPerPageOptions={[5, 10, 20]}
//         />
//       </div>
//     </div>
//   );
// }
// import React, { useState } from "react";
// import Topbar from "../Topbar/Topbar";
// import Sidebar from "../Sidebar/Sidebar";

function TestResultsTable({}) {
  const [cbctests, setcbcTests] = useState([]);
  const [livertests, setLiverTests] = useState([]);
  const [lipidtests, setLipidTests] = useState([]);
  const [urinetests, setUrineTests] = useState([]);
  const [glucosetests, setGlucoseTests] = useState([]);
  const [backendcbc, setCBCBackend] = useState([]);
  const { id } = useParams();


  useEffect(() => {
    async function fetchRows() {
      const response = await fetch(`http://localhost:8080/CBC/patient/${id}`);
      const data = await response.json();
      setcbcTests(data);
    }
    fetchRows();
  }, []);
  useEffect(() => {
    async function fetchRows() {
      const response = await fetch(`http://localhost:8080/LiverFunc/patient/${id}`);
      const data = await response.json();
      setLiverTests(data);
    }
    fetchRows();
  }, []);
  useEffect(() => {
    async function fetchRows() {
      const response = await fetch(`http://localhost:8080/UrineTest/patient/${id}`);
      const data = await response.json();
      setUrineTests(data);
    }
    fetchRows();
  }, []);
  useEffect(() => {
    async function fetchRows() {
      const response = await fetch(`http://localhost:8080/Glucose/patient/${id}`);
      const data = await response.json();
      setGlucoseTests(data);
    }
    fetchRows();
  }, []);
  useEffect(() => {
    async function fetchRows() {
      const response = await fetch(`http://localhost:8080/LipidProfile/patient/${id}`);
      const data = await response.json();
      setLipidTests(data);
    }
    fetchRows();
  }, []);
  // const loadUser = async () => {
  //   const res = await axios.get(`http://localhost:8080/CBC/patient/1`);
  //   setCBCBackend(res.data);
  //   console.log("CBC Backend", res.data);
  // };

  // useEffect(() => {
  //   loadUser();
  // }, []);

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
              <th style={{ textAlign: "center" }}>Test Type</th>
              <th style={{ textAlign: "center" }}>Lab Name</th>
              <th style={{ textAlign: "center" }}>Examination Date</th>
              <th style={{ textAlign: "center" }}>Comments</th>
              <th style={{ textAlign: "center" }}>Action</th>
              {/* Add other relevant columns as necessary */}
            </tr>
          </thead>
          <tbody>
            {cbctests?.map((test) => (
              <tr key={test.cbc_id}>
                <td>CBC Test</td>
                <td>{test.labName}</td>
                <td>{test.examination_Date}</td>
                <td>{test.comments}</td>
                <td>
                  <Link to={`/cbc-page/${test.cbc_id}`}>
                    <button className="btn btn-edit">View</button>
                  </Link>
                </td>
                {/* Add other relevant columns as necessary */}
              </tr>
            ))}

            {lipidtests?.map((test) => (
              <tr key={test.id}>
                <td>Lipid Profile Test</td>
                <td>{test.labName}</td>
                <td>{test.examination_Date}</td>
                <td>{test.comments}</td>
                <td>
                  <Link to={`/lipid-profile-page/${test.id}`}>
                    <button className="btn btn-edit">View</button>
                  </Link>
                </td>
                {/* Add other relevant columns as necessary */}
              </tr>
            ))}
            {livertests?.map((test) => (
              <tr key={test.id}>
                <td>Liver Function Test</td>
                <td>{test.labName}</td>
                <td>{test.examination_Date}</td>
                <td>{test.comments}</td>
                <td>
                  <Link to={`/liver-page/${test.id}`}>
                    <button className="btn btn-edit">View</button>
                  </Link>
                </td>
                {/* Add other relevant columns as necessary */}
              </tr>
            ))}
            {urinetests?.map((test) => (
              <tr key={test.id}>
                <td>Urine Test</td>
                <td>{test.labName}</td>
                <td>{test.examination_Date}</td>
                <td>{test.comments}</td>
                <td>
                  <Link to={`/urine-page/${test.id}`}>
                    <button className="btn btn-edit">View</button>
                  </Link>
                </td>
                {/* Add other relevant columns as necessary */}
              </tr>
            ))}
            {glucosetests?.map((test) => (
              <tr key={test.id}>
                <td>Glucose Test</td>
                <td>{test.labName}</td>
                <td>{test.examination_Date}</td>
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
