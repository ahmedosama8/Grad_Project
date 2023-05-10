<?php

namespace App\Http\Controllers;

use App\Models\cbc;
use Illuminate\Http\Request;

class CbcController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return cbc::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $cbc = cbc::updateOrCreate($request->all());
        return response()->json($cbc, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return response()->json(cbc::find($id), 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $cbc = cbc::find($id);
        $cbc->fill($request->all())->save();
        return response()->json($cbc, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function get_patient_cbc(string $id)
    {
        $patients = cbc::where('patient_id', $id)->get();
        return response()->json($patients, 200);
    }

    public function get_entity_cbc(string $id)
    {
        $entities = cbc::where('entity_id', $id)->get();
        return response()->json($entities, 200);
    }

    public function get_patient_entity_cbc(string $id, string $pid)
    {
        $tests = cbc::where('patient_id', $pid)->where('entity_id', $id)->get();
        return response()->json($tests, 200);
    }
}
