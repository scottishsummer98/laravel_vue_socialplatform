<?php

namespace App\Http\Controllers;

use App\Models\Followers;
use App\Models\Posts;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
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
                'desc' => 'dp',
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
                'desc' => 'cp',
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
        $img = null;
        if ($request->PP) {
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
    public function updatePost(Request $request)
    {
        Posts::where('id', $request->postid)->update([
            'desc' => $request->desc,
        ]);
    }
    public function deletePost(Request $request)
    {
        $id = Auth::id();
        $user = User::where('id', $id)->first();
        $post = Posts::where('id', $request->postid)->first();
        if ($request->posttype == 'dp') {
            Storage::delete($user->dp);
            Storage::delete($post->img);
            User::where('id', $id)->update([
                'dp' => null,
            ]);
        } elseif ($request->posttype == 'cp') {
            Storage::delete($user->cp);
            Storage::delete($post->img);
            User::where('id', $id)->update([
                'cp' => null,
            ]);
        } else {
            Storage::delete($post->img);
        }
        Posts::destroy('id', $request->postid);
    }
    public function showPosts(Request $request)
    {
        if ($request->filled('gtype')) {
            if ($request->gtype == 'DP') {
                $id = Auth::id();
                return Posts::where('userid', $id)
                    ->where('posttype', 'dp')
                    ->orderBy('created_at', 'DESC')
                    ->pluck('img');
            } elseif ($request->gtype == 'CP') {
                $id = Auth::id();
                return Posts::where('userid', $id)
                    ->where('posttype', 'cp')
                    ->orderBy('created_at', 'DESC')
                    ->pluck('img');
            } elseif ($request->gtype == 'timeline') {
                $id = Auth::id();
                return Posts::where('userid', $id)
                    ->where('posttype', 'generalposts')
                    ->where('img', '!=', null)
                    ->orderBy('created_at', 'DESC')
                    ->pluck('img');
            } elseif ($request->gtype == 'lightbox') {
                $id = Auth::id();
                return Posts::where('userid', $id)
                    ->where('img', $request->img)
                    ->get();
            } elseif ($request->gtype == 'newsfeed') {
                $id = Auth::id();
                $self = User::where('id', $id)->get();
                $selfFriendsList = explode(',', $self[0]->addedfriends);
                return DB::table('posts')
                    ->join('users', 'posts.userid', '=', 'users.id')
                    ->whereIn('posts.userid', $selfFriendsList)
                    ->orderBy('posts.created_at', 'DESC')
                    ->get();
            }
        } else {
            $id = Auth::id();
            return Posts::where('userid', $id)
                ->orderBy('created_at', 'DESC')
                ->get();
        }
    }

    public function showFriends(Request $request)
    {
        $id = Auth::id();
        if ($request->filled('type')) {
            if ($request->type == 'suggestions') {
                $accreq = User::where('id', $id)->get();
                $accreqids = explode(',', $accreq[0]->addedfriends);
                $penreq = User::where('id', $id)->get();
                $penreqids = explode(',', $penreq[0]->pendingfriends);
                return DB::table('users')
                    ->whereNotIn('id', $accreqids)
                    ->whereNotIn('id', $penreqids)
                    ->where('id', '<>', $id)
                    ->get();
            } elseif ($request->type == 'acceptedreq') {
                $accreq = User::where('id', $id)->get();
                $accreqids = explode(',', $accreq[0]->addedfriends);
                return DB::table('users')
                    ->whereIn('id', $accreqids)
                    ->get();
            } elseif ($request->type == 'pendingreq') {
                $penreq = User::where('id', $id)->get();
                $penreqids = explode(',', $penreq[0]->pendingfriends);
                return DB::table('users')
                    ->whereIn('id', $penreqids)
                    ->get();
            }
        }
    }
    public function addremoveFriends(Request $request)
    {
        $id = Auth::id();
        if ($request->filled('type')) {
            if ($request->type == 'add') {
                $Friend = User::where('id', $request->id)->get();
                $PendingFriendsList = $Friend[0]->pendingfriends;
                $selfDataId = $id . ',';
                $PendingFriendsListModified = $selfDataId . $PendingFriendsList;
                User::where('id', $request->id)->update([
                    'pendingfriends' => $PendingFriendsListModified,
                ]);
            } elseif ($request->type == 'accept') {
                $self = User::where('id', $id)->get();
                $selfAddedFriendsList = $self[0]->addedfriends;
                $selfPendingFriendsList = $self[0]->pendingfriends;
                $AceeptedIdConcatString = $request->id . ',';
                $selfDataAddedFriendsModified =
                    $AceeptedIdConcatString . $selfAddedFriendsList;
                $selfDataPendingFriendsModified = str_replace(
                    $AceeptedIdConcatString,
                    '',
                    $selfPendingFriendsList
                );
                User::where('id', $id)->update([
                    'addedfriends' => $selfDataAddedFriendsModified,
                    'pendingfriends' => $selfDataPendingFriendsModified,
                ]);

                $Friend = User::where('id', $request->id)->get();
                $FriendAddedFriendsList = $Friend[0]->addedfriends;
                $acceptedFriendIdConcatString = $id . ',';
                $acceptedFriendDataAddedFriendsModified =
                    $acceptedFriendIdConcatString . $FriendAddedFriendsList;
                User::where('id', $request->id)->update([
                    'addedfriends' => $acceptedFriendDataAddedFriendsModified,
                ]);
            } elseif ($request->type == 'unfriend') {
                $user = User::where('id', $id)->get();
                $addedfriendsstring = $user[0]->addedfriends;
                $friendid = $request->id . ',';
                $addedfriendsmodified = str_replace(
                    $friendid,
                    '',
                    $addedfriendsstring
                );
                User::where('id', $id)->update([
                    'addedfriends' => $addedfriendsmodified,
                ]);

                $Friend = User::where('id', $request->id)->get();
                $FriendAddedFriendsList = $Friend[0]->addedfriends;
                $removableFriendIdConcatString = $id . ',';
                $removableFriendaddedfriendsmodified = str_replace(
                    $removableFriendIdConcatString,
                    '',
                    $FriendAddedFriendsList
                );
                User::where('id', $request->id)->update([
                    'addedfriends' => $removableFriendaddedfriendsmodified,
                ]);
            } elseif ($request->type == 'removereq') {
                $user = User::where('id', $id)->get();
                $PendingFriendsList = $user[0]->pendingfriends;
                $removableFriendId = $request->id . ',';
                $removableFriendpendingfriendsmodified = str_replace(
                    $removableFriendId,
                    '',
                    $PendingFriendsList
                );
                User::where('id', $id)->update([
                    'pendingfriends' => $removableFriendpendingfriendsmodified,
                ]);
            } elseif ($request->type == 'cancelreq') {
                $Friend = User::where('id', $request->id)->get();
                $PendingFriendsList = $Friend[0]->pendingfriends;
                $selfDataId = $id . ',';
                $pendingfriendsmodified = str_replace(
                    $selfDataId,
                    '',
                    $PendingFriendsList
                );
                User::where('id', $request->id)->update([
                    'pendingfriends' => $pendingfriendsmodified,
                ]);
            }
        }
    }
}
