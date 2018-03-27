@extends('layouts.app')

@section('content')

<email :character-emails="{{ $characterEmails }}"
       :characters="{{ $characters }}"
       :student-emails="{{ $studentEmails }}">
</email>
@endsection
