import "./App.css";
import {
  BrowserRouter as Router,
  Navigate,
  Route,
  Routes,
} from "react-router-dom";
import LoginPage from "./LoginPage/LoginPage";
import Clinic from "./Clinic/Clinic";
import Lab from "./Lab/Lab";
import Radiology from "./Radiology/Radiology";
import CBCTest from "./Lab/CBCTest";
import GlucoseTest from "./Lab/GlucoseTest";
import LiverTest from "./Lab/LiverFunctionTest";
import RadScan from "./Radiology/RadScan";
import PatientClinic from "./Clinic/PatientClinic";
import ClinicalChemistryTest from "./Lab/ClinicalChemistryTest";
import PatitentsPage from "./Lab/PatitentsPage";
import AllPatientsPage from "./Lab/AllPatientsPage";
import PatientResultPage from "./Lab/PatientResultPage";
import UrineExamTest from "./Lab/UrineExamTest";
import NewPatient from "./Lab/NewPatient";
import WholeTest from "./Lab/WholeTest";
import PatientInfo from "./patientInfo";
import LipidProfileResult from "./Lab/WholeTests/LipidProfileResult";
import UrinetestResult from "./Lab/WholeTests/UrinetestResult";
import CbcTestResult from "./Lab/WholeTests/CbcTestResult";
import LiverTestResult from "./Lab/WholeTests/LiverTestResult";
import GlucoseTestResult from "./Lab/WholeTests/GlucoseTestResult";
function App() {
  return (
    <Router>
      <div className="App">
        <Routes>
          <Route path="/" element={<LoginPage />} />
          {/* Routes for lab page */}
          <Route path="/labhome" element={<Lab />} />
          <Route path="/cbctest/:id" element={<CBCTest />} />
          <Route path="/glucosetest/:id" element={<GlucoseTest />} />
          <Route path="/livertest/:id" element={<LiverTest />} />
          <Route path="/urinetest/:id" element={<UrineExamTest />} />
          <Route
            path="/clinicalchemistry/:id"
            element={<ClinicalChemistryTest />}
          />
          <Route path="/newpatient" element={<NewPatient />} />
          <Route path="/patientspage" element={<PatitentsPage />} />
          <Route path="/allpatientspage" element={<AllPatientsPage />} />
          <Route
            path="/allpatientspage/patientresultpage/:id"
            element={<PatientResultPage />}
          />
          <Route path="/selected-row/:id" element={<WholeTest />} />
          <Route path="/cbc-page/:id" element={<CbcTestResult />} />
          <Route path="/glucose-page/:id" element={<GlucoseTestResult />} />
          <Route path="/lipid-profile-page/:id" element={<LipidProfileResult />} />
          <Route path="/liver-page/:id" element={<LiverTestResult />} />
          <Route path="/urine-page/:id" element={<UrinetestResult />} />

          {/* Routes for radiology center */}

          <Route path="/radhome" element={<Radiology />} />
          <Route path="/addscan" element={<RadScan />} />

          {/* Routes for clinic page */}

          <Route path="/clinichome" element={<Clinic />} />
          <Route path="/addpatient" element={<PatientClinic />} />
          {/*Route for the patient  */}
          <Route path="/patient-info/:id" element={<PatientInfo />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
