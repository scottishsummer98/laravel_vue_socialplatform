<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class DataProviderController extends Controller
{
    public function updateUser(Request $request)
    {
        $user = User::where('id', $request->id)->first();
        $dp = null;
        if ($request->DP) {
            if ($user->dp != null) {
                Storage::delete($user->dp);
                $dp = $request->DP->store(
                    '/user/' . date('Y') . '/' . date('m')
                );
            } else {
                $dp = $request->DP->store(
                    '/user/' . date('Y') . '/' . date('m')
                );
            }
        }

        User::where('id', $request->id)->update([
            'dp' => $dp,
        ]);
    }
}
