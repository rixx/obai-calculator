recipes = require 'lib/recipe'
DEFAULT_RECIPE = recipes.obai3

module.exports.getByMass = (mass, recipe) ->
	mass ?= 100
	recipe ?= DEFAULT_RECIPE

	result = {}

	for ingredient,amount of recipe
		result[ingredient] = (amount/100) * mass

	return result


module.exports.getByIngredient = (ingredient, recipe) ->
	ingredient ?=
		citricAcid: 50
	recipe ?= DEFAULT_RECIPE
	{name, amount} for name, amount of ingredient
	mass = (amount * 100) / recipe[name]

	return module.exports.getByMass(mass, recipe)
