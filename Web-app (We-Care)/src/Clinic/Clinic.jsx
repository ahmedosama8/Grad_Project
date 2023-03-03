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
import Sidebar from "../Sidebar/Sidebar";
import Topbar from "../Topbar/Topbar";
import SidebarClinic from "../Sidebar/SidebarClinic";
function Clinic() {
  return (
    <div>
      <Topbar />

      <SidebarClinic />
      <div
        className="App container"
        style={{ position: "relative", bottom: 700, width: 1000 }}
      >
        <div class="row">
          <div class="col-lg-6">
            <h1 class="Header">
              Meet Our Project For HealthCare Sector In Egypt .
            </h1>
            <button type="button" class="btn btn-dark btn-lg download-button">
              <i class="fa-brands fa-apple"></i> Download
            </button>
            <button
              type="button"
              class="btn btn-outline-secondary btn-lg download-button"
            >
              <i class="fa-brands fa-google-play"></i> Download
            </button>
          </div>
          <div class="col-lg-6">
            <img
              class="title-img"
              src="https://thumbs.dreamstime.com/b/medicine-doctor-holding-red-heart-shape-hand-medical-icon-network-connection-modern-virtual-screen-interface-service-mind-99681240.jpg"
              alt="iphone-mockup"
            />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Clinic;
