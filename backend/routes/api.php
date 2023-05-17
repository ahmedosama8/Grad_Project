<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PatientController;
use App\Http\Controllers\HealthcareEntityController;
use App\Http\Controllers\AppointmentController;
use App\Http\Controllers\CbcController;
use App\Http\Controllers\lipidprofileController;
use App\Http\Controllers\glucoseController;
use App\Http\Controllers\liverfuncController;
use App\Http\Controllers\urinetestController;
use App\Http\Controllers\radiologyreportController;
use App\Http\Controllers\diagnosisController;
use App\Http\Controllers\imageController;
use App\Http\Controllers\doctorvisitController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::get('/cbc/{id}', [CbcController::class, 'show']);
Route::post('/cbc/new', [CbcController::class, 'store']);
Route::put('/cbc/{id}', [CbcController::class, 'update']);
Route::get('/cbc/patient/{id}', [CbcController::class, 'get_patient_cbc']);
Route::get('/cbc/entity/{id}', [CbcController::class, 'get_entity_cbc']);
Route::get('/cbc/entity/{id}/patient/{pid}', [CbcController::class, 'get_patient_entity_cbc']);


Route::get('/lipid/{id}', [lipidprofileController::class, 'show']);
Route::post('/lipid/new', [lipidprofileController::class, 'store']);
Route::put('/lipid/{id}', [lipidprofileController::class, 'update']);
Route::get('/lipid/patient/{id}', [lipidprofileController::class, 'get_patient_lipid']);
Route::get('/lipid/entity/{id}', [lipidprofileController::class, 'get_entity_lipid']);
Route::get('/lipid/entity/{id}/patient/{pid}', [lipidprofileController::class, 'get_patient_entity_lipid']);


Route::get('/glucose/{id}', [glucoseController::class, 'show']);
Route::post('/glucose/new', [glucoseController::class, 'store']);
Route::put('/glucose/{id}', [glucoseController::class, 'update']);
Route::get('/glucose/patient/{id}', [glucoseController::class, 'get_patient_glucose']);
Route::get('/glucose/entity/{id}', [glucoseController::class, 'get_entity_glucose']);
Route::get('/glucose/entity/{id}/patient/{pid}', [glucoseController::class, 'get_patient_entity_glucose']);

Route::get('/liver/{id}', [liverfuncController::class, 'show']);
Route::post('/liver/new', [liverfuncController::class, 'store']);
Route::put('/liver/{id}', [liverfuncController::class, 'update']);
Route::get('/liver/patient/{id}', [liverfuncController::class, 'get_patient_liver']);
Route::get('/liver/entity/{id}', [liverfuncController::class, 'get_entity_liver']);
Route::get('/liver/entity/{id}/patient/{pid}', [liverfuncController::class, 'get_patient_entity_liver']);


Route::get('/urine/{id}', [urinetestController::class, 'show']);
Route::post('/urine/new', [urinetestController::class, 'store']);
Route::put('/urine/{id}', [urinetestController::class, 'update']);
Route::get('/urine/patient/{id}', [urinetestController::class, 'get_patient_urine']);
Route::get('/urine/entity/{id}', [urinetestController::class, 'get_entity_urine']);
Route::get('/urine/entity/{id}/patient/{pid}', [urinetestController::class, 'get_patient_entity_urine']);


Route::get('/radiology/{id}', [radiologyreportController::class, 'show']);
Route::post('/radiology/new', [radiologyreportController::class, 'store']);
Route::put('/radiology/{id}', [radiologyreportController::class, 'update']);
Route::get('/radiology/patient/{id}', [radiologyreportController::class, 'get_patient_radiology']);
Route::get('/radiology/entity/{id}', [radiologyreportController::class, 'get_entity_radiology']);
Route::get('/radiology/entity/{id}/patient/{pid}', [radiologyreportController::class, 'get_patient_entity_radiology']);

Route::post('/patient/{pid}/image', [imageController::class, 'store']);
Route::get('/patient/{pid}/image/{id}', [imageController::class, 'show']);


Route::get('/diagnosis/list', [diagnosisController::class, 'index']);
Route::get('/patient/list',[PatientController::class,'index']);
Route::get('/entity/list',[HealthcareEntityController::class,'index']);



Route::get('/entity/{id}', [HealthcareEntityController::class, 'show']);
Route::put('/entity/{id}', [HealthcareEntityController::class, 'update']);
Route::post('/entity/new', [HealthcareEntityController::class, 'store']);
Route::post('/entity/login', [HealthcareEntityController::class, 'login']);
Route::get('/entity/{id}/patient/{pid}/appointments', [AppointmentController::class, 'show_patient_appointments']);
Route::get('/entity/{id}/appointments', [AppointmentController::class, 'show_entity_appointments']);
Route::get('/entity/{id}/patients/list', [AppointmentController::class, 'show_entity_patients']);
Route::get('/entity/{id}/tests', [AppointmentController::class, 'get_tests']);


Route::get('/visit/{id}', [doctorvisitController::class, 'show']);
Route::put('/visit/{id}', [doctorvisitController::class, 'update']);
Route::post('/visit/new', [doctorvisitController::class, 'store']);
Route::get('/visit/patient/{pid}', [doctorvisitController::class, 'get_patient_visit']);
Route::get('/visit/entity/{id}', [doctorvisitController::class, 'get_entity_visit']);
Route::get('/visit/{id}/{pid}', [doctorvisitController::class, 'get_patient_entity_visit']);


Route::get('/appointment/{id}', [AppointmentController::class, 'show']);
Route::post('/appointment/{pid}/{id}', [AppointmentController::class, 'store']);
Route::put('/appointment/{pid}/{id}', [AppointmentController::class, 'update']);


Route::get('/patient/{id}', [PatientController::class, 'show']);
Route::get('/patient/list', [PatientController::class, 'index']);
Route::post('/patient/new', [PatientController::class, 'store']);
Route::put('/patient/{id}', [PatientController::class, 'update']);
Route::post('/patient/login', [PatientController::class, 'login']);
Route::get('/patient/{id}/tests', [PatientController::class, 'get_tests']);
Route::get('/patient/{pid}/appointments', [AppointmentController::class, 'show_patient_history']);
Route::get('/patient/{pid}/diagnoses', [doctorvisitController::class, 'get_patient_diagnoses']);
Route::get('/patient/{pid}/medications', [doctorvisitController::class, 'get_patient_medications']);
Route::get('/patient/{pid}/visits', [doctorvisitController::class, 'get_patient_visits']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
