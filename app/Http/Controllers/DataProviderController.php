<?php

namespace App\Http\Controllers;

use App\Models\Posts;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
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
            $dpphotos = $request->DP->store(
                '/user/photos/dp/' . date('Y') . '/' . date('m')
            );
            User::where('id', $request->id)->update([
                'dp' => $dp,
            ]);
            Posts::create([
                'userid' => $request->id,
                'posttype' => 'dp',
                'img' => $dpphotos,
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
            $cpphotos = $request->CP->store(
                '/user/photos/cp/' . date('Y') . '/' . date('m')
            );
            User::where('id', $request->id)->update([
                'cp' => $cp,
            ]);
            Posts::create([
                'userid' => $request->id,
                'posttype' => 'cp',
                'img' => $cpphotos,
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
    public function createPost(Request $request)
    {
        if ($request->PP) {
            $img = null;
            $img = $request->PP->store(
                '/user/photos/generalposts/' . date('Y') . '/' . date('m')
            );
            Posts::create([
                'userid' => $request->id,
                'desc' => $request->desc,
                'img' => $img,
                'posttype' => 'generalposts',
            ]);
        } else {
            Posts::create([
                'userid' => $request->id,
                'desc' => $request->desc,
                'posttype' => 'generalposts',
            ]);
        }
    }
    public function showPosts(Request $request)
    {
        $id = Auth::id();
        return Posts::where('userid', $id)
            ->orderBy('created_at', 'DESC')
            ->get();
    }
}
