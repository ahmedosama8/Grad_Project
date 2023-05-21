
import React, { useEffect, useState } from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import { DataGrid } from "@mui/x-data-grid";
import { Button } from "@mui/material";
import { Link } from "react-router-dom";
import { Menu, MenuItem } from "@mui/material";
import { GetUsersMock } from "../BackEndFunctions";
import SidebarRad from "../Sidebar/SidebarRad";
import SidebarClinic from "../Sidebar/SidebarClinic";

const columns = [
  {
    field: "name",
    headerName: "Name",
    width: 200,
    headerClassName: "custom-header",
  },
  {
    field: "username",
    headerName: "Username",
    width: 120,
    headerClassName: "custom-header",
  },
  {
    field: "phone",
    headerName: "Phone Number",
    width: 180,
    headerClassName: "custom-header",
  },
  {
    field: "emergency_contact",
    headerName: " Emergency Phone Number",
    width: 180,
    headerClassName: "custom-header",
  },
  {
    field: "gender",
    headerName: "Gender",
    width: 100,
    headerClassName: "custom-header",
  },
  {
    field: "birth_date",
    headerName: "Birth Date",
    width: 150,
    headerClassName: "custom-header",
  },
  {
    field: "blood_type",
    headerName: "Blood Type",
    width: 100,
    headerClassName: "custom-header",
  },
  {
    field: "id",
    headerName: "Results",
    width: 110,
    renderCell: (params) => (
      (
        <Link to={`/allvisits/${params.value}`}>
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
    width: 120,
    renderCell: (params) => (
      <ResultsMenu
        namePatient={params.row.name}
        birthDatePatient={params.row.birth_date}
        patientId={params.row.id}
        row={params.row}
      />
    ),
    headerClassName: "custom-header",
  },
];

function ResultsMenu({ patientId, namePatient, birthDatePatient }) {
  return (
    <Link
      to={`/addpatient/${patientId}`}
      state={{ name: namePatient, birthDate: birthDatePatient }}
    >
      <Button
        variant="outlined"
        size="small"
        color="secondary"
        style={{ color: "#00000098" }}
      >
        Add Visit
      </Button>
    </Link>
  );
}
export default function AllPatientsClinic() {
  const [rows, setRows] = useState([]);
  const entity_id = sessionStorage.getItem("User_id");

  useEffect(() => {
    async function fetchRows() {
      const response = await fetch(
        `http://localhost:8080/api/entity/${entity_id}/patients/list`
      );
      const data = await response.json();
      setRows(data);
    }
    fetchRows();
  }, []);

  console.log("data", rows);
  return (
    <div>
      <Topbar />
      <SidebarClinic />
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
