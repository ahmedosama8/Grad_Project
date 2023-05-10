<?php

namespace App\Http\Controllers;

use App\Models\Appointments;
use Illuminate\Http\Request;

class AppointmentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request, string $id, string $pid)
    {
        $appointment = Appointments::updateOrCreate([
            'patient_id' => $pid,
            'entity_id' => $id,
            'appointment_date' => $request->get('appointment_date'),
            'appointment_type' => $request->get('appointment_type'),
            'appointment_status' => $request->get('appointment_status'),
            'referral' => $request->get('referral'),
            'price' => $request->get('price'),
            'diagnoses' => $request->get('diagnoses'),
            'notes' => $request->get('notes'),
            'payment_method' => $request->get('payment_method'),
        ]);
        return response()->json($appointment, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return response()->json(Appointments::find($id), 200);

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $appointment = Appointments::find($id);
        $appointment->fill($request->all())->save();
        return response()->json($appointment, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function show_patient_appointments(string $id, string $pid)
    {
        $patients = Appointments::where('patient_id', $pid)->where('entity_id', $id)->get();
        return response()->json($patients, 200);
    }

    public function show_entity_appointments(string $id)
    {
        return response()->json(Appointments::where('entity_id', $id)->get());
    }

    public function show_patient_history(string $pid)
    {
        return response()->json(Appointments::where('patient_id', $pid)->get());
    }

}

