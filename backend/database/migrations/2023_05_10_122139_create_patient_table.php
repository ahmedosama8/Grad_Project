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
        Schema::create('patients', function (Blueprint $table) {
            $table->id();
            $table->longText('name')->nullable();
            $table->string('email')->nullable()->unique();
            $table->string('password')->nullable();
            $table->string('username')->nullable()->unique();
            $table->string('gender')->nullable();
            $table->string('phone')->nullable();
            $table->string('emergency_contact')->nullable();
            $table->string('image')->nullable();
            $table->integer('age')->nullable();
            $table->date('birth_date')->nullable();
            $table->string('blood_type')->nullable();
            $table->string('marital_status')->nullable();
            $table->string('national_id_number')->nullable();
            $table->longText('address')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('patients');
    }
};
