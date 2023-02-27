import React from "react";
import {
  MDBBtn,
  MDBContainer,
  MDBRow,
  MDBCol,
  MDBCard,
  MDBCardBody,
  MDBSelect,
  MDBInput,
  MDBCheckbox,
} from "mdb-react-ui-kit";
import Topbar from "../Topbar/Topbar";
import Sidebar from "../Sidebar/Sidebar";
import "./lab.css";

// function MouseOver(event) {
//   event.target.style.background = "red";
// }
function Lab() {
  return (
    <div>
      <Topbar />
      <Sidebar />
      <div className="labhead" > <h2>We-Care</h2></div>
    </div>
  );
}

export default Lab;
