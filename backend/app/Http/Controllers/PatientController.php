<?php

namespace App\Http\Controllers;

use App\Models\Patient;
use Illuminate\Http\Request;

class PatientController extends Controller
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
}
