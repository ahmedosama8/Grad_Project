import React from "react";
import "./topbar.css";
// import { NotificationsNone } from "@material-ui/icons";

export default function Topbar() {
  return (
    <div className="topbar" id="AdminTopBar">
      <div className="topbarWrapper">
        <div className="topLeft">
          <span className="logo">Self Care</span>
        </div>
        <div className="topRight">
          <div className="topbarIconContainer">
            {/* <NotificationsNone  /> */}
          </div>
          <img
            src="https://media.discordapp.net/attachments/795560684120834061/1090738184377348216/loggo.png?width=146&height=142"
            alt=""
            className="topAvatar"
          />
        </div>
      </div>
    </div>
  );
}
