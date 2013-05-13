'use strict';

module.exports = function(grunt) {

  // load all grunt tasks
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  var config = {
    lib: 'lib',
    test: 'test'
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
//          reporter: 'spec'
        }
      }
    }
  });

  grunt.registerTask('test', ['mochaTest:lib']);

  // Default task.
  grunt.registerTask('default', ['mochaTest:lib']);
};
