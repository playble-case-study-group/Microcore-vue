@extends('layouts.app')

@section('content')

<email :character-emails="{{ $characterEmails }}" :characters="{{ $characters }}">
</email>
@endsection
