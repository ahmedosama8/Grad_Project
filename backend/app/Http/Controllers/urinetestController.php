<?php

namespace App\Http\Controllers;

use App\Models\urinetest;
use Illuminate\Http\Request;

class urinetestController extends Controller
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
        $test = urinetest::updateOrCreate($request->all());
        return response()->json($test, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return response()->json(urinetest::find($id), 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $test = urinetest::find($id);
        $test->fill($request->all());
        return response()->json($test, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function get_patient_urine(string $id)
    {
        $patients = urinetest::where('patient_id', $id)->get();
        return response()->json($patients, 200);
    }

    public function get_entity_urine(string $id)
    {
        $entities = urinetest::where('entity_id', $id)->get();
        return response()->json($entities, 200);
    }

    public function get_patient_entity_urine(string $id, string $pid)
    {
        $tests = urinetest::where('patient_id', $pid)->where('entity_id', $id)->get();
        return response()->json($tests, 200);
    }

}
