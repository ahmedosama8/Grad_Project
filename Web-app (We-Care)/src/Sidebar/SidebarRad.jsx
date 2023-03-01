import React from 'react';
import "./SidebarRad.css";
import AcUnitIcon from '@mui/icons-material/AcUnit';
import BiotechIcon from '@mui/icons-material/Biotech';
import ScienceIcon from '@mui/icons-material/Science';
import './SidebarRad.css';

function SidebarRad() {
    return(
      <div className="adminsidebar">
      <div className="adminsidebarWrapper">
        <div className="adminsidebarMenu">
          <ul className="adminsidebarList">
            <li className="adminsidebarListItem">
              <a href="/" >
                <BiotechIcon className="adminsidebarIcon" />
                Home
              </a>
            </li>
            <li className="adminsidebarListItem" >
              <a href="/">
                <ScienceIcon className="adminsidebarIcon" />
                Add Scan
              </a>
            </li>
            <li className="adminsidebarListItem" >
              <a href="/">
                <ScienceIcon className="adminsidebarIcon" />
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