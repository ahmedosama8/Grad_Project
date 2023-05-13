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
        $visit = doctorvisit::create([
            'appointment_id'=>$request->get('appointment_id'),
            'patient_id'=>$request->get('patient_id'),
            'entity_id'=>$request->get('entity_id'),
            'diagnoses'=>json_encode($request->get('diagnoses')),
            'medications'=>json_encode($request->get('medications')),
            'comments'=>$request->get('comments')
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
        $visit = doctorvisit::find($id);
        $visit->fill([
            'diagnoses'=>json_encode($request->get('diagnoses'), JSON_UNESCAPED_SLASHES),
            'medications'=>json_encode($request->get('medications'), JSON_UNESCAPED_SLASHES),
            'comments'=>$request->get('comments')
        ])->save();
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

    public function get_patient_diagnoses(string $pid){
        $visits = doctorvisit::where('patient_id', $pid)->get();
        $diagnoses = [];
        foreach ($visits as $visit)
        {
            $diagnoses[] = $visit->diagnoses;
        }
        return response()->json($diagnoses, 200);
    }

    public function get_patient_medications(string $pid)
    {
        $visits = doctorvisit::where('patient_id', $pid)->get();
        $medications = [];
        foreach ($visits as $visit)
        {
            $medications[] = $visit->medications;
        }
        return response()->json($medications, 200);

    }

}
