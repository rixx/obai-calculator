View = require 'views/base/view'
obai = require 'lib/obai'
recipe = require('lib/recipe').obai3

module.exports = class CalculatorView extends View
	template: require 'views/templates/calculator'

	events:
		'keyup .ingredient': 'changedIngredient'
		'keyup .mass': 'changedMass'
		'submit form': 'denySubmit'

	changedInput: -> console.log 'WONK'

	denySubmit: (event) ->
		event.preventDefault()

	getTemplateData: ->
		data = super()
		data.recipe = recipe
		return data


	changedIngredient: (event) ->
		console.log $(event.target).data('ingredient')

	changedMass: (event) ->
		console.log event
		console.log $(event.target).val()
		result = obai.getByMass Number($('.mass').val()), recipe
		console.log result
		@renderCalculation result

	renderCalculation: (cal) ->
		@$('.sugar').val cal.sugar
		@$('.guarana').val cal.guarana
		@$('.citric-acid').val cal.citricAcid
		@$('.sodiumbicarbonate').val cal.sodiumbicarbonate
		@$('.aroma').val cal.aroma
		@$('.caffeine').val cal.caffeine
