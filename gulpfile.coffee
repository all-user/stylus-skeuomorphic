gulp   = require 'gulp'
stylus = require 'gulp-stylus'
nib    = require 'nib'

gulp.task 'stylus', ->
  gulp.src './examples/**/main*.styl'
    .pipe stylus(use: [nib()])
    .pipe gulp.dest './examples/'


gulp.task 'stylus:blog', ->
  gulp.src './examples/**/main*.styl'
    .pipe stylus(use: [nib()])
    .pipe gulp.dest '/workspace/all-user.org/memowomome/css/css-skeu/'

gulp.task 'default', ['stylus']
