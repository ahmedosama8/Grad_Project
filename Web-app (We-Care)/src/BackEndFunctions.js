import axios from "axios";
import { useEffect } from "react";
import React from "react";
import configure from './configure'


export const urinedata = [
  {
    name: "Color",
    Attribute: "color",
    unit: "",
    range: "Amber yellow",
  },
  {
    name: "Clarity",
    Attribute: "clarity",
    unit: "",
    range: "Clear",
  },
  {
    name: "Specific Gravity",
    Attribute: "specific_gravity",
    unit: "",
    range: "1015 - 1025",
  },
  {
    name: "PH",
    Attribute: "ph",
    unit: "",
    range: "4.5 - 6.5",
  },
  {
    name: "Protein",
    Attribute: "protein",
    unit: "",
    range: "Negative",
  },
  {
    name: "Glucose",
    Attribute: "glucose",
    unit: "",
    range: "Negative",
  },
  {
    name: "Ketone",
    Attribute: "ketone",
    unit: "",
    range: "Negative",
  },
  {
    name: "Urobilinogen",
    Attribute: "urobilinogen",
    unit: "",
    range: "Normal Trace",
  },
  {
    name: "Bilirubin",
    Attribute: "bilirubin",
    unit: "",
    range: "Negative",
  },
  {
    name: "Nitrite",
    Attribute: "nitrite",
    unit: "",
    range: "Negative",
  },
  {
    name: "Pus Cells",
    Attribute: "pus_cells",
    unit: "/HPF",
    range: "0 : 1",
  },
  {
    name: "Red Cells",
    Attribute: "red_cells",
    unit: "/HPF",
    range: "0 : 1",
  },
  {
    name: "Epithelial Cells",
    Attribute: "epithelial_cells",

    unit: "/HPF",
    range: "Negative",
  },
  {
    name: "Amorphous",
    Attribute: "amorphous",
    unit: "/HPF",
    range: "Negative",
  },
  {
    name: "Crystals",
    Attribute: "crystals",
    unit: "/HPF",
    range: "Negative",
  },
  {
    name: "Casts",
    Attribute: "casts",
    unit: "/HPF",
    range: "Negative",
  },
  {
    name: "Others",
    Attribute: "others",
    unit: "/HPF",
    range: "",
  },
];

// export async function GetFakeUSers() {
//   let response = "";
//   try {
//     response = await axios
//       .get("http://localhost:3001/fakeusers")
//       .then((res) => res.data);
//     console.log(response);
//     return response;
//   } catch (error) {
//     if (error.response) {
//       /*
//        * The request was made and the server responded with a
//        * status code that falls out of the range of 2xx
//        */
//       return error.response;
//     }
//   }
//   return response;
// }
// // export async function GetAdminUserList() {
// //   const dashBoard = await axios.get(`${Configure.backURL}admin/showUsers`, {
// //     headers: {
// //       "Content-Type": "application/json; charset=utf-8",
// //       "x-access-token": `${localStorage.getItem("token")}`,
// //     },
// //   });
// //   return dashBoard;
// // }

// export function GetDashBoardstat() {
//   const [dashBoard, setDashBoard] = React.useState([]);

//   useEffect(() => {
//     const fetchProduct = async () => {
//       const dashBoard = await axios.get(`admin/dashBoard`, {
//         headers: {
//           "Content-Type": "application/json; charset=utf-8",
//           "x-access-token": `${localStorage.getItem("token")}`,
//         },
//       });
//       setDashBoard(dashBoard.data);
//     };
//     fetchProduct();
//   }, []);

//   if (!dashBoard) return null;
//   console.log("dashboard", dashBoard);
//   return dashBoard;
// }

// export function GetUsersMock() {
//   const [userpermonth, setUserPerMonth] = React.useState([]);

//   useEffect(() => {
//     fetch("http://localhost:3001/fakeusers")
//       .then((res) => res.json())
//       .then((result) => {
//         setUserPerMonth(result);
//       });
//   }, []);
//   return userpermonth;
// }
export const backEndLogIn = async (payload) => {
  var message;
  const {data, password} = payload;
  await axios
    .post(`${configure.backURL}entity/login/`, {
      headers: {
        "Content-Type": "application/json",
      },
      data,
      password,
    })
    .then((response) => {
      console.log(response);
      if (response.status === 201) {
        message = "";

        localStorage.setItem("name", response.data.user.name);
        localStorage.setItem("joinedAt", response.data.user.created_at);
      }
    })
    .catch((error) => {
      message = error.response.data.message;
    });
  return message;
};