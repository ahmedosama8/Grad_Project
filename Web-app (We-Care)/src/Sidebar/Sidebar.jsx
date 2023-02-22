import React from 'react';
import "./Sidebar.css";
import AcUnitIcon from '@mui/icons-material/AcUnit';
import './Sidebar.css';

function Sidebar() {
    return(
      <div className="adminsidebar">
      <div className="adminsidebarWrapper">
        <div className="adminsidebarMenu">
          <ul className="adminsidebarList">
            <li className="adminsidebarListItem">
              <a href="/" >
                <AcUnitIcon className="adminsidebarIcon" />
                Admin Home
              </a>
            </li>
            <li className="adminsidebarListItem" >
              <a href="/">
                <AcUnitIcon className="adminsidebarIcon" />
                Statistics
              </a>
            </li>
            <li className="adminsidebarListItem" >
              <a href="/">
                <AcUnitIcon className="adminsidebarIcon" />
                Users
              </a>
            </li>
            <li className="adminsidebarListItem" >
              <a href="/">
                <AcUnitIcon className="adminsidebarIcon" />
                Twitter Home
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
      
    );

}
export default Sidebar;