import React from "react";
import AcUnitIcon from "@mui/icons-material/AcUnit";
import BiotechIcon from "@mui/icons-material/Biotech";
import ScienceIcon from "@mui/icons-material/Science";
import PersonIcon from '@mui/icons-material/Person';
import "./sidebarrad.css";
export default function SidebarClinic() {
  return (
    <div className="sidebarrad">
      <div className="sidebarradWrapper">
        <div className="sidebarradMenu">
          <ul className="sidebarradList">
            <li className="sidebarradListItem">
              <a href="/clinichome">
                <BiotechIcon className="sidebarradIcon" />
                Home
              </a>
            </li>
            <li className="sidebarradListItem">
              <a href="/addpatient">
                <PersonIcon  className="sidebarradIcon" />
                Add Pateint
              </a>
            </li>
            <li className="sidebarradListItem">
              <a href="/">
                <ScienceIcon className="sidebarradIcon" />
                Logout
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  );
}
