View = require 'views/base/view'
obai = require 'lib/obai'
recipe = require('lib/recipe').obai3

ingredients =
	sugar: 'sugar'
	guarana: 'guarana'
	citricAcid: 'citric-acid'
	sodiumbicarbonate: 'sodiumbicarbonate'
	aroma: 'aroma'
	caffeine: 'caffeine'

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
		ingredient = $el.data('ingredient')
		arg[ingredient] = Number($el.val())
		@renderCalculation(obai.getByIngredient(arg, recipe), ingredient)

	changedMass: (event) ->
		@renderCalculation(obai.getByMass(Number($('.mass').val()), recipe), 'mass')

	changedTubes: (event) ->
		@renderCalculation(obai.getByMass(Number($('.tubes').val())*4, recipe), 'tubes')

	renderCalculation: (cal, origin) ->
		# table
		for ingredient, cssClass of ingredients
			@$('table .' + cssClass).val cal[ingredient].toFixed 3 unless origin is ingredient
		@$('table .mass').val cal.mass.toFixed 3 unless origin is 'mass'
		@$('table .tubes').val (cal.mass/4).toFixed 2 unless origin is  'tubes'

		# viz

		# caffeineHeight = 95-cal.caffeine/cal.mass*100
		# @$('svg .caffeine').attr 'd', "M 1 #{caffeineHeight} L 1 94 A 5 5 1 0 0 14 94 L 14 #{caffeineHeight}"
