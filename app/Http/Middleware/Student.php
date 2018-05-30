<?php

namespace App\Http\Middleware;

use Closure;
use Auth;

class Student
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $student = 0;
        if (Auth::check() && Auth::user()->role >= $student) {
            return $next($request);
        } else {
            return redirect('/home');
        }
    }
}
