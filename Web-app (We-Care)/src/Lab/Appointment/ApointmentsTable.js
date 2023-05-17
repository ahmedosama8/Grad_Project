import React, { useEffect, useState } from "react";
import { DataGrid } from "@mui/x-data-grid";
import { Button } from "@mui/material";
import { Link } from "react-router-dom";
import { Menu, MenuItem } from "@mui/material";
import "../allpatientspage.css";
import Topbar from "../../Topbar/Topbar";
import Sidebar from "../../Sidebar/Sidebar";

const columns = [
  {
    field: "patient_id",
    headerName: "Patient ID",
    width: 200,
    headerClassName: "custom-header",
  },
  {
    field: "appointment_type",
    headerName: "Appoinment Type",
    width: 180,
    headerClassName: "custom-header",
  },
  {
    field: "appointment_status",
    headerName: "Appointment Status",
    width: 180,
    headerClassName: "custom-header",
  },
  {
    field: "appointment_date",
    headerName: " Appointment Date",
    width: 180,
    headerClassName: "custom-header",
  },
  {
    field: "price",
    headerName: "Price",
    width: 100,
    headerClassName: "custom-header",

  },
  {
    field: "id",
    headerName: "Results",
    width: 110,
    renderCell: (params) => (
      <Link to={`patientresultpage/${params.value}`}>
        <Button
          variant="outlined"
          size="small"
          color="secondary"
          style={{ color: "#00000098" }}
        >
          Add
        </Button>
      </Link>
    ),
    headerClassName: "custom-header",
  },
//   {
//     field: "actions",
//     headerName: "Tests",
//     sortable: false,
//     width: 120,
//     renderCell: (params) => (
//       <ResultsMenu
//         namePatient={params.row.name}
//         agePatient={params.row.age}
//         patientId={params.row.patient_id}
//         row={params.row}
//       />
//     ),
//     headerClassName: "custom-header",
//   },
];

function ResultsMenu({ patientId, namePatient, agePatient }) {
  const [data, setData] = useState({ namePatient: "mahmoud" });
  const [anchorEl, setAnchorEl] = useState(null);

  const handleMenuClick = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleMenuClose = () => {
    setAnchorEl(null);
  };

  return (
    <div>
      <Button
        variant="outlined"
        size="small"
        style={{ color: "#00000098" }}
        color="secondary"
        onClick={handleMenuClick}
      >
        Add Test
      </Button>
      <Menu
        anchorEl={anchorEl}
        open={Boolean(anchorEl)}
        onClose={handleMenuClose}
      >
        <MenuItem onClick={handleMenuClose}>
          <Link
            to={`/cbctest/${patientId}`}
            state={{ name: namePatient, age: agePatient }}
          >
            CBC
          </Link>
        </MenuItem>
        <MenuItem onClick={handleMenuClose}>
          <Link
            to={`/livertest/${patientId}`}
            state={{ name: namePatient, age: agePatient }}
          >
            Liver Function Test
          </Link>
        </MenuItem>
        <MenuItem onClick={handleMenuClose}>
          <Link
            to={`/glucosetest/${patientId}`}
            state={{ name: namePatient, age: agePatient }}
          >
            Glucose
          </Link>
        </MenuItem>
        <MenuItem onClick={handleMenuClose}>
          <Link
            to={`/clinicalchemistry/${patientId}`}
            state={{ name: namePatient, age: agePatient }}
          >
            Lipid Profile
          </Link>
        </MenuItem>
        <MenuItem onClick={handleMenuClose}>
          <Link
            to={`/urinetest/${patientId}`}
            state={{ name: namePatient, age: agePatient }}
          >
            Urine Test{" "}
          </Link>
        </MenuItem>
      </Menu>
    </div>
  );
}
export default function ApointmentsTable() {
  const [rows, setRows] = useState([]);
  const id=sessionStorage.getItem("User_id")

  useEffect(() => {
    async function fetchRows() {
      const response = await fetch(`http://localhost:8080/api/entity/${id}/appointments`);
      const data = await response.json();
      setRows(data);
    }
    fetchRows();
  }, []);

  console.log("appointments",rows)

  return (
    <div>
      <Topbar />
      <div style={{ display: "flex" }}>
        <Sidebar />
        <div
          style={{
            flex: 1,
            display: "flex",
            justifyContent: "center",
            alignItems: "center",
          }}
        >
          <DataGrid
            rows={rows}
            columns={columns}
            pageSize={5}
            rowsPerPageOptions={[5, 10, 20]}
            disableSelectionOnClick
          />
        </div>
      </div>
    </div>
  );
}
// export { rows };
