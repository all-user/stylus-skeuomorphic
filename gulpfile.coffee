gulp   = require 'gulp'
stylus = require 'gulp-stylus'
nib    = require 'nib'

gulp.task 'stylus', ->
  gulp.src './examples/**/main.styl'
    .pipe stylus(use: [nib()])
    .pipe gulp.dest './examples/'


gulp.task 'stylus:cassette_deck', ->
  gulp.src './examples/cassette_deck/main.styl'
    .pipe stylus(use: [nib()])
    .pipe gulp.dest './examples/cassette_deck/'
