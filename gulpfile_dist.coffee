gulp         = require 'gulp'
gulpRev      = require 'gulp-rev'
gulpReplace  = require 'gulp-replace'
gulpUglify   = require 'gulp-uglify'
gulpCSSO     = require 'gulp-csso'
paths        = require './gulpfile_paths'

#
#
gulp.task 'images', ['clean'], ->
  gulp
    .src(paths.globAllImg)
    .pipe(gulp.dest paths.assetsDir)

#
#
gulp.task 'rev', ['compile', 'images'], ->
  filesToRev = [
    paths.globAssetsImg
    paths.globAssetsCss
    paths.globAssetsJs
  ]

  gulp
    .src(filesToRev)
    .pipe(gulpRev())
    .pipe(gulp.dest paths.assetsDir)
    .pipe(gulpRev.manifest())
    .pipe(gulp.dest paths.assetsDir)

#
#
gulp.task 'css-rev', ['rev'], ->
  regexp = /url\([^data:image]['"]?([^\)'"]*)['"]?\)/g
  replace = gulpReplace regexp, (_, url) ->
    "url(\"#{url}\")"

  gulp
    .src("#{paths.assetsDir}/**/*.css")
    .pipe(replace)
    .pipe(gulp.dest paths.assetsDir)

#
#
gulp.task 'css-csso', ['css-rev'], ->
  gulp
    .src("#{paths.assetsDir}/**/*.css")
    .pipe(gulpCSSO())
    .pipe(gulp.dest paths.assetsDir)

#
#
gulp.task 'js-uglify', ['rev'], ->
  gulp
    .src("#{paths.assetsDir}/**/*.js")
    .pipe(gulpUglify())
    .pipe(gulp.dest paths.assetsDir)

#
#
gulp.task 'dist', [
  'rev'
  'css-csso'
  'js-uglify'
]