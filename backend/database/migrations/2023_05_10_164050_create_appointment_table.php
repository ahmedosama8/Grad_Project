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
        Schema::create('appointments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('patient_id')->nullable();
            $table->foreignId('entity_id')->nullable();
            $table->string('appointment_type')->nullable();
            $table->string('appointment_status')->nullable();
            $table->date('appointment_date')->nullable();
            $table->string('referral')->nullable();
            $table->integer('price')->nullable();
            $table->longText('notes')->nullable();
            $table->string("payment_method")->nullable();
            $table->json('diagnoses')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('appointments');
    }
};
