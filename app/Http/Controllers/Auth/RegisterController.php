<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use App\Rules\SimulationKey;
use App\Rules\InstructorKey;
use App\Rules\ClassKey;
use Illuminate\Support\Facades\DB;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        if ($data['class-key']) {
            return Validator::make($data, [
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|max:255|unique:users',
                'password' => 'required|string|min:6|confirmed',
                'sim-key' => ['required', new SimulationKey],
                'class-key' => new ClassKey,
            ]);
        } elseif ($data['instructor-key']) {
            return Validator::make($data, [
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|max:255|unique:users',
                'password' => 'required|string|min:6|confirmed',
                'sim-key' => ['required', new SimulationKey],
                'instructor-key' => new InstructorKey,
            ]);
        } else {
            return Validator::make($data, [
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|max:255|unique:users',
                'password' => 'required|string|min:6|confirmed',
                'sim-key' => ['required', new SimulationKey],
                'class-key' => new ClassKey,
                'instructor-key' => new InstructorKey,
            ]);
        }


    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {

        if ($data['class-key']) {

            // Set role to 0 a and sets class key

            $user = User::create([
                'name' => $data['name'],
                'email' => $data['email'],
                'password' => bcrypt($data['password']),
            ]);

            $classId = DB::table('classes')
                ->where('key', $data['class-key'])
                ->select('class_id')
                ->first();

            DB::table('user_has_class')
                ->insert([
                    'user_id' => $user->id,
                    'class_id' => $classId->class_id
                ]);

            return $user;

        } elseif ($data['instructor-key']) {

            // Sets role to 1
            return User::create([
                'name' => $data['name'],
                'email' => $data['email'],
                'password' => bcrypt($data['password']),
                'role' => 1
            ]);

        }

    }
}
