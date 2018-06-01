@extends('layouts.app')

@section('content')
    <dash :notes=" {{ $notes }}" :dash= "{{ $dash }}">

    </dash>
@endsection