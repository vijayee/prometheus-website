module.exports=(grunt)->
  grunt.initConfig
    pkg:grunt.file.readJSON('package.json')
    copy:
      main:
        files:[{expand: true, cwd:'assets/', src: ['**','!**/*.coffee','!**/*.scss', '!**/*.sass'], dest: 'public/'}]
    clean:
      main:
        src:['public/**','public/!**/*.coffee']
    coffee:
      glob_to_multiple:
        options:
          sourceMap: false
        expand: true
        cwd: 'assets/'
        src: ['**/*.coffee']
        dest: 'public/'
        ext: '.js'
    sass:
      dist:
        files:[{
            expand: true,
            cwd: 'assets/'
            src: ['**/*.scss']
            dest: 'public/'
            ext: '.css'
        }]
    watch:
      files:['assets/**']
      tasks:['clean', 'copy','coffee','sass']

  grunt.loadNpmTasks('grunt-contrib-sass')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.registerTask('default', ['clean','copy', 'coffee','sass'])