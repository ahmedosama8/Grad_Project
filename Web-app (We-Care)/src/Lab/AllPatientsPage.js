import React, { useEffect, useState } from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import { DataGrid } from "@mui/x-data-grid";
import { Button } from "@mui/material";
import { Link } from "react-router-dom";
import "./allpatientspage.css";

const columns = [
  {
    field: "id",
    headerName: "ID",
    width: 90,
    headerClassName: "custom-header",
  },
  {
    field: "name",
    headerName: "Name",
    width: 200,
    headerClassName: "custom-header",
  },
  {
    title: "Avatar",
    sortable: false,
    field: "image",
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
    field: "last_test_date",
    headerName: "Last Visit Date",
    width: 200,
    headerClassName: "custom-header",
  },
  {
    field: "status",
    headerName: "Status",
    width: 150,
    headerClassName: "custom-header",
  },
  {
    field: "referring_physician",
    headerName: "Referring Dr",
    width: 200,
    headerClassName: "custom-header",
  },

  {
    field: "Results",
    headerName: "Results",
    width: 150,
    renderCell: (params) => (
      <Link to={`patientresultpage`}>
        <Button
          variant="outlined"
          size="small"
          color="secondary"
          onClick={() => console.log(`Selected patient ID: ${params.row.id}`)}
        >
          View
        </Button>
      </Link>
    ),
    headerClassName: "custom-header",
  },
];

export default function AllPatientsPage() {
  const [rows, setRows] = useState([]);

  useEffect(() => {
    async function fetchRows() {
      const response = await fetch("http://localhost:3002/fakeusers");
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
          style={{ position: "relative", bottom: "720px" }}
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
