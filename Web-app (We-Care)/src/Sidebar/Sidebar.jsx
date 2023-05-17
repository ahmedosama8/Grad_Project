import React from "react";
import "./Sidebar.css";
import BiotechIcon from "@mui/icons-material/Biotech";
import ScienceIcon from "@mui/icons-material/Science";
import LeaderboardIcon from '@mui/icons-material/Leaderboard';
import LogoutIcon from '@mui/icons-material/Logout';
import BookIcon from '@mui/icons-material/Book';

import "./Sidebar.css";

function Sidebar() {
  const handleLogout = () => {
    // Remove item from sessionStorage
    sessionStorage.removeItem("User");
    sessionStorage.removeItem("User_id");
  };
  return (
    <div className="adminsidebar">
      <div className="adminsidebarWrapper">
        <div className="adminsidebarMenu">
          <ul className="adminsidebarList">
            <li className="adminsidebarListItem">
              <a href="/labhome">
                <BiotechIcon className="adminsidebarIcon" />
                Home
              </a>
            </li>
            <li className="sidebarradListItem">
              <a href="/patientspage">
                <LeaderboardIcon className="sidebarradIcon" />
                My patients
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
export default Sidebar;
