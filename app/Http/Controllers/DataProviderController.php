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
        $cp = null;
        if ($request->DP) {
            if ($user->dp != null) {
                Storage::delete($user->dp);
                $dp = $request->DP->store(
                    '/user/dp/' . date('Y') . '/' . date('m')
                );
            } else {
                $dp = $request->DP->store(
                    '/user/dp/' . date('Y') . '/' . date('m')
                );
            }
            User::where('id', $request->id)->update([
                'dp' => $dp,
            ]);
        } elseif ($request->CP) {
            if ($user->cp != null) {
                Storage::delete($user->cp);
                $cp = $request->CP->store(
                    '/user/cp/' . date('Y') . '/' . date('m')
                );
            } else {
                $cp = $request->CP->store(
                    '/user/cp/' . date('Y') . '/' . date('m')
                );
            }
            User::where('id', $request->id)->update([
                'cp' => $cp,
            ]);
        } else {
            User::where('id', $request->id)->update([
                'fname' => $request->fname,
                'lname' => $request->lname,
                'dob' => $request->dob,
                'email' => $request->email,
                'mobile' => $request->mobile,
            ]);
        }
    }
}
