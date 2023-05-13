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
        Schema::create('radiologyreports', function (Blueprint $table) {
            $table->id();
            $table->foreignId('patient_id')->nullable();
            $table->foreignId('entity_id')->nullable();
            $table->foreignId('appointment_id')->nullable();
            $table->string('name')->nullable();
            $table->string('performer')->nullable();
            $table->longText('report')->nullable();
            $table->string('examined_part')->nullable();
            $table->longText('comments')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('radiologyreports');
    }
};
