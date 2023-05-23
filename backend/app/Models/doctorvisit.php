<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class doctorvisit extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    protected $casts = [
        'diagnoses'=>'array',
        'medications'=> 'array'
    ];

    protected $fillable =[
        'patient_id',
        'entity_id',
        'appointment_id',
        'diagnosed_by',
        'referring_doctor',
        'diagnoses',
        'medications',
        'comments',
    ];

    public function appointments(): BelongsTo
    {
        return $this->belongsTo(Appointments::class, 'appointment_id');
    }

    public function patient(): BelongsTo
    {
        return $this->belongsTo(Patient::class, 'patient_id');
    }

    public function entity(): BelongsTo
    {
        return $this->belongsTo(HealthcareEntity::class, 'entity_id');
    }
}
