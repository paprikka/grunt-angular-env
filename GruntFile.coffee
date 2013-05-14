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
      vendorScripts:
        # Put specific bower-related vendor imports here. Don't include complete vendor dir.
        src: [
          'vendor/angular/angular.js'
          'vendor/angular-cookies/angular-cookies.js'
          'vendor/angular-mocks/angular-mocks.js'
          'vendor/angular-resource/angular-resource.js'
          'vendor/angular-sanitize/angular-sanitize.js'
          'vendor/angular-polyfill/angular-polyfill.js'
        ]
        dest: 'public/js/vendor.js'

    regarde:
      scripts:
        files: 'app/**/*.coffee'
        tasks: ['clean:scripts', 'copy:assets', 'coffee', 'concat:vendorScripts', 'livereload']

      templates:
        files: 'app/**/*.jade'
        tasks: ['clean:templates', 'copy:assets', 'jade', 'livereload']

      styles:
        files: 'app/**/*.styl'
        tasks: ['clean:styles', 'copy:assets', 'stylus', 'livereload']

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

    copy:
      assets:
        files:[
          src:['**'], dest:'public/', cwd:'assets/', expand: yes
        ]

    clean:
      public:
        src: ['public/']
      templates:
        src: ['public/partials/', 'public/index.html']
      scripts:
        src: ['public/js/']
      styles:
        src: ['public/css/']

    bower:
      install:
        options:
          targetDir: './vendor',
          layout: 'byType',
          install: yes,
          verbose: no,
          cleanTargetDir: yes,
          cleanBowerDir: yes

  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-livereload'
  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-jade'
  grunt.loadNpmTasks 'grunt-regarde'

  grunt.registerTask 'default', ['livereload-start', 'connect', 'regarde']
  grunt.registerTask 'base', ['clean:public', 'copy:assets', 'coffee', 'jade', 'stylus']
