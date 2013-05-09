module.exports = function(grunt) {
	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		concat: {
			options: {
				// define a string to put between each file in the concatenated output
				separator: ';'
			},
			dist: {
				// the files to concatenate
				src: ['assets/js/**/*.js'],
				// the location of the resulting JS file
				dest: 'assets/<%= pkg.name %>.js'
			}
		},
		uglify: {
			options: {
				// the banner is inserted at the top of the output
				banner: '/*! <%= pkg.name %> - Minified on <%= grunt.template.today("dd-mm-yyyy") %> */\n'
			},
			dist: {
				files: {
					'assets/<%= pkg.name %>.min.js': ['<%= concat.dist.dest %>']
				}
			}
		},
		jshint: {
			// define the files to lint
			files: ['gruntfile.js', 'src/**/*.js', 'test/**/*.js'],
			// configure JSHint (documented at http://www.jshint.com/docs/)
			options: {
				// more options here if you want to override JSHint defaults
				globals: {
					jQuery: true,
					console: true,
					document: true,
					module: true,
					Backbone: true,
					Marionette: true,
					Handlebars: true
				}
			}
		},
		handlebars: {
			compile: {
				options: {
					namespace: "JST",
					wrapped: "true",
					processName: function(filename) {
						var pieces = filename.split("/"),
							// -1 because length returns in normal length, not 0 indexed
							length = pieces.length - 1,
							namespace = "",
							template_index = pieces.indexOf('templates');

						for (var i = template_index + 1; i <= length ; i++) {
							namespace += pieces[i] + "/";
						}
						namespace = namespace.replace(/\/?\.handlebars\/?/i, "");
						return namespace;
					}
				},
				files: {
					"./app/assets/javascripts/app/templates/JSTemplates.js": [
						"./app/assets/javascripts/app/templates/*/*.handlebars",
						"./app/assets/javascripts/app/templates/*.handlebars",
						"./app/assets/javascripts/app/templates/*/*.hbs",
						"./app/assets/javascripts/app/templates/*.hbs"
					]
				}
			}
		}
	});
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-handlebars');

	grunt.registerTask('compile-handlebars', ['handlebars']);

};