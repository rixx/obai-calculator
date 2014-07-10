Application = require 'application'
routes = require 'routes'

# Initialize the application on DOM ready event.
$ ->
	new Application {
		title: 'obai cal',
		controllerSuffix: '_controller',
		routes
	}