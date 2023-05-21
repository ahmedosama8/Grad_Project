import React, { useEffect, useState } from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import { DataGrid } from "@mui/x-data-grid";
import { Button } from "@mui/material";
import { Link } from "react-router-dom";
import { Menu, MenuItem } from "@mui/material";
import "./allpatientspage.css";

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
      <Link to={`patientresultpage/${params.value}`}>
        <Button
          variant="outlined"
          size="small"
          color="secondary"
          style={{ color: "#00000098" }}
        >
          View
        </Button>
      </Link>
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
        agePatient={params.row.age}
        patientId={params.row.id}
        row={params.row}
      />
    ),
    headerClassName: "custom-header",
  },
];

function ResultsMenu({ patientId, namePatient, agePatient }) {
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
export default function AllPatientsPage() {
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
