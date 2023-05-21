
import React from "react";
import Topbar from "../Topbar/Topbar";
import { Link } from "react-router-dom";
import PersonIcon from "@mui/icons-material/Person";
import AddIcon from "@mui/icons-material/Add";
import "./clinicviewadd.css";
import SidebarRad from "../Sidebar/SidebarRad";
import SidebarClinic from "../Sidebar/SidebarClinic";

export default function ClinicViewAdd() {
  return (
    <div>
      <Topbar />
      <SidebarClinic />
      <div className="blocksWrapper">
        <Link to="/newpatient" className="block1">
          <div className="blockContent">
            <h1>Add New Patient <br/>For Clinic </h1>
            <AddIcon style={{ fontSize: "100px" }} />
          </div>
        </Link>
        <Link to="/clinicpatients" className="block2">
          <div className="blockContent">
            <h1>View Patients<br/>For Clinic</h1>
            <PersonIcon style={{ fontSize: "100px" }} />
          </div>
        </Link>
      </div>
    </div>
  );
}
