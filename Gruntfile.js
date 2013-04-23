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
      },
      compiled: {
        files: [
          '<%= config.tmp %>/<%= config.lib %>/**/*.js',
          '<%= config.tmp %>/<%= config.test %>/**/*.js'
        ],
        tasks: ['test:compiled']
      }
    },
    clean: {
      server: '<%= config.tmp %>'
    },
    coffee: {
      compile: {
        expand: true,
        src: [
          '<%= config.lib %>/**/*.coffee',
          '<%= config.test %>/**/*.coffee'
        ],
        dest: '<%= config.tmp %>',
        ext: '.js',
        options: {
          sourceMap: true
        }
      }
    },
    mochaTest: {
      lib: ['<%= config.test %>/**/*_test.coffee'],
      compiled: ['<%= config.tmp %>/<%= config.test %>/**/*_test.js']
    },
    mochaTestConfig: {
      lib: {
        options: {
          reporter: 'spec',
          compiler: 'coffee:coffee-script'
        }
      },
      compiled: {
        options: {
          reporter: 'spec'
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
