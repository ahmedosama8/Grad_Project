import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import html2pdf from "html2pdf.js";

export default {
  backURL: "http://localhost:8080/api/",
  //lesa hnkhod wahed mn el backend
};

export const calculateAge = (birthDate) => {
  const today = new Date();
  const birthDateObj = new Date(birthDate);
  let age = today.getFullYear() - birthDateObj.getFullYear();

  const monthDiff = today.getMonth() - birthDateObj.getMonth();
  if (
    monthDiff < 0 ||
    (monthDiff === 0 && today.getDate() < birthDateObj.getDate())
  ) {
    age--;
  }

  return age;
};

export const notify = (errorMsg) => {
  toast.error(errorMsg, {
    position: toast.POSITION.BOTTOM_CENTER, // Change the position to top-right
    autoClose: 5000, // Close the toast after 5 seconds
    hideProgressBar: true, // Hide the progress bar
    className: "custom-toast", // Apply custom CSS class for styling
    bodyClassName: "custom-toast-body", // Apply custom CSS class for the toast body
  });
};

export const handleDownload = (filename, elementId) => {
  const element = document.getElementById(elementId);
  const opt = {
    margin: 5,
    filename: filename,
    image: { type: "jpeg", quality: 0.98 },
    html2canvas: { scale: 2 },
    jsPDF: { unit: "mm", format: "a4", orientation: "portrait" },
  };

  html2pdf().set(opt).from(element).save();
};
