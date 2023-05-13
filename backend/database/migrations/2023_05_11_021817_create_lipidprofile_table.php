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
        Schema::create('lipidprofiles', function (Blueprint $table) {
            $table->id();
            $table->foreignId('patient_id')->nullable();
            $table->foreignId('entity_id')->nullable();
            $table->foreignId('appointment_id')->nullable();
            $table->string('alt')->nullable();
            $table->string('ast')->nullable();
            $table->string('albumin')->nullable();
            $table->string('cholesterol')->nullable();
            $table->string('hdl_c')->nullable();
            $table->string('ldl_c')->nullable();
            $table->string('triglycerides')->nullable();
            $table->longText('comments')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lipidprofiles');
    }
};
