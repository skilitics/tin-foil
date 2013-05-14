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
    coffeelint: {
      all: ['<%= config.lib %>/**/*.coffee', '<%= config.test %>/**/*.coffee'],
      options: {
        max_line_length: 'warn',
        value: 1800
      }
    },
    mochaTest: {
      spec: ['<%= config.test %>/**/*.coffee'],
      teamcity: ['<%= config.test %>/**/*.coffee'],
      min: ['<%= config.test %>/**/*.coffee']
    },
    mochaTestConfig: {
      spec: {
        options: {
          reporter: 'spec'
        }
      },
      min: {
        options: {
          reporter: 'min'
        }
      },
      teamcity: {
        options: {
          reporter: 'teamcity'
        }
      }
    },
    watch: {
      scripts: {
        files: ['<%= config.lib %>/**/*.coffee', '<%= config.test %>/**/*.coffee'],
        tasks: ['lint', 'spec:min']
      }
    }
  });

  grunt.registerTask('lint', ['coffeelint:all']);
  grunt.registerTask('spec', ['mochaTest:spec']);
  grunt.registerTask('spec:min', ['mochaTest:min']);
  grunt.registerTask('teamcity', [/*'lint', */'mochaTest:teamcity']);
  grunt.registerTask('default', [/*'lint', */'spec']);
};
