@extends('layouts.app')

@section('content')
    <dash :notes="{{ $notes }}" :dash= "{{ $dash }}" :title="$store.state.notifications.newEmails">

    </dash>
@endsection