fs             = require 'fs'
gulp           = require 'gulp'
gulpLess       = require 'gulp-less'
gulpRename     = require 'gulp-rename'
gulpBrowserify = require 'gulp-browserify'
gulpBase64     = require 'gulp-base64'
gulpClean      = require 'gulp-clean'
paths          = require './gulpfile_paths'

#
#
gulp.task 'compile-page-less', ->
  compile = gulpLess
    relativeUrls: true
    rootpath: '/blocks'

  compile.on 'error', (err) ->
    console.log 'less', err

  base64Encode = gulpBase64
    extensions: [/#datauri/i]
    baseDir: './public'

  gulp
    .src(paths.globPageLess)
    .pipe(compile)
    .pipe(gulpRename extname: '.css')
    .pipe(base64Encode)
    .pipe(gulp.dest paths.assetsDir)

#
#
gulp.task 'compile-common-less', ->
  compile = gulpLess
    relativeUrls: true
    rootpath: '/blocks'

  compile.on 'error', (err) ->
    console.log 'less', err

  base64Encode = gulpBase64
    extensions: [/#datauri/i]
    baseDir: './public'

  gulp
    .src(paths.commonLess)
    .pipe(compile)
    .pipe(gulpRename extname: '.css')
    .pipe(base64Encode)
    .pipe(gulp.dest paths.assetsDir)

#
#
gulp.task 'compile-page-coffee', ->
  compile = gulpBrowserify
    extensions: ['.coffee']
    detectGlobals: no

  compile.once 'prebundle', (bundler) ->
    bundler.transform 'browserify-ejs'
    bundler.transform {sourceMap: no, coffeeout: yes}, 'coffee-reactify'
    bundler.transform 'coffeeify'
    bundler.transform {'NODE_ENV': ':)'}, 'envify'

  compile.on 'prebundle', (bundler) ->
    getExternalModules().forEach (module) ->
      bundler.exclude module.name

  compile.on 'error', (err) ->
    console.log 'coffee', err

  gulp
    .src(paths.globPageCoffee, read: no)
    .pipe(compile)
    .pipe(gulpRename extname: '.js')
    .pipe(gulp.dest paths.assetsDir)

#
#
gulp.task 'compile-common-coffee', ->
  compile = gulpBrowserify
    extensions: ['.coffee']
    detectGlobals: false

  compile.once 'prebundle', (bundler) ->
    bundler.transform 'coffeeify'
    bundler.transform {NODE_ENV: ':)'}, 'envify'

    getExternalModules().forEach (module) ->
      bundler.require module.path, expose: module.name

  compile.on 'error', (err) ->
    console.log err

  gulp
    .src(paths.commonCoffee, read: false)
    .pipe(compile)
    .pipe(gulpRename extname: '.js')
    .pipe(gulp.dest paths.assetsDir)

#
#
gulp.task 'compile', [
  'compile-common-less'
  'compile-common-coffee'
  'compile-page-less'
  'compile-page-coffee'
]

# synchroniously read common.coffee and parse
# all the path and names of modules it exposes
# returns: [
#   {path: '../js/libs/jquery.transit.js', name: 'jquery.transit.js'},
#   {path: '../js/libs/jquery.ui.js', name: 'jquery.ui.js'}
# ]
getExternalModules = ->
  callee = getExternalModules
  
  if callee.modules
    return callee.modules 

  regexp = /require\s*'(.+)'\s*#@expose(\s*as\s*(.+))?/ig
  content = fs.readFileSync paths.commonCoffee
  modules = []
  
  while found = regexp.exec content
    modules.push {
      path: found[1]
      name: found[3] or found[1]
    }

  callee.modules = modules
