Blank
=====

Front-end server starter kit based on:
- [Gulp](http://gulpjs.com)
- [Express](http://expressjs.com/)
- [Browserify](http://browserify.org/)
- [CoffeeScript](http://coffeescript.org/)
- [Less](http://lesscss.org/)
- [React](http://facebook.github.io/react/)

Gulp
----

Major part of Blank's architecture is located in `gulpfile.coffee`. Its main responsibilty is preparing of all static files (css, js, images, tempaltes etc.) to be served by http server. Take a look at the tasks list it can do:

- `gulp compile-less`
- `gulp compile-coffee`
- `gulp compile-common`
- `gulp compile`
- `gulp watch`
- `gulp clean`
- `gulp rev`
- `gulp css-rev`
- `gulp css-csso`
- `gulp js-uglify`
- `gulp dist`

Install
-------

```
$ gem install foreman
$ git clone git@github.com:borbit/blank.git
$ cd blank & npm install
```

Run
---

```
$ foreman start
```
