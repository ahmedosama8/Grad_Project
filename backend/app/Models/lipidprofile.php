<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class lipidprofile extends Model
{
    use HasFactory;

    protected $fillable = [
        'patient_id',
        'doctor_id',
        'appointment_id',
        'alt',
        'ast',
        'albumin',
        'cholesterol',
        'hdl_c',
        'ldl_c',
        'triglycerides',
        'comments'
    ];

    public function patient(): BelongsTo
    {
        return $this->belongsTo(Patient::class, 'patient_id');
    }

    public function appointments(): BelongsTo
    {
        return $this->belongsTo(Appointments::class, 'appointment_id');
    }

    public function entity(): BelongsTo
    {
        return $this->belongsTo(HealthcareEntity::class, 'entity_id');
    }
}
