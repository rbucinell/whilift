const gulp    = require( 'gulp' );
const pug     = require( 'gulp-pug');
    
var source = 'src';
var dest = 'compiled';

gulp.task('copy-css',  ()=> gulp.src(`${source}/css/*.css`).pipe(gulp.dest(`${dest}/css`)));
gulp.task('copy-fonts',()=> gulp.src(`${source}/fonts/*`  ).pipe(gulp.dest(`${dest}/fonts/`)));
gulp.task('copy-img',  ()=> gulp.src(`${source}/img/**/*` ).pipe(gulp.dest(`${dest}/img/`)));
gulp.task('copy-js',   ()=> gulp.src(`${source}/js/*.js`  ).pipe(gulp.dest(`${dest}/js/`)));

gulp.task( 'copy-all', gulp.parallel( ['copy-css', 'copy-fonts','copy-img', 'copy-js'] ));

// Compile main pug pages into HTML
gulp.task('build-pug', function(){
	return gulp.src([`${source}/layouts/*.pug`,`!${source}/layouts/partials*.pug`])
		.pipe(pug(
			{
				pretty: true
			}
		))
		.pipe( gulp.dest( dest ));
});

gulp.task( 'watch:pug' , function(){
	gulp.watch( source + '/layouts/*.pug', gulp.task('build-pug') );
});

gulp.task( 'release' , gulp.parallel(['build-pug', 'copy-all' ]) );