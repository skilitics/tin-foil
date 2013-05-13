'use strict';

module.exports = function(grunt) {

  // load all grunt tasks
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  var config = {
    lib: 'lib',
    test: 'test',
    tmp: '.tmp'
  };

  grunt.initConfig({
    config: config,
    watch: {
      lib: {
        files: [
          '<%= config.lib %>/**/*.coffee',
          '<%= config.test %>/**/*.coffee'
        ],
        tasks: ['test']
      }
    },
    mochaTest: {
      lib: ['<%= config.test %>/**/*.coffee']
    },
    mochaTestConfig: {
      lib: {
        options: {
          reporter: 'spec',
          compiler: 'coffee:coffee-script'
        }
      }
    }
  });

  grunt.registerTask('compile', ['coffee:compile']);
  grunt.registerTask('test', ['mochaTest:lib']);
  grunt.registerTask('test:compiled', [
    'coffee:compile',
    'mochaTest:compiled'
  ]);

  // Default task.
  grunt.registerTask('default', ['mochaTest:lib']);
};
