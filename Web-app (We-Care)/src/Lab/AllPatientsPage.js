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
    field: "patient_id",
    headerName: "Results",
    width: 150,
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
    renderCell: (params) => <ResultsMenu patientId={params.row.patient_id} row={params.row} />,
    headerClassName: "custom-header",
  },
];

function ResultsMenu({ patientId }) {
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
          <Link to={`/cbctest/${patientId}`}>CBC</Link>
        </MenuItem>
        <MenuItem onClick={handleMenuClose}>
          <Link to={`/livertest/${patientId}`}>Liver Function Test</Link>
        </MenuItem>
        <MenuItem onClick={handleMenuClose}>
          <Link to={`/glucosetest/${patientId}`}>Glucose</Link>
        </MenuItem>
        <MenuItem onClick={handleMenuClose}>
          <Link to={`/clinicalchemistry/${patientId}`}>Lipid Profile</Link>
        </MenuItem>
        <MenuItem onClick={handleMenuClose}>
          <Link to={`/urinetest/${patientId}`}>Urine Test </Link>
        </MenuItem>
      </Menu>
    </div>
  );
}
export default function AllPatientsPage() {
  const[rows, setRows] = useState([]);

  useEffect(() => {
    async function fetchRows() {
      const response = await fetch("http://localhost:8080/patient/list");
      const data = await response.json();
      setRows(data);
    }
    fetchRows();
  }, []);
  return (
    <div>
      <Topbar />
      <Sidebar />
      <div>
        <DataGrid
          style={{ position: "relative",top:"20px" }}
          className="customDataGridStyle"
          rows={rows}
          getRowId={(row) => row.patient_id}
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