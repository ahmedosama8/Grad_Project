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


    public function appointment(): HasMany
    {
        return $this->hasMany(Appointments::class, 'patient_id');
    }
}
