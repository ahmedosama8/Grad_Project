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

    public function lipidprofile(): HasOne
    {
        return $this->hasOne(lipidprofile::class, 'appointment_id');
    }

    public function glucose(): HasOne
    {
        return $this->hasOne(glucose::class, 'appointment_id');
    }

    public function liverfunc(): HasOne
    {
        return $this->hasOne(liverfunc::class, 'appointment_id');
    }

    public function radiologyreport(): HasOne
    {
        return $this->hasOne(radiologyreport::class, 'appointment_id');
    }

    public function urinetest(): HasOne
    {
        return $this->hasOne(urinetest::class, 'appointment_id');
    }

}
