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

Major part of Blank's architecture is located in the `gulpfile.coffee`. It's main responsibilty is to prepare all the static files (css, js, images, tempaltes etc.) to be served by our http server. Let's have a look at the list of tasks it can do for us:

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
