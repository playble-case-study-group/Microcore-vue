@extends('layouts.app')

@section('content')
    <videocall :notes="{{ $notes }}" :videos="{{ $videos }}">

    </videocall>
@endsection