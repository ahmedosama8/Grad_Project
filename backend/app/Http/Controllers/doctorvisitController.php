<?php

namespace App\Http\Controllers;

use App\Models\doctorvisit;
use Illuminate\Http\Request;

class doctorvisitController extends Controller
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
        dd($request->get('medications'));
        $visit = doctorvisit::create([
            'appointment_id'=>$request->get('appointment_id'),
            'patient_id'=>$request->get('patient_id'),
            'entity_id'=>$request->get('entity_id'),
            'diagnoses'=>$request->get('diagnoses'),
            'medications'=>$request->get('medications'),
            'notes'=>$request->get('medications')
        ]);
//        $visit = doctorvisit::updateOrCreate($request->all());
        return response()->json($visit, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return response()->json(doctorvisit::find($id), 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $visits = doctorvisit::where('id', $id)->
        $visit = doctorvisit::find($id);
        $visit->fill($request->all())->save();
        return response()->json($visit, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function get_patient_visit(string $id)
    {
        $patients = doctorvisit::where('patient_id', $id)->get();
        return response()->json($patients, 200);
    }

    public function get_entity_visit(string $id)
    {
        $entities = doctorvisit::where('entity_id', $id)->get();
        return response()->json($entities, 200);
    }

    public function get_patient_entity_visit(string $id, string $pid)
    {
        $tests = doctorvisit::where('patient_id', $pid)->where('entity_id', $id)->get();
        return response()->json($tests, 200);
    }

}
