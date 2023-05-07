// import React, { useState, useEffect } from 'react';
// import axios from 'axios'
// import configure from './configure'

// import { 
//   MDBCol, 
//   MDBContainer, 
//   MDBRow, 
//   MDBCard,
//   MDBCardText, 
//   MDBCardBody, 
//   MDBCardImage, 
//   MDBBtn, 
//   MDBBreadcrumb, 
//   MDBBreadcrumbItem, 
//   MDBProgress, 
//   MDBProgressBar,
//   MDBIcon, 
//   MDBListGroup, 
//   MDBListGroupItem
// } from 'mdb-react-ui-kit';
// import { useParams } from 'react-router-dom';

// export default  function PatientInfo() {
//     const [data, setData] = useState([]);
//     const { id } = useParams();

//   useEffect(() => {
//     axios.get(`${configure.backURL}/patient/152`,)
//       .then(response => {
//         setData(response.data);
//       })
      
//       .catch(error => {
//         console.log(error);
//       });
//   }, []);

   
//   return (
//     <section style={{ backgroundColor: '#eee' }}>
//       <MDBContainer className="py-5">
//         <MDBRow>
//           <MDBCol lg="8">
//             <MDBCard className="mb-4">
//               <MDBCardBody>
//                 <MDBRow>
//                   <MDBCol sm="3">
//                     <MDBCardText>Full Name</MDBCardText>
//                   </MDBCol>
//                   <MDBCol sm="9">
//                     <MDBCardText className="text-muted">Johnatan Smith</MDBCardText>
//                   </MDBCol>
//                 </MDBRow>
//                 <hr />
//                 <MDBRow>
//                   <MDBCol sm="3">
//                     <MDBCardText>Email</MDBCardText>
//                   </MDBCol>
//                   <MDBCol sm="9">
//                     <MDBCardText className="text-muted">example@example.com</MDBCardText>
//                   </MDBCol>
//                 </MDBRow>
//                 <hr />
//                 <MDBRow>
//                   <MDBCol sm="3">
//                     <MDBCardText>Phone</MDBCardText>
//                   </MDBCol>
//                   <MDBCol sm="9">
//                     <MDBCardText className="text-muted">(097) 234-5678</MDBCardText>
//                   </MDBCol>
//                 </MDBRow>
//                 <hr />
//                 <MDBRow>
//                   <MDBCol sm="3">
//                     <MDBCardText>Mobile</MDBCardText>
//                   </MDBCol>
//                   <MDBCol sm="9">
//                     <MDBCardText className="text-muted">(098) 765-4321</MDBCardText>
//                   </MDBCol>
//                 </MDBRow>
//                 <hr />
//                 <MDBRow>
//                   <MDBCol sm="3">
//                     <MDBCardText> Patient ID : {id} </MDBCardText>
//                   </MDBCol>
//                   <MDBCol sm="9">
//                     <MDBCardText className="text-muted"></MDBCardText>
//                   </MDBCol>
//                 </MDBRow>
//                 <hr />                
//               </MDBCardBody>
//             </MDBCard>
//            </MDBCol>
//         </MDBRow>
//       </MDBContainer>
//     </section>
//   );
// }