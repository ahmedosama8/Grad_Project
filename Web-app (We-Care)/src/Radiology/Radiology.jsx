import React from 'react';
import {
  MDBBtn,
  MDBContainer,
  MDBRow,
  MDBCol,
  MDBCard,
  MDBCardBody,
  MDBSelect,
  MDBInput,
  MDBCheckbox
}
from 'mdb-react-ui-kit';
import Topbar from '../Topbar/Topbar';
import SidebarRad from '../Sidebar/SidebarRad';

function Radiology() {
  return (
    <div>
   <Topbar/>
   <SidebarRad/>
   <h1>Rad page</h1>
   </div>
  );
}

export default Radiology;