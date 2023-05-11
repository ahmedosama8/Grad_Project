<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Patient extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'email',
        'password',
        'username',
        'gender',
        'phone',
        'emergency_contact',
        'image',
        'blood_type',
        'age',
        'birth_date',
        'marital_status',
        'national_id_number',
        'address',
    ];


    public function appointments(): HasMany
    {
        return $this->hasMany(Appointments::class, 'patient_id');
    }

    public function cbc(): HasMany
    {
        return $this->hasMany(cbc::class, 'patient_id');
    }

    public function lipidprofile(): HasMany
    {
        return $this->hasMany(lipidprofile::class, 'patient_id');
    }

    public function glucose(): HasMany
    {
        return $this->hasMany(glucose::class, 'patient_id');
    }

    public function liverfunc(): HasMany
    {
        return $this->hasMany(liverfunc::class, 'patient_id');
    }

    public function radiologyreport(): HasMany
    {
        return $this->hasMany(radiologyreport::class, 'patient_id');
    }

    public function urinetest(): HasMany
    {
        return $this->hasMany(urinetest::class, 'patient_id');
    }
}
