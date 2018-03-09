@extends('layouts.app')

@section('content')
    <videocall :notes="{{ $notes }}" :videos="{{ $videos }}" :contacts="{{ $contacts }}">

    </videocall>
@endsection