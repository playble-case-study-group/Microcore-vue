@extends('layouts.app')

@section('content')
<<<<<<< HEAD
    <dash :notes="{{ $notes }}" :dash= "{{ $dash }}" :unread="$store.state.notifications.newEmails">
=======
    <dash :notes="{{ $notes }}" :dash= "{{ $dash }}" :title="$store.state.notifications.newEmails">
>>>>>>> 23ae1613c2682474ae9099201263f564a66a50e6

    </dash>
@endsection