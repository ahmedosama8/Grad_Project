import React from 'react';
import AcUnitIcon from '@mui/icons-material/AcUnit';
import BiotechIcon from '@mui/icons-material/Biotech';
import ScienceIcon from '@mui/icons-material/Science';
import LeaderboardIcon from '@mui/icons-material/Leaderboard';

import './sidebarrad.css';

function SidebarRad() {
    return(
      <div className="sidebarrad">
      <div className="sidebarradWrapper">
        <div className="sidebarradMenu">
          <ul className="sidebarradList">
            <li className="sidebarradListItem">
              <a href="/radhome" >
                <BiotechIcon className="sidebarradIcon" />
                Home
              </a>
            </li>
            <li className="sidebarradListItem" >
              <a href="/addscan">
                <ScienceIcon className="sidebarradIcon" />
                Add Scan
              </a>
            </li>
            <li className="sidebarradListItem">
              <a href="/">
                <LeaderboardIcon className="sidebarradIcon" />
                My patients
              </a>
            </li>
            <li className="sidebarradListItem" >
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
export default SidebarRad;