<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\UserRole;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('role:manager');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::latest()->paginate(25);

        foreach ($users as $key => $user) {
            $users[$key]['role'] = $user->hasRole('manager');
        }

        return view('users.index', compact('users'))
            ->with('i', (request()->input('page', 1) - 1) * 25);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('users.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'role' => 'required',
        ]);

        if ($request->active == 'active') {
            $active = 1;
        } else {
            $active = 0;
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make('12345678'),
            'active' => $active,
        ]);

        UserRole::create([
            'user_id' => $user->id,
            'role_id' => $request->role,
        ]);

        return redirect()->route('users.index')
            ->with('success', 'User created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\User $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\User $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        return view('users.update', ['user' => $user]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\User $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        if ($request->active == 'active') {
            $active = 1;
        } else {
            $active = 0;
        }

        $user = User::find($user->id);
        $user->name = $request->name;
        $user->email = $request->email;
        $user->active = $active;
        $user->save();

        $user_role = UserRole::where('user_id', '=', $user->id)->first();
        UserRole::where(['user_id' => $user->id, 'role_id' => $user_role->role_id])->update([
            'role_id' => $request->role,
            ]);

        return redirect()->route('users.index')
            ->with('success', 'User updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\User $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        $user->delete();

        return $user;
    }

    public function destroy_selected_users(Request $request)
    {
        foreach ($request->selected_Ids as $id) {
            $user = User::find($id);
            $user->delete();
        }

        return $request->selected_Ids;
    }

    public function suspend_selected_users(Request $request)
    {
        foreach ($request->selected_Ids as $id) {
            $user = User::find($id);
            $user->active = 0;
            $user->save();
        }

        return $request->selected_Ids;
    }
}
