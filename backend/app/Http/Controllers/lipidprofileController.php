<?php

namespace App\Http\Controllers;

use App\Models\lipidprofile;
use Illuminate\Http\Request;

class lipidprofileController extends Controller
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
        $lipid = lipidprofile::updateOrCreate($request->all());
        return response()->json($lipid, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return response()->json(lipidprofile::find($id), 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $lipid = lipidprofile::find($id);
        $lipid->fill($request->all())->save();
        return response()->json($lipid, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function get_patient_lipid(string $id)
    {
        $patients = lipidprofile::where('patient_id', $id)->get();
        return response()->json($patients, 200);
    }

    public function get_entity_lipid(string $id)
    {
        $entites = lipidprofile::where('entity_id', $id)->get();
        return response()->json($entites, 200);
    }

    public function get_patient_entity_lipid(string $id, string $pid)
    {
        $tests = lipidprofile::where('patient_id', $pid)->where('entity_id', $id)->get();
        return response()->json($tests, 200);
    }
}
