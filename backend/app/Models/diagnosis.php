<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class diagnosis extends Model
{
    use HasFactory;

    protected $table = 'diagnosiss';

    protected $fillable = [
        'code',
        'diagnosis'
    ];
}
