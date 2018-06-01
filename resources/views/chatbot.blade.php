@extends('layouts.app')

@section('content')
    <slackbot :msgs="{{ $chats }}" :channels="{{ $channels }}"></slackbot>
@endsection