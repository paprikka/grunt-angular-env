# path          = require('path')
# lrSnippet     = require('grunt-contrib-livereload/lib/utils').livereloadSnippet
# folderMount   = (connect, point)-> connect.static path.resolve point

module.exports = (grunt)->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    coffee:
      compile:
        files:
          'public/js/app.js' : ['app/**/*.coffee']
        options:
          join: yes

    concat:
      options:
        separator: ';'
      dist:
        src: [
          'vendor/**/*.js'
        ]
        dest: 'public/js/vendor.js'

    regarde:
      scripts:
        files: 'app/**/*.coffee'
        tasks: ['coffee', 'livereload']
        # spawn: yes

      templates:
        files: 'app/**/*.jade'
        tasks: ['jade', 'livereload']

      styles:
        files: 'app/**/*.styl'
        tasks: ['stylus', 'livereload']
        # spawn: yes

    jade:
      default:
        options:
          client: no
          wrap: no
          basePath: 'app/'
          pretty: yes
        files:
          'public/': ['app/**/*.jade']

    stylus:
      compile:
        files:
            'public/css/app.css' : ['app/styles/app.styl']

    livereload:
      port: 35729

    connect:
      livereload:
        options:
          port: 9001
          base: 'public'
          # middleware: (connect, options)-> [lrSnippet, folderMount(connect, options.base)]

  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-livereload'
  grunt.loadNpmTasks 'grunt-jade'
  grunt.loadNpmTasks 'grunt-regarde'

  grunt.registerTask 'default', ['livereload-start', 'connect', 'regarde']