import React, { useEffect, useState } from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import { DataGrid } from "@mui/x-data-grid";
import { Button } from "@mui/material";
import { Link } from "react-router-dom";
import { Menu, MenuItem } from "@mui/material";
import "./radiologypatients.css";
import { GetUsersMock } from "../BackEndFunctions";
import SidebarRad from "../Sidebar/SidebarRad";

const columns = [
  {
    field: "username",
    headerName: "Name",
    width: 200,
    headerClassName: "custom-header",
  },
  {
    title: "Avatar",
    sortable: false,
    field: "image",
    width: 100,
    headerName: "Image",
    renderCell: (params) => (
      <img
        style={{ width: 36, height: 36, borderRadius: "50%" }}
        src={params.value}
        alt="userimg"
      />
    ),
    headerClassName: "custom-header",
  },
  {
    field: "age",
    headerName: "Age",
    type: "number",
    width: 90,
    headerClassName: "custom-header",
  },
  {
    field: "gender",
    headerName: "Gender",
    width: 120,
    headerClassName: "custom-header",
  },
  {
    field: "birthDate",
    headerName: "Birth Date",
    width: 150,
    headerClassName: "custom-header",
  },
  {
    field: "bloodType",
    headerName: "Blood Type",
    width: 100,
    headerClassName: "custom-header",
  },
  {
    field: "referring_physician",
    headerName: "Referring Dr",
    width: 200,
    headerClassName: "custom-header",
  },
  {
    field: "id",
    headerName: "Results",
    width: 150,
    renderCell: (params) => (
      console.log("params", params.value),
      (
        <Link to={`/patientresultrad/${params.value}`}>
          <Button
            variant="outlined"
            size="small"
            color="secondary"
            style={{ color: "#00000098" }}
          >
            View
          </Button>
        </Link>
      )
    ),
    headerClassName: "custom-header",
  },
  {
    field: "actions",
    headerName: "Tests",
    sortable: false,
    width: 330,
    renderCell: (params) => (
      <ResultsMenu
        namePatient={params.row.name}
        agePatient={params.row.age}
        patientId={params.row.id}
        row={params.row}
      />
    ),
    headerClassName: "custom-header",
  },
];

function ResultsMenu({ patientId, namePatient, agePatient }) {
  return (
    <Link
      to={`/addscan/${patientId}`}
      state={{ name: namePatient, age: agePatient }}
    >
      <Button
        variant="outlined"
        size="small"
        color="secondary"
        style={{ color: "#00000098" }}
      >
        Add Scan
      </Button>
    </Link>
  );
}
export default function RadiologyPatients() {
  const [rows, setRows] = useState([]);

  useEffect(() => {
    async function fetchRows() {
      const response = await fetch("http://localhost:8080/api/patient/list");
      const data = await response.json();
      setRows(data);
    }
    fetchRows();
  }, []);

  console.log("data",rows);
  return (
    <div>
      <Topbar />
      <SidebarRad />
      <div>
        <DataGrid
          style={{ position: "relative", top: "20px" }}
          className="customDataGridStyle"
          rows={rows}
          columns={columns}
          pageSize={5}
          rowsPerPageOptions={[5, 10, 20]}
          disableSelectionOnClick
        />
      </div>
    </div>
  );
}
// export { rows };
