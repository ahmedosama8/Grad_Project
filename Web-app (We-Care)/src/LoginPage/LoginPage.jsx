import React, { useState } from "react";
import "./LoginPage.css";
import {
  MDBBtn,
  MDBContainer,
  MDBRow,
  MDBCol,
  MDBInput,
  MDBBtnGroup,
} from "mdb-react-ui-kit";
import { useNavigate, Link } from "react-router-dom";

import { backEndLogIn } from "../BackEndFunctions";

function LoginPage() {
  document.title = "Sign-in / Self-care";

  const navigate = useNavigate();
  const [email, setEmail] = useState("");
  const getPassword = (val) => {
    setPassword(val.target.value);
  };
  const getEmail = (val) => {
    setEmail(val.target.value);
  };
  function signIn() {
    if (sessionStorage.getItem("User") == "Lab") {
      navigate("/labhome");
    } else if (sessionStorage.getItem("User") == "Doctor") {
      navigate("/clinichome");
    } else if (sessionStorage.getItem("User") == "RadCenter") {
      navigate("/radhome");
    } else navigate("/");
  }

  function doctor() {
    sessionStorage.setItem("User", "Doctor");
  }
  function lab() {
    sessionStorage.setItem("User", "Lab");
  }
  function Rad_Center() {
    sessionStorage.setItem("User", "RadCenter");
  }
  const [username, setUsername] = useState("");
  const [name, setname] = useState("");
  const [password, setPassword] = useState("");
  const [entityId, setEntityId] = useState("");

  const handleUsernameChange = (e) => {
    setUsername(e.target.value);
  };

  const handlePasswordChange = (e) => {
    setPassword(e.target.value);
  };

  const handleLogin = async () => {
    if (!username || !password) {
      console.error("Please Enter Username And Passwoord");
      return;
    }
    try {
      const response = await fetch("http://localhost:8080/api/entity/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ username, password }),
      });
      console.log(response);

      if (response.ok) {
        const data = await response.json();
        sessionStorage.setItem("User_type", data.type);
        sessionStorage.setItem("User_id", data.id);


        setEntityId(data.entityId);
        if (data.type == "Lab") {
          navigate("/labhome");
        } else if (data.type == "Rad") {
          navigate("/radhome"); // Redirect to th e home page or perform other actions
        } else {
          navigate("/clinichome");
        }
      } else {
        console.error("Login Failed");
      }
    } catch (error) {
      // Handle network error
      console.error("Network error:", error);
    }
  };
  backEndLogIn();
  return (
    <MDBContainer className="my-5 gradient-form">
      <div className="d-flex align-items-center justify-content-center">
        <MDBCol md="6">
          <div className="d-flex flex-column ms-8">
            <div className="text-center">
              <img
                src="https://media.discordapp.net/attachments/795560684120834061/1090738184377348216/loggo.png?width=146&height=142"
                style={{ width: "185px" }}
                alt="logo"
              />
              <h4 className="mt-1 mb-5 pb-1">We Care</h4>
            </div>

            <p>Please login to your account</p>

            <MDBInput
              wrapperClass="mb-4"
              label="Email address"
              id="email"
              type="email"
              onChange={handleUsernameChange}
            ></MDBInput>

            <MDBInput
              wrapperClass="mb-4"
              label="Password"
              id="password"
              type="password"
              onChange={handlePasswordChange}
            ></MDBInput>

            <MDBBtnGroup aria-label="Basic example">
              <MDBBtn onClick={() => doctor()}>Doctor</MDBBtn>
              <MDBBtn onClick={() => lab()}>Lab</MDBBtn>
              <MDBBtn onClick={() => Rad_Center()}>Rad-Center</MDBBtn>
            </MDBBtnGroup>
            <br></br>

            <div className=" text-center pt-1 mb-5 pb-1">
              <MDBBtn
                className=" mb-4 w-100 gradient-custom-2"
                onClick={handleLogin}
              >
                Sign in{" "}
              </MDBBtn>
            </div>
          </div>
        </MDBCol>
      </div>
    </MDBContainer>
  );
}

export default LoginPage;
