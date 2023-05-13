import React, { useState, useEffect } from 'react';
import axios from 'axios'
import configure from './configure'

import { 
  MDBCol, 
  MDBContainer, 
  MDBRow, 
  MDBCard,
  MDBCardText, 
  MDBCardBody, 
  
} from 'mdb-react-ui-kit';
import { useParams } from 'react-router-dom';

export default  function PatientInfo() {
    const [info, setInfo] = useState([]);
    const { id } = useParams();
    useEffect(() => {
        loadData_patient();
      }, []);
    const loadData_patient = async () => {
        const res = await axios.get(`http://localhost:8080/patient/${id}`);
       //const res = await axios.get(`http://localhost:3001/medicalLabTests/${id}`);
 
       setInfo(res.data);
        console.log(res.data);
      };
   
  return (
    <section style={{ backgroundColor: '#eee' }}>
      <MDBContainer className="py-5">
        <MDBRow>
          <MDBCol lg="8">
            <MDBCard className="mb-4">
              <MDBCardBody>
              <MDBRow>
                  <MDBCol sm="3">
                    <MDBCardText> Patient ID</MDBCardText>
                  </MDBCol>
                  <MDBCol sm="9">
                    <MDBCardText className="text-muted">{id}</MDBCardText>
                  </MDBCol>
                </MDBRow>
                <hr/>
                <MDBRow>
                  <MDBCol sm="3">
                    <MDBCardText>Full Name</MDBCardText>
                  </MDBCol>
                  <MDBCol sm="9">
                    <MDBCardText className="text-muted">{info?.firstName}</MDBCardText>
                  </MDBCol>
                </MDBRow>
                <hr />
                <MDBRow>
                  <MDBCol sm="3">
                    <MDBCardText>Gender</MDBCardText>
                  </MDBCol>
                  <MDBCol sm="9">
                    <MDBCardText className="text-muted">{info?.gender}</MDBCardText>
                  </MDBCol>
                </MDBRow>
                <hr />
                <MDBRow>
                  <MDBCol sm="3">
                    <MDBCardText>Emergency contact</MDBCardText>
                  </MDBCol>
                  <MDBCol sm="9">
                    <MDBCardText className="text-muted">{info?.phone2}</MDBCardText>
                  </MDBCol>
                </MDBRow>
                <hr />
                <MDBRow>
                  <MDBCol sm="3">
                    <MDBCardText>Blood Type</MDBCardText>
                  </MDBCol>
                  <MDBCol sm="9">
                    <MDBCardText className="text-muted">{info?.bloodType}</MDBCardText>
                  </MDBCol>
                </MDBRow>
                          
              </MDBCardBody>
            </MDBCard>
           </MDBCol>
        </MDBRow>
      </MDBContainer>
    </section>
  );
}