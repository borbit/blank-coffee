gulp = require 'gulp'
paths = require './gulpfile_paths'

require './gulpfile_dist'
require './gulpfile_compile'

gulp.task 'default', ['compile'], ->
  gulp.watch paths.globAllLess,   ['compile-page-less']
  gulp.watch paths.globAllCoffee, ['compile-page-coffee']
