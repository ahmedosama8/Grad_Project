import React from "react";
import "./Sidebar.css";
import AcUnitIcon from "@mui/icons-material/AcUnit";
import BiotechIcon from "@mui/icons-material/Biotech";
import ScienceIcon from "@mui/icons-material/Science";
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
            <li className="adminsidebarListItem">
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
          </ul>
        </div>
      </div>
    </div>
  );
}
export default Sidebar;
