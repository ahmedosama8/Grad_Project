import React from "react";
import AcUnitIcon from "@mui/icons-material/AcUnit";
import BiotechIcon from "@mui/icons-material/Biotech";
import ScienceIcon from "@mui/icons-material/Science";
import LeaderboardIcon from "@mui/icons-material/Leaderboard";
import BookIcon from "@mui/icons-material/Book";
import LogoutIcon from '@mui/icons-material/Logout';


import "./sidebarrad.css";

function SidebarRad() {
  const handleLogout = () => {
    // Remove item from sessionStorage
    sessionStorage.removeItem("User");
    sessionStorage.removeItem("User_id");

    sessionStorage.removeItem("User_type");
  };
  return (
    <div className="sidebarrad">
      <div className="sidebarradWrapper">
        <div className="sidebarradMenu">
          <ul className="sidebarradList">
            <li className="sidebarradListItem">
              <a href="/radhome">
                <BiotechIcon className="sidebarradIcon" />
                Home Rad-Center
              </a>
            </li>
            <li className="sidebarradListItem">
              <a href="/radpatientspage">
                <LeaderboardIcon className="sidebarradIcon" />
                My Patients
              </a>
            </li>
            <li className="sidebarradListItem">
              <a href="/appointments">
                <BookIcon className="sidebarradIcon" />
                Appointments
              </a>
            </li>
            <li className="sidebarradListItem">
              <a href="/" onClick={handleLogout}>
              <LogoutIcon className="sidebarradIcon" />
                Logout
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  );
}
export default SidebarRad;
