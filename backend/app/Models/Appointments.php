<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Appointments extends Model
{
    use HasFactory;


    protected $casts = [
        'diagnoses'=>'array'
    ];

    protected $fillable = [
        'patient_id',
        'entity_id',
        'appointment_date',
        'appointment_type',
        'appointment_status',
        'referral',
        'price',
        'diagnoses',
        'notes',
        'payment_method',
    ];

    public function patient(): BelongsTo
    {
        return $this->belongsTo(Patient::class, 'patient_id');
    }

    public function entity(): BelongsTo{
        return $this->belongsTo(HealthcareEntity::class, 'entity_id');
    }

    public function cbc(): HasOne
    {
        return $this->hasOne(cbc::class, 'appointment_id');
    }
}
