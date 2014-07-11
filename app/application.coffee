CalculatorView = require 'views/calculator'

module.exports = class Application
	constructor: ->
		view = new CalculatorView()
		view.render()
		$('body').append view.$el