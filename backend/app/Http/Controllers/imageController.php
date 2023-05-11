<?php

namespace App\Http\Controllers;

use App\Models\image;
use Illuminate\Http\Request;

class imageController extends Controller
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
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
        if ($files = $request->file('image')) {
            $imageName = time().'.'.$request->image->extension();
            $request->image->move(public_path('image'), $imageName);
        }

        $image = image::updateOrCreate([
            'appointment_id' => $request->get('id'),
            'image' => $imageName,
        ]);
        return response()->json($image, 201);

    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return response()->json(image::find($id), 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
