import './App.css';
import {
  BrowserRouter as Router,
  Navigate,
  Route,
  Routes,
} from "react-router-dom";
import LoginPage from './LoginPage/LoginPage';
import Clinic from './Clinic/Clinic';
import Lab from './Lab/Lab';
import Radiology from './Radiology/Radiology';
import CBCTest from './Lab/CBCTest';
import GlucoseTest from './Lab/GlucoseTest';
import LiverTest from './Lab/LiverFunctionTest';
function App() {
  return (
    <Router>
    <div className="App">
      <Routes>
        <Route path="/" element={<LoginPage />}/>
        <Route path="/Clinic" element={<Clinic/>}/>
        <Route path="/Lab" element={<Lab/>}/>
        <Route path="/cbctest" element={<CBCTest/>}/>
        <Route path="/glucosetest" element={<GlucoseTest/>}/>
        <Route path="/livertest" element={<LiverTest/>}/>

        <Route path="/Radiology-Center" element={<Radiology/>}/>
      </Routes>
    </div>
    </Router>
  );
}

export default App;
