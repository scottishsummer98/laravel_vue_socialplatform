<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class DataProviderController extends Controller
{
    public function updateUser(Request $request)
    {
        $dp = null;
        if ($request->DP) {
            $dp = $request->DP->store('/user/' . date('Y') . '/' . date('m'));
        }

        User::where('id', $request->id)->update([
            'dp' => $dp,
        ]);
    }
}
