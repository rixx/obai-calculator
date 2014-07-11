DEFAULT_RECIPE = 
	sugar: 81.84
	guarana: 6.19
	citricAcid: 5.29
	sodiumbicarbonate: 2.59
	aroma: 2.5
	caffeine: 1.6

module.exports.getByMass = (mass, recipe) ->
	mass ?= 100
	recipe ?= DEFAULT_RECIPE

	result = {}

	for ingredient,amount of recipe
		result[ingredient] = (amount/100) * mass

	return result
