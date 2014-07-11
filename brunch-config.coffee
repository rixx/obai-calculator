exports.config =
	# See http://brunch.io/#documentation for docs.
	files:
		javascripts:
			joinTo:
				'js/app.js': /^app(\/|\\)(?!vendor)/
				'js/vendor.js': /^(?!app)/
		stylesheets:
			joinTo: 'css/app.css'
		templates:
			joinTo: 'js/app.js'
	plugins:
		static_jade:
			extension: ".static.jade"