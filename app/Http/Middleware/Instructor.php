<?php

namespace App\Http\Middleware;

use Closure;
use Auth;

class Instructor
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
        $instructor = 1;
        if (Auth::check() && Auth::user()->role >= $instructor) {
            return $next($request);
        } else {
            return redirect('/home');
        }
    }
}
