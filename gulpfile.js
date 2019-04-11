"use strict";

var gulp    = require( 'gulp' ),
    contact = require( 'gulp-concat'),
    watch   = require( 'gulp-watch'),
    pug     = require('gulp-pug');
    
var source = 'src/';
var dest = 'dist/';

var paths = {
    scripts: [
        'node_modules/bootstrap/dist/js/bootstrap.min.js',
    ],
    content: {
        libraries: [
            'nodes_modules/bootstrap/dist/css/bootstrap.min.css'
        ],
        libmin: 	dest + '/css/lib.min.css',
		stylemin: 	dest + '/css/style.min.css'
    }
}

// Compile main pug pages into HTML
gulp.task('build-pug', function(){
	return gulp.src([`${source}layouts/*.pug`,`!${source}layouts/partials*.pug`])
		.pipe(pug(
			{
				pretty: true
			}
		))
		.pipe( gulp.dest( dest ));
});

gulp.task( 'watch:pug' , function(){
	gulp.watch( source + 'layouts/**/*.pug', gulp.task('build-pug') );
});
