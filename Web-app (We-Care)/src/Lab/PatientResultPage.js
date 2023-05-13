import React, { useState, useEffect } from "react";
import { DataGrid } from "@mui/x-data-grid";
import Sidebar from "../Sidebar/Sidebar";
import Topbar from "../Topbar/Topbar";
import { Link } from "react-router-dom";
import { Button } from "@mui/material";

function RadiologyScans() {
  const [rows, setRows] = useState([]);

  const columns = [
    { field: "testType", headerName: "Test Type", width: 150 },
    { field: "date", headerName: "Date", width: 120 },
    { field: "referringDoctor", headerName: "Referring Doctor", width: 150 },
    { field: "branch", headerName: "Branch", width: 150 },
    { field: "testID", headerName: "Test ID", width: 150 },
    { field: "result", headerName: "Result", width: 300 },
    {
      headerName: "Whole Test",
      width: 140,
      renderCell: (params) => (
        <Link to={`/selected-row/${params.row.id}`}>
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
    },
  ];

  useEffect(() => {
    async function fetchRows() {
      const response = await fetch("http://localhost:3001/medicalLabTests");
      const data = await response.json();
      setRows(data);
    }
    fetchRows();
  }, []);

  return (
    <div>
      <Topbar />
      <Sidebar />
      <div style={{ height: 600, width: "100%" }}>
        <DataGrid
          style={{ position: "relative", top: "20px" }}
          rows={rows}
          columns={columns}
          pageSize={5}
          rowsPerPageOptions={[5, 10, 20]}
        />
      </div>
    </div>
  );
}

export default RadiologyScans;
