module.exports = (grunt)->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      compile:
        files:
          'public/js/app.js' : ['app/**/*.coffee']
        options:
          join: yes
          # bare: yes
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
        tasks: ['coffee']
        spawn: yes

      templates:
        files: 'app/**/*.jade'
        tasks: ['jade']
        spawn: yes

    jade:
      default:
        options:
          client: no
          wrap: no
          basePath: 'app/'
        files:
          'public/': ['app/**/*.jade']

    connect:
      server:
        options:
          port: 9001
          base: 'public'

  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-jade'
  grunt.loadNpmTasks 'grunt-regarde'

  grunt.registerTask 'default', ['connect', 'regarde']