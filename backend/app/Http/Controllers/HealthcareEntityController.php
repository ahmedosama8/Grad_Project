<?php

namespace App\Http\Controllers;

use App\Models\Appointments;
use App\Models\HealthcareEntity;
use App\Models\Patient;
use Illuminate\Http\Request;

class HealthcareEntityController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return response()->json(HealthcareEntity::all(), 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $entity = HealthcareEntity::updateOrCreate($request->all());
        return response()->json($entity, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return response()->json(HealthcareEntity::find($id));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $entity = HealthcareEntity::find($id);
        $entity->fill($request->all());
        return response()->json($entity, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function login(Request $request)
    {
        $username = $request->get('username');
        $password = $request->get('password');
        $entity = HealthcareEntity::where('username', $username)->first();
        if($entity){
            if($entity->password == $password){
                return response()->json($entity, 201);
            }
        }
        return response()->json(null, 404);

    }



}
