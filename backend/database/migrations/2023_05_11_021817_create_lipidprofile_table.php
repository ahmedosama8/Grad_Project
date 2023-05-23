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
            $table->string('referring_doctor')->nullable();
            $table->string('cholesterol')->nullable();
            $table->string('hdl_c')->nullable();
            $table->string('ldl_c')->nullable();
            $table->string('triglycerides')->nullable();
            $table->string('vldl_cholestrol')->nullable();
            $table->string('total_lipids')->nullable();
            $table->string('risk_ratio_1')->nullable();
            $table->string('oxidized_ldl')->nullable();
            $table->string('risk_ratio_2')->nullable();
            $table->string('h_crp')->nullable();
            $table->string('ratio')->nullable();
            $table->string('lipo_protein')->nullable();
            $table->string('apoa')->nullable();
            $table->string('apob')->nullable();
            $table->string('apoa_divided_apob')->nullable();
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
