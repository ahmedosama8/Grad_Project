import React from "react";
import "./Sidebar.css";
import BiotechIcon from "@mui/icons-material/Biotech";
import ScienceIcon from "@mui/icons-material/Science";
import LeaderboardIcon from '@mui/icons-material/Leaderboard';
import LogoutIcon from '@mui/icons-material/Logout';

import "./Sidebar.css";

function Sidebar() {
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
            {/* <li className="adminsidebarListItem">
              <a href="/cbctest">
                <ScienceIcon className="adminsidebarIcon" />
                CBC
              </a>
            </li>
            <li className="adminsidebarListItem">
              <a href="/glucosetest">
                <ScienceIcon className="adminsidebarIcon" />
                Glucose
              </a>
            </li>
            <li className="adminsidebarListItem">
              <a href="/livertest">
                <ScienceIcon className="adminsidebarIcon" />
                Liver Function Test
              </a>
            </li>
            <li className="adminsidebarListItem">
              <a href="/clinicalchemistry">
                <ScienceIcon className="adminsidebarIcon" />
                Lipid Profile
              </a>
            </li> */}
            <li className="sidebarradListItem">
              <a href="/patientspage">
                <LeaderboardIcon className="sidebarradIcon" />
                My patients
              </a>
            </li>
            <li className="sidebarradListItem">
              <a href="/">
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
