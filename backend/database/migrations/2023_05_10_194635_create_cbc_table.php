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
        Schema::create('cbcs', function (Blueprint $table) {
            $table->id();
            $table->foreignId('patient_id')->nullable();
            $table->foreignId('entity_id')->nullable();
            $table->foreignId('appointment_id')->nullable();
            $table->string('haemoglobin')->nullable();
            $table->string('hematocrit')->nullable();
            $table->string('red_cell_count')->nullable();
            $table->string('mcv')->nullable();
            $table->string('mch')->nullable();
            $table->string('rdw')->nullable();
            $table->string('tlc')->nullable();
            $table->string('platelet_count')->nullable();
            $table->string('basophils')->nullable();
            $table->string('eosinophils')->nullable();
            $table->string('stab')->nullable();
            $table->string('segmented')->nullable();
            $table->string('lymphocytes')->nullable();
            $table->string('monocytes')->nullable();
            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cbcs');
    }
};
