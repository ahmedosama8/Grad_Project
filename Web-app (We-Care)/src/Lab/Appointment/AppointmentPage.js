
import React from "react";

import { Link } from "react-router-dom";
import PersonIcon from "@mui/icons-material/Person";
import AddIcon from "@mui/icons-material/Add";
import Topbar from "../../Topbar/Topbar";
import Sidebar from "../../Sidebar/Sidebar";
import AccessTimeOutlinedIcon from '@mui/icons-material/AccessTimeOutlined';

export default function AppointmentPage() {
  return (
    <div>
      <Topbar />
      <Sidebar />
      <div className="blocksWrapper">
        <Link to="/addappointment" className="block1">
          <div className="blockContent">
            <h1>Add New Appointment</h1>
            <AddIcon style={{ fontSize: "100px" }} />
          </div>
        </Link>
        <Link to="/allapointments" className="block2">
          <div className="blockContent">
            <h1>View Appointments</h1>
            <AccessTimeOutlinedIcon style={{ fontSize: "100px" }} />
          </div>
        </Link>
      </div>
    </div>
  );
}
