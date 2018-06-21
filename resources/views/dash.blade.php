@extends('layouts.app')

@section('content')
    <dash :notes="{{ $notes }}" :dash= "{{ $dash }}" :unread="$store.state.notifications.newEmails">

    </dash>
@endsection