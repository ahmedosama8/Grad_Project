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
function calculateAge(birthdate) {
  const currentDate = new Date();
  const birthdateObj = new Date(birthdate);
  
  // Calculate the age
  let age = currentDate.getFullYear() - birthdateObj.getFullYear();
  const monthDifference = currentDate.getMonth() - birthdateObj.getMonth();
  
  if (monthDifference < 0 || (monthDifference === 0 && currentDate.getDate() < birthdateObj.getDate())) {
    age -= 1;
  }
  
  return age;
}


export default  function PatientInfo() {
 
    const [info, setInfo] = useState([]);
    const { id } = useParams();
    useEffect(() => {
        loadData_patient();
      }, []);
    const loadData_patient = async () => {
        const res = await axios.get(`${configure.backURL}patient/${id}`);
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
                    <MDBCardText className="text-muted">{info?.name}</MDBCardText>
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
                    <MDBCardText>Birthdate</MDBCardText>
                  </MDBCol>
                  <MDBCol sm="9">
                    <MDBCardText className="text-muted">{info?.birth_date}</MDBCardText>
                  </MDBCol>
                </MDBRow>
                <hr/>
                <MDBRow>
                  <MDBCol sm="3">
                    <MDBCardText>My Number</MDBCardText>
                  </MDBCol>
                  <MDBCol sm="9">
                    <MDBCardText className="text-muted">{info?.phone}</MDBCardText>
                  </MDBCol>
                </MDBRow>
                <hr />
                <MDBRow>
                  <MDBCol sm="3">
                    <MDBCardText>Emergency contact</MDBCardText>
                  </MDBCol>
                  <MDBCol sm="9">
                    <MDBCardText className="text-muted">{info?.emergency_contact}</MDBCardText>
                  </MDBCol>
                </MDBRow>
                <hr />
                <MDBRow>
                  <MDBCol sm="3">
                    <MDBCardText>Address</MDBCardText>
                  </MDBCol>
                  <MDBCol sm="9">
                    <MDBCardText className="text-muted">{info?.address}</MDBCardText>
                  </MDBCol>
                </MDBRow>
                <hr />
                <MDBRow>
                  <MDBCol sm="3">
                    <MDBCardText>National ID Number</MDBCardText>
                  </MDBCol>
                  <MDBCol sm="9">
                    <MDBCardText className="text-muted">{info?.national_id_number}</MDBCardText>
                  </MDBCol>
                </MDBRow>
                <hr />
                <MDBRow>
                  <MDBCol sm="3">
                    <MDBCardText>martial status</MDBCardText>
                  </MDBCol>
                  <MDBCol sm="9">
                    <MDBCardText className="text-muted">{info?.marital_status}</MDBCardText>
                  </MDBCol>
                </MDBRow>
                <hr />
                <MDBRow>
                  <MDBCol sm="3">
                    <MDBCardText>Blood Type</MDBCardText>
                  </MDBCol>
                  <MDBCol sm="9">
                    <MDBCardText className="text-muted">{info?.blood_type}</MDBCardText>
                  </MDBCol>
                </MDBRow>
                <hr />
                <MDBRow>
                  <MDBCol sm="3">
                    <MDBCardText>Allergies</MDBCardText>
                  </MDBCol>
                  <MDBCol sm="9">
                    <MDBCardText className="text-muted">{info?.allergies?.replace(/[\[\]"]/g, "").replace(/,/g, ", ")}</MDBCardText>
                  </MDBCol>
                </MDBRow>
                <hr />
                <MDBRow>
                  <MDBCol sm="3">
                    <MDBCardText>Chronic</MDBCardText>
                  </MDBCol>
                  <MDBCol sm="9">
                    <MDBCardText className="text-muted">{info?.chronic?.replace(/[\[\]"]/g, "").replace(/,/g, ", ")}</MDBCardText>
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