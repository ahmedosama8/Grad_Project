<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('glucoses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('patient_id');
            $table->foreignId('entity_id');
            $table->foreignId('appointment_id');
            $table->string('rbc');
            $table->string('rbs');
            $table->longText('comments')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('glucoses');
    }
};
