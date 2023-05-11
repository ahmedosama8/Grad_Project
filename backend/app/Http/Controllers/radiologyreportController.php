<?php

namespace App\Http\Controllers;

use App\Models\radiologyreport;
use Illuminate\Http\Request;

class radiologyreportController extends Controller
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
        $rad = radiologyreport::updateOrCreate($request->all());
        return response()->json($rad, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return response()->json(radiologyreport::find($id), 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $rad = radiologyreport::find($id);
        $rad->fill($request->all());
        return response()->json($rad, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function get_patient_radiology(string $id)
    {
        $patients = radiologyreport::where('patient_id', $id)->get();
        return response()->json($patients, 200);
    }

    public function get_entity_radiology(string $id)
    {
        $entities = radiologyreport::where('entity_id', $id)->get();
        return response()->json($entities, 200);
    }

    public function get_patient_entity_radiology(string $id, string $pid)
    {
        $tests = radiologyreport::where('patient_id', $pid)->where('entity_id', $id)->get();
        return response()->json($tests, 200);
    }

}
