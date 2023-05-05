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
function App() {
  return (
    <Router>
      <div className="App">
        <Routes>
          <Route path="/" element={<LoginPage />} />
          {/* Routes for lab page */}
          <Route path="/labhome" element={<Lab />} />
          <Route path="/cbctest" element={<CBCTest />} />
          <Route path="/glucosetest" element={<GlucoseTest />} />
          <Route path="/livertest" element={<LiverTest />} />
          <Route path="/urinetest" element={<UrineExamTest />} />
          <Route
            path="/clinicalchemistry"
            element={<ClinicalChemistryTest />}
          />
          <Route path="/newpatient" element={<NewPatient />} />
          <Route path="/patientspage" element={<PatitentsPage />} />
          <Route path="/allpatientspage" element={<AllPatientsPage />} />
          <Route
            path="/allpatientspage/patientresultpage"
            element={<PatientResultPage />}
          />
          <Route
            path="/selected-row/:id"
            element={<WholeTest />}
          />

          {/* Routes for radiology center */}

          <Route path="/radhome" element={<Radiology />} />
          <Route path="/addscan" element={<RadScan />} />

          {/* Routes for clinic page */}

          <Route path="/clinichome" element={<Clinic />} />
          <Route path="/addpatient" element={<PatientClinic />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
