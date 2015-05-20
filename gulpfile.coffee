gulp   = require 'gulp'
stylus = require 'gulp-stylus'
nib    = require 'nib'

gulp.task 'stylus', ->
  gulp.src './example/**/main*.styl'
    .pipe stylus(use: [nib()])
    .pipe gulp.dest './example/'


gulp.task 'stylus:cassette_deck', ->
  gulp.src './example/cassette_deck/main*.styl'
    .pipe stylus(use: [nib()])
    .pipe gulp.dest './example/cassette_deck/'
