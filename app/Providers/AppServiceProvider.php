<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Nav;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
//        view()->composer('partials.nav', function($view)
//            {
//                $view->with('notifications', Nav::getNotifications());
//            });
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
