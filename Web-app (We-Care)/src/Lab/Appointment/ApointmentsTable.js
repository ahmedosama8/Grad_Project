import React, { useEffect, useState } from "react";
import { DataGrid } from "@mui/x-data-grid";
import { Button } from "@mui/material";
import { Link } from "react-router-dom";
import { Menu, MenuItem } from "@mui/material";
import "../allpatientspage.css";
import Topbar from "../../Topbar/Topbar";
import Sidebar from "../../Sidebar/Sidebar";
import SidebarRad from "../../Sidebar/SidebarRad";
import SidebarClinic from "../../Sidebar/SidebarClinic";
import configure from "../../configure";
const columns = [
  {
    field: "patient_id",
    headerName: "Patient ID",
    width: 150,
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
    field: "notes",
    headerName: "Notes",
    width: 130,
    headerClassName: "custom-header",
  },
  {
    field: "payment_method",
    headerName: "Payment Method",
    width: 160.2,
    headerClassName: "custom-header",
  },
];

export default function ApointmentsTable() {
  const [rows, setRows] = useState([]);
  const id = sessionStorage.getItem("User_id");
  const entity_type = sessionStorage.getItem("User_type");

  useEffect(() => {
    async function fetchRows() {
      const response = await fetch(
        `${configure.backURL}entity/${id}/appointments`
      );
      const data = await response.json();
      setRows(data);
    }
    fetchRows();
  }, []);

  console.log("appointments", rows);

  return (
    <div>
      <Topbar />
      <div style={{ display: "flex" }}>
        {entity_type === "lab" && <Sidebar />}
        {entity_type === "rad" && <SidebarRad />}
        {entity_type === "clinic" && <SidebarClinic />}

        <div
          style={{
            flex: 1,
            display: "flex",
            justifyContent: "center",
            alignItems: "center",
          }}
        >
          <div style={{ maxWidth: "1251.8px", width: "100%" }}>
            {" "}
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
    </div>
  );
}
// export { rows };
