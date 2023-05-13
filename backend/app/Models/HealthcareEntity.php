<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class HealthcareEntity extends Model
{
    use HasFactory;

    protected $fillable = [
      'phone',
      'email',
      'address',
      'name',
        'username',
        'password',
    ];

    public function appointments(): HasMany
    {
        return $this->hasMany(Appointments::class, 'entity_id');
    }

    public function cbc(): HasMany
    {
        return $this->hasMany(cbc::class, 'entity_id');
    }

    public function lipidprofile(): HasMany
    {
        return $this->hasMany(lipidprofile::class, 'entity_id');
    }

    public function glucose(): HasMany
    {
        return $this->hasMany(glucose::class, 'entity_id');
    }

    public function liverfunc(): HasMany
    {
        return $this->hasMany(liverfunc::class, 'entity_id');
    }

    public function radiologyreport(): HasMany
    {
        return $this->hasMany(radiologyreport::class, 'entity_id');
    }

    public function urinetest(): HasMany
    {
        return $this->hasMany(urinetest::class, 'entity_id');
    }

    public function doctorvisit(): HasMany
    {
        return $this->hasMany(doctorvisit::class, 'appointment_id');
    }


}
