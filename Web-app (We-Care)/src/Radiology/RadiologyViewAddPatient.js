

import React from "react";
import Topbar from "../Topbar/Topbar";
import { Link } from "react-router-dom";
import PersonIcon from "@mui/icons-material/Person";
import AddIcon from "@mui/icons-material/Add";
import "./radiologyviewaddpatient.css";
import SidebarRad from "../Sidebar/SidebarRad";

export default function RadiologyViewAddPatient() {
  return (
    <div>
      <Topbar />
      <SidebarRad />
      <div className="blocksWrapper">
        <Link to="/newpatient" className="block1">
          <div className="blockContent">
            <h1>Add New Patient  </h1>
            <AddIcon style={{ fontSize: "100px" }} />
          </div>
        </Link>
        <Link to="/radiologypatients" className="block2">
          <div className="blockContent">
            <h1>View Patients For Rad Center</h1>
            <PersonIcon style={{ fontSize: "100px" }} />
          </div>
        </Link>
      </div>
    </div>
  );
}
