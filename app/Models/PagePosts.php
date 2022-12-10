<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PagePosts extends Model
{
    use HasFactory;

    protected $fillable = ['userid', 'pageid', 'desc', 'img'];
}
