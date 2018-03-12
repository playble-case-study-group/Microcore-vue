@extends('layouts.app')

@section('content')
    <phone :calls="{{ $calls }}" :questions="{{ json_encode($questions) }}"></phone>
@endsection