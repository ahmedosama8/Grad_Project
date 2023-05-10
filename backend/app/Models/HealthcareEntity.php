<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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
}
