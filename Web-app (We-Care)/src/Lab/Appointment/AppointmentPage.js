import React from "react";

import { Link } from "react-router-dom";
import PersonIcon from "@mui/icons-material/Person";
import AddIcon from "@mui/icons-material/Add";
import Topbar from "../../Topbar/Topbar";
import Sidebar from "../../Sidebar/Sidebar";
import AccessTimeOutlinedIcon from "@mui/icons-material/AccessTimeOutlined";
import SidebarRad from "../../Sidebar/SidebarRad";

export default function AppointmentPage() {
  const entity_id = sessionStorage.getItem("User_id");
  const entity_type = sessionStorage.getItem("User_type");


  return (
    <div>
    
    {entity_type === "Lab" && <Sidebar />}
      {entity_type === "Rad" && <SidebarRad />}
      <div className="blocksWrapper">
        <Link to="/addappointment" className="block1">
          <div className="blockContent">
            <h1>Add New Appointment</h1>
            <AddIcon style={{ fontSize: "100px" }} />
          </div>
        </Link>
        <Link to={`/allapointments/${entity_id}`} className="block2">
          <div className="blockContent">
            <h1>View Appointments</h1>
            <AccessTimeOutlinedIcon style={{ fontSize: "100px" }} />
          </div>
        </Link>
      </div>
    </div>
  );
}
