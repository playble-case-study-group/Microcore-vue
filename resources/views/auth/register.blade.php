@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Register</div>

                <div class="panel-body">
                    <form class="form-horizontal" method="POST" action="{{ route('register') }}">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label">Name</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}" required autofocus>

                                @if ($errors->has('name'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="col-md-4 control-label">E-Mail Address</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required>

                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <label for="password" class="col-md-4 control-label">Password</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control" name="password" required>

                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password-confirm" class="col-md-4 control-label">Confirm Password</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
                            </div>
                        </div>

                        <hr>

                        {{-- Simulation Key --}}

                        <div class="form-group{{ $errors->has('sim-key') ? ' has-error' : '' }}">
                            <label for="sim-key" class="col-md-4 control-label">Simulation Key</label>

                            <div class="col-md-6">
                                <input id="sim-key" type="sim-key" class="form-control" name="sim-key" required>

                                @if ($errors->has('sim-key'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('sim-key') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>


                        <hr>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                    <label class="btn btn-primary" onclick="role('student')">
                                        <input type="radio" name="options" id="student" onclick="role('student')" autocomplete="off"> Student
                                    </label>
                                    <label class="btn btn-primary" onclick="role('teacher')">
                                        <input type="radio" name="options" id="teacher" onclick="role('teacher')" autocomplete="off"> Teacher
                                    </label>
                                </div>
                            </div>
                        </div>

                        {{-- Student Form --}}

                        <div id="student-form" class="hidden">
                            <div class="form-group{{ $errors->has('class-key') ? ' has-error' : '' }}">
                                <label for="class-key" class="col-md-4 control-label">Class Key</label>

                                <div class="col-md-6">
                                    <input id="class-key" type="class-key" class="form-control" name="class-key">

                                    @if ($errors->has('class-key'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('class-key') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                        </div>


                        {{-- Teacher Form --}}

                        <div id="teacher-form" class="hidden">
                            <div class="form-group{{ $errors->has('instructor-key') ? ' has-error' : '' }}">
                                <label for="instructor-key" class="col-md-4 control-label">Instructor Key</label>

                                <div class="col-md-6">
                                    <input id="instructor-key" type="instructor-key" class="form-control" name="instructor-key">

                                    @if ($errors->has('instructor-key'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('instructor-key') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                        </div>

                        <hr>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    Register
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

@section('page-script')

    <script type="text/javascript">

        function role(role) {
            console.log(role);
            if (role === 'student') {
                $('#teacher-form').addClass('hidden').val('');
                $('#student-form').removeClass('hidden');
            } else {
                $('#student-form').addClass('hidden').val('');
                $('#teacher-form').removeClass('hidden');
            }
        }
    </script>
@endsection
