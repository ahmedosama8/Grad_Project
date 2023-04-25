import React from 'react';
import "./LoginPage.css"
import {
  MDBBtn,
  MDBContainer,
  MDBRow,
  MDBCol,
  MDBInput,
  MDBBtnGroup
}

from 'mdb-react-ui-kit';

import { json, useNavigate } from 'react-router-dom';

function LoginPage() {
  const navigate = useNavigate();
  const [password, setPassword] = React.useState('');
  const [email, setEmail] = React.useState('');
  const getPassword = (val)=>{
    setPassword(val.target.value)
  };
  const getEmail = (val)=>{
    setEmail(val.target.value)
  };
  function signIn(){
    if (sessionStorage.getItem('User')=='Lab'){
      navigate('/labhome')} 
    else if (sessionStorage.getItem('User')=='Doctor'){
      navigate('/Clinic')}
    else if (sessionStorage.getItem('User')=='RadCenter'){navigate('/radhome')}
    else(navigate('/'))
  }

function doctor(){
  sessionStorage.setItem('User','Doctor')
}
function lab (){
  sessionStorage.setItem('User','Lab')
}
function Rad_Center(){
  sessionStorage.setItem('User','RadCenter')
}
  
  return (
    <MDBContainer className="my-5 gradient-form">
      <div className='d-flex align-items-center justify-content-center'>

        <MDBCol md='6'>
          <div className="d-flex flex-column ms-8">

            <div className="text-center">
              <img src="https://media.discordapp.net/attachments/795560684120834061/1090738184377348216/loggo.png?width=146&height=142"
                style={{width: '185px'}} alt="logo" />
              <h4 className="mt-1 mb-5 pb-1">We Care</h4>
            </div>

            <p>Please login to your account</p>


            <MDBInput wrapperClass='mb-4' label='Email address' id='email' type='email' onChange={getEmail}></MDBInput>
            
            <MDBInput wrapperClass='mb-4' label='Password' id='password' type='password' onChange={getPassword}></MDBInput>

            <MDBBtnGroup aria-label='Basic example'>
              <MDBBtn onClick={()=>doctor()}>Doctor</MDBBtn>
              <MDBBtn onClick={()=>lab()}>Lab</MDBBtn>
              <MDBBtn onClick={()=>Rad_Center()}>Rad-Center</MDBBtn>
            </MDBBtnGroup>
            <br></br> 

            <div className=" text-center pt-1 mb-5 pb-1">
              <MDBBtn className=" mb-4 w-100 gradient-custom-2" disabled={!email || !password}onClick={()=>signIn() } >Sign in </MDBBtn>
                <a className="text-muted" href="#!">Forgot password?</a>
            </div>


          </div>  

        </MDBCol>
        </div>
        


    </MDBContainer>
  );
}

export default LoginPage;