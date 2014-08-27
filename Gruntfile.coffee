module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

  grunt.ports =
    livereload: 35729
    connect: 8000
    easymock: 8001
    specs: 9999

  grunt.appDir = 'app'
  grunt.publicDir = 'www'
  grunt.iosDir = 'platforms/ios/www'
  grunt.androidDir = 'platforms/android/assets/www'
  grunt.testDir = 'specs'
  grunt.nodeWebkitDir = 'webkitbuilds'

  require('load-grunt-config')(grunt)

  grunt.registerTask 'ios', [
    'build:development'
    'copy:ios'
    'server:development'
  ]

  grunt.registerTask 'desktop', [
    'build:staging'
    'clean:desktop'
    'nodewebkit:desktop'
  ]

  grunt.registerTask 'default', [
    'ios'
  ]

  grunt.registerTask 'test', [
    'coffeelint:development'
    'coffee:development'
    'karma'
  ]

  grunt.registerTask 'w:ipad', [
    'shell:webinspector_ipad'
  ]

  grunt.registerTask 'w:iphone', [
    'shell:webinspector_iphone'
  ]
