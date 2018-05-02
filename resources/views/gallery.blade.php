@extends('layouts.app')

@section('content')
        <gallery :gallery="{{ $gallery }}" :tags="{{ $tags }}"></gallery>
@endsection
