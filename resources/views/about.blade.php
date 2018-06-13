@extends('layouts.app')

@section('content')
    {{--  <h1>This is the editor page</h1>  --}}
    <about :characters="{{$characters}}">

    </about>
@endsection