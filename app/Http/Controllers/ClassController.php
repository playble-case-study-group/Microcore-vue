<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ClassController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Get a list of instructors classes
        $classes = DB::table('class')
            ->join('instructor_has_class', 'instructor_has_class.class_id', '=', 'class.class_id')
            ->where('instructor_has_class.instructor_id', Auth::id())
            ->get();


        // Get the students in each class
        foreach ($classes as $class) {
            $class->students = DB::table('user_has_class')
                ->join('users', 'users.id', 'user_has_class.user_id')
                ->select('users.id', 'users.name', 'users.email', 'users.current_day')
                ->where('user_has_class.class_id', $class->class_id)
                ->get();

            $class->groups = DB::table('group')
                ->join('class_has_group', 'class_has_group.group_id', 'group.group_id')
                ->select('group.name', 'group.group_id')
                ->where('class_has_group.class_id', $class->class_id)
                ->get();


            // Converting unassigned students to object so they can be removed by key.
            $class->unAssigned = $class->students->keyBy('id');

            foreach ($class->groups as $group) {
                $group->students = DB::table('users')
                    ->join('user_has_group', 'user_has_group.user_id', 'users.id')
                    ->select('users.name', 'users.id')
                    ->where('user_has_group.group_id', $group->group_id)
                    ->get();

                $group->gallery = DB::table('student_gallery')
                    ->where('group_id', $group->group_id)
                    ->get();

                // Removing students who have been assigned
                foreach ($group->students as $student) {
                        $class->unAssigned->forget($student->id);
                }
            }

            // Retrieving individual student assignments
            foreach ($class->students as $student) {
                $student->emails = DB::table('student_email')
                    ->where('user_id', $student->id)
                    ->get();
            }

            // Converting unassigned student back to array so we can iterate through them.
            $class->unAssigned = array_values($class->unAssigned->toArray());

        }

        $assignment_types = DB::table('assignment_type')->select('assign_type_id', 'title', 'table_columns')->get();

        return view('instructors.classes', compact('classes', 'assignment_types'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
