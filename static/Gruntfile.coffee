module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      options:
        sourceMap: true
      build:
        files:
          'js/register.js': ['src/register.coffee']
          'js/submit.js': ['src/submit.coffee']

  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.registerTask 'default', ['coffee']
