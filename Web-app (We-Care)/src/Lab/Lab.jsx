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

// function MouseOver(event) {
//   event.target.style.background = "red";
// }
function Lab() {
  return (
    <div>
      <Topbar />
      <Sidebar />
    </div>
  );
}

export default Lab;
