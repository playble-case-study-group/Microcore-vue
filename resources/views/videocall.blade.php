@extends('layouts.app')

@section('content')
    <videocall :notes="{{ $notes }}"
               :calls="{{ $calls }}"
               :questions="{{ json_encode( $questions) }}"
               :contacts="{{ $contacts }}"
               :disabled="{{ $clicked_questions }}">

    </videocall>
@endsection