<?php

namespace App\Http\Controllers;

use App\Models\liverfunc;
use Illuminate\Http\Request;

class liverfuncController extends Controller
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
        $liver = liverfunc::updateOrCreate($request->all())->save();
        return response()->json($liver, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return response()->json(liverfunc::find($id), 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $liver = liverfunc::find($id);
        $liver->fill($request->all());
        return response()->json($liver, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function get_patient_liver(string $id)
    {
        $patients = liverfunc::where('patient_id', $id)->get();
        return response()->json($patients, 200);
    }

    public function get_entity_liver(string $id)
    {
        $entities = liverfunc::where('entity_id', $id)->get();
        return response()->json($entities, 200);
    }

    public function get_patient_entity_liver(string $id, string $pid)
    {
        $tests = liverfunc::where('patient_id', $pid)->where('entity_id', $id)->get();
        return response()->json($tests, 200);
    }

}