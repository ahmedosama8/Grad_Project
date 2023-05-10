<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PatientController;
use App\Http\Controllers\HealthcareEntityController;
use App\Http\Controllers\AppointmentController;

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

Route::get('/entity/{id}', [HealthcareEntityController::class, 'show']);
Route::post('/entity/new', [HealthcareEntityController::class, 'store']);
Route::post('/entity/login', [HealthcareEntityController::class, 'login']);
Route::get('/entity/{id}/patient/{pid}', [AppointmentController::class, 'show_patient_appointments']);
Route::get('/entity/{id}/appointments', [AppointmentController::class, 'show_entity_appointments']);


Route::get('/appointment/{id}', [AppointmentController::class, 'show']);
Route::post('/appointment/{pid}/{id}', [AppointmentController::class, 'store']);
Route::put('/appointment/{pid}/{id}', [AppointmentController::class, 'update']);


Route::get('/patient/{id}', [PatientController::class, 'show']);
Route::post('/patient/new', [PatientController::class, 'store']);
Route::put('/patient/{id}', [PatientController::class, 'update']);
Route::post('/patient/login', [PatientController::class, 'login']);
Route::get('/patient/{pid}/appointments', [AppointmentController::class, 'show_patient_history']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
