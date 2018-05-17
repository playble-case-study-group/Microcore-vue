@extends('layouts.app')

@section('content')
    <classes :classes="{{ $classes }}" :assignment-types="{{ $assignment_types }}" ></classes>
@endsection
