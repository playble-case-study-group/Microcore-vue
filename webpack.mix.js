let mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/assets/js/app.js', 'public/js')
   .sass('resources/assets/sass/app.scss', 'public/css')
<<<<<<< HEAD
   .browserSync('http://microcore.localhost');
=======
   .browserSync('http://vuesim.local');
>>>>>>> 23ae1613c2682474ae9099201263f564a66a50e6

