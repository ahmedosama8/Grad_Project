<?php

namespace App\Http\Controllers;

use App\Models\cbc;
use App\Models\glucose;
use App\Models\lipidprofile;
use App\Models\liverfunc;
use App\Models\Patient;
use App\Models\urinetest;
use Illuminate\Http\Request;

class PatientController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return response()->json(Patient::all(), 200);

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $patient = Patient::updateOrCreate($request->all());
        return response()->json($patient, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return response()->json(Patient::where('id', $id)->first());
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $patient = Patient::findOrfail($id);
        $patient->fill($request->all());
        $patient->save();
        return response()->json($patient, 200);

    }

    public function login(Request $request)
    {
        $username = $request->get('username');
        $password = $request->get('password');
        $patient = Patient::where('username', $username)->first();
        if($patient){
            if($patient->password == $password){
                return response()->json($patient, 201);
            }
        }
        return response()->json(null, 404);
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function get_tests(string $id)
    {
        $cbc = cbc::where('patient_id', $id)->get();
        $lipids = lipidprofile::where('patient_id', $id)->get();
        $liver = liverfunc::where('patient_id', $id)->get();
        $urine = urinetest::where('patient_id', $id)->get();
        $glucose = glucose::where('patient_id', $id)->get();
        return response()->json([$cbc, $lipids, $liver, $urine, $glucose], 200);
    }
}
