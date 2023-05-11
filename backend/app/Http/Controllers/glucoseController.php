<?php

namespace App\Http\Controllers;

use App\Models\glucose;
use Illuminate\Http\Request;

class glucoseController extends Controller
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
        $glucose = glucose::updateOrCreate($request->all());
        return response()->json($glucose, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return response()->json(glucose::find($id), 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $glucose = glucose::find($id);
        $glucose->fill($request->all())->save();
        return response()->json($glucose, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function get_patient_glucose(string $id)
    {
        $patients = glucose::where('patient_id', $id)->get();
        return response()->json($patients, 200);
    }

    public function get_entity_glucose(string $id)
    {
        $entities = glucose::where('entity_id', $id)->get();
        return response()->json($entities, 200);
    }

    public function get_patient_entity_glucose(string $id, string $pid)
    {
        $tests = glucose::where('patient_id', $pid)->where('entity_id', $id)->get();
        return response()->json($tests, 200);
    }

}
