<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class urinetest extends Model
{
    use HasFactory;

    protected $fillable = [
        'patient_id',
        'appointment_id',
        'entity_id',
        'referring_doctor',
        'color',
        'clarity',
        'specific_gravity',
        'ph',
        'protein',
        'glucose',
        'ketone',
        'urobilinogen',
        'bilirubin',
        'nitrite',
        'pus_cells',
        'red_cells',
        'epithelial_cells',
        'amorphous',
        'crystals',
        'casts',
        'others',
        'comments'
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
