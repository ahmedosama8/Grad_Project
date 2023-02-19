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
function App() {
  return (
    <Router>
    <div className="App">
      <Routes>
        <Route path="/" element={<LoginPage />}/>
        <Route path="/Clinic" element={<Clinic/>}/>
        <Route path="/Lab" element={<Lab/>}/>
        <Route path="/Radiology-Center" element={<Radiology/>}/>
      </Routes>
    </div>
    </Router>
  );
}

export default App;
