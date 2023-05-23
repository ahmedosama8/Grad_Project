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
        'entity_id',
        'appointment_id',
        'referring_doctor',
        'cholesterol',
        'hdl_c',
        'ldl_c',
        'triglycerides',
        'vldl_cholestrol',
        'total_lipids',
        'risk_ratio_1',
        'oxidized_ldl',
        'risk_ratio_2',
        'h_crp',
        'ratio',
        'lipo_protein',
        'apoa',
        'apob',
        'apoa_divided_apob',
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
