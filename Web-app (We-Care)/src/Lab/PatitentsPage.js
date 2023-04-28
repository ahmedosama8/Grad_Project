import React from "react";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import { Link } from "react-router-dom";
import PersonIcon from "@mui/icons-material/Person";
import AddIcon from "@mui/icons-material/Add";
import "./patientspage.css";

export default function PatitentsPage() {
  return (
    <div>
      <Topbar />
      <Sidebar />
      <div className="blocksWrapper">
        <Link to="/" className="block1">
          <div className="blockContent">
            <h1>Add New Patient</h1>
            <AddIcon style={{ fontSize: "100px" }} />
          </div>
        </Link>
        <Link to="/allpatientspage" className="block2">
          <div className="blockContent">
            <h1>View Patients</h1>
            <PersonIcon style={{ fontSize: "100px" }} />
          </div>
        </Link>
      </div>
    </div>
  );
}
