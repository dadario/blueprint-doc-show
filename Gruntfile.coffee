module.exports = (grunt) ->
  grunt.initConfig
    env:
      dev:
        NODE_ENV: 'development'
      test:
        NODE_ENV: 'test'
      prod:
        NODE_ENV: 'production'
    coffeelint:
        app: ['app/**/*.coffee', 'config/**/*.coffee']
        tests: ['tests/**/*.coffee']
        options:
          configFile: 'coffeelint.json'
    mochaTest:
      src: ['tests/**/*.coffee']
      options:
        colors: true
        reporter: 'progress'
        clearRequireCache: true
    nodemon:
      dev:
        script: 'server.coffee'
        options:
          ext: 'js,coffee'
          debug: true
    watch:
      application:
        files: ['app/**/*.coffee', 'config/**/*.coffee', 'tests/**/*.coffee']
        tasks: ['test']
      gruntfile:
        files: ['Gruntfile.coffee', 'config/**/*.coffee']
        options:
          reload: true
      scripts:
        files: ['app/public/javascripts/jsx/**/*.js']
        tasks: ['react']

    concurrent:
      dev:
        tasks: ['nodemon', 'watch']
        options:
          logConcurrentOutput: true
      prod:
        tasks: ['nodemon']
        options:
          logConcurrentOutput: false
    react:
      dynamic_mappings:
        files: [{
          expand: true,
          cwd: 'app/public/javascripts/jsx',
          src: ['**/*.js'],
          dest: 'app/public/javascripts/jsx_compiled',
          ext: '.js'
        }]

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-env'
  grunt.loadNpmTasks 'grunt-nodemon'
  grunt.loadNpmTasks 'grunt-mocha-test'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-react'

  grunt.registerTask 'default', ['env:dev', 'lint', 'concurrent']
  grunt.registerTask 'lint', 'coffeelint'
  grunt.registerTask 'test', ['env:test', 'mochaTest', 'lint']

  grunt.task.run ['react']
