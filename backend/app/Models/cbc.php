<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class cbc extends Model
{
    use HasFactory;

    protected $fillable = [
        'appointment_id',
        'patient_id',
        'entity_id',
        'haemoglobin',
        'hematocrit',
        'red_cell_count',
        'mcv',
        'mch',
        'rdw',
        'platelet_count',
        'tlc',
        'basophils',
        'eosinophils',
        'stab',
        'segmented',
        'lymphocytes',
        'monocytes'
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
