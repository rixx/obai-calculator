View = require 'views/base/view'
obai = require 'lib/obai'
recipe = require('lib/recipe').obai3

module.exports = class CalculatorView extends View
	template: require 'views/templates/calculator'

	events:
		'keyup .ingredient': 'changedIngredient'
		'keyup .mass': 'changedMass'
		'keyup .tubes': 'changedTubes'
		'submit form': 'denySubmit'

	changedInput: -> console.log 'WONK'

	denySubmit: (event) ->
		event.preventDefault()

	getTemplateData: ->
		data = super()
		data.recipe = recipe
		return data


	changedIngredient: (event) ->
		$el = $ event.target
		arg = {}
		arg[$el.data('ingredient')] = Number($el.val())
		console.log arg
		@renderCalculation obai.getByIngredient arg, recipe

	changedMass: (event) ->
		@renderCalculation obai.getByMass Number($('.mass').val()), recipe

	changedTubes: (event) ->
		@renderCalculation obai.getByMass Number($('.tubes').val())*4, recipe

	renderCalculation: (cal) ->
		# table
		@$('table .sugar').val cal.sugar
		@$('table .guarana').val cal.guarana
		@$('table .citric-acid').val cal.citricAcid
		@$('table .sodiumbicarbonate').val cal.sodiumbicarbonate
		@$('table .aroma').val cal.aroma
		@$('table .caffeine').val cal.caffeine
		@$('table .mass').val cal.mass
		@$('table .tubes').val cal.mass/4

		# viz

		caffeineHeight = 95-cal.caffeine/cal.mass*100
		@$('svg .caffeine').attr 'd', "M 1 #{caffeineHeight} L 1 94 A 5 5 1 0 0 14 94 L 14 #{caffeineHeight}"
