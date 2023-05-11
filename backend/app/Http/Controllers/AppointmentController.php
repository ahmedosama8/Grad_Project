<?php

namespace App\Http\Controllers;

use App\Models\Appointments;
use App\Models\cbc;
use App\Models\glucose;
use App\Models\lipidprofile;
use App\Models\liverfunc;
use App\Models\urinetest;
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
    public function store(Request $request)
    {
        $appointment = Appointments::updateOrCreate($request->all());
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

    public function get_tests(string $id)
    {
        $cbc = cbc::where('entity_id', $id)->get();
        $lipids = lipidprofile::where('entity_id', $id)->get();
        $liver = liverfunc::where('entity_id', $id)->get();
        $urine = urinetest::where('entity_id', $id)->get();
        $glucose = glucose::where('entity_id', $id)->get();
        return response()->json([$cbc, $lipids, $liver, $urine, $glucose], 200);
    }

}

