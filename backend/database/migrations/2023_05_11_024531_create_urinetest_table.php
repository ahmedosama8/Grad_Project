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
        Schema::create('urinetests', function (Blueprint $table) {
            $table->id();
            $table->foreignId('patient_id')->nullable();
            $table->foreignId('entity_id')->nullable();
            $table->foreignId('appointment_id')->nullable();
            $table->string('color')->nullable();
            $table->string('clarity')->nullable();
            $table->string('specific_gravity')->nullable();
            $table->string('ph')->nullable();
            $table->string('protein')->nullable();
            $table->string('glucose')->nullable();
            $table->string('ketone')->nullable();
            $table->string('urobilinogen')->nullable();
            $table->string('bilirubin')->nullable();
            $table->string('nitrite')->nullable();
            $table->string('pus_cells')->nullable();
            $table->string('red_cells')->nullable();
            $table->string('epithelial_cells')->nullable();
            $table->string('amorphous')->nullable();
            $table->string('crystals')->nullable();
            $table->string('casts')->nullable();
            $table->string('others')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('urinetests');
    }
};
