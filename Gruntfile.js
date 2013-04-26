'use strict';

module.exports = function(grunt) {

  // load all grunt tasks
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  var config = {
    lib: 'lib',
    spec: 'spec',
    tmp: '.tmp'
  };

  grunt.initConfig({
    config: config,
    watch: {
      lib: {
        files: [
          '<%= config.lib %>/**/*.coffee',
          '<%= config.spec %>/**/*.coffee'
        ],
        tasks: ['spec']
      },
      compiled: {
        files: [
          '<%= config.tmp %>/<%= config.lib %>/**/*.js',
          '<%= config.tmp %>/<%= config.spec %>/**/*.js'
        ],
        tasks: ['spec:compiled']
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
          '<%= config.spec %>/**/*.coffee'
        ],
        dest: '<%= config.tmp %>',
        ext: '.js',
        options: {
          sourceMap: true
        }
      }
    },
    mochaTest: {
      lib: ['<%= config.spec %>/**/*_spec.coffee'],
      compiled: ['<%= config.tmp %>/<%= config.spec %>/**/*_spec.js']
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
  grunt.registerTask('spec', ['mochaTest:lib']);
  grunt.registerTask('spec:compiled', [
    'coffee:compile',
    'mochaTest:compiled'
  ]);

  // Default task.
  grunt.registerTask('default', ['mochaTest:lib']);
};
