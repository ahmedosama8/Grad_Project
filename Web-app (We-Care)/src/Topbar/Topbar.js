import React from "react";
import "./topbar.css";
// import { NotificationsNone } from "@material-ui/icons";

export default function Topbar() {
  return (
    <div className="topbar" id="AdminTopBar">
      <div className="topbarWrapper">
        <div className="topLeft">
          <span className="logo">We-Care</span>
        </div>
        <div className="topRight">
          <div className="topbarIconContainer">
            {/* <NotificationsNone  /> */}
          </div>
          <img src="https://cdn-icons-png.flaticon.com/512/9379/9379978.png" alt="" className="topAvatar" />
        </div>
      </div>
    </div>
  );
}
