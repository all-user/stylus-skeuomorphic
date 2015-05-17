gulp   = require 'gulp'
stylus = require 'gulp-stylus'
nib    = require 'nib'

gulp.task 'stylus', ->
  gulp.src './example/**/main*.styl'
    .pipe stylus(use: [nib()])
    .pipe gulp.dest './example/'
