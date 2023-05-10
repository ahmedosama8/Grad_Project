<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

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

}
