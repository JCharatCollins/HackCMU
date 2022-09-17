extends Node2D

signal activeTilesInvalid
var parsed
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func parseActiveTiles(activeTiles):
	parsed = []
	for tile in activeTiles:
		match tile.get_propType():
			"varp":
				parsed.append("varp")
			"varq":
				parsed.append("varq")
			"land":
				parsed.append("and")
			"lor":
				parsed.append("or")
			"lnot":
				parsed.append("not")
			"implies":
				if parsed.size() > 0:
					parsed.insert(parsed.size()-1, "not")
					parsed.append("or")
				else: 
					#if implies is the first thing in the statement, it won't be valid
					# we could solve this by checking validity first
					parsed.append("not")
					parsed.append("or")
			_: #default
				pass #obviously should never happen

# Returns boolean representing if the given statement makes sense logically
# RULES: (the following don't consider not as a connective)
# 1. No consecutive propositional variables (p p)
# 2. No consecutive connectives (and or)
# 3. No not before a connective (not and)
# 4. Must end with a variable
# 5. Can't start with connective
func check_validity(parsedTiles):
	if parsedTiles.size() == 0:
		return false
		
	var propVars = ["varp", "varq"]
	var logConnectives = ["or", "and", "implies"] #not is a logical connective, but we're allowed to do funny things with it
	
	if parsedTiles[0] in logConnectives:
		return false
	
	for i in range(len(parsedTiles) - 1):
		if parsedTiles[i] in propVars and parsedTiles[i + 1] in propVars:
			return false
		if (parsedTiles[i] in logConnectives or parsedTiles[i] == "not") and parsedTiles[i + 1] in logConnectives:
			return false
	
	if not (parsedTiles[-1] in propVars):
		return false
	return true

# Returns a list of 4 elements:
# ele 0 = value for p = false, q = false
# ele 1 = value for p = false, q = true
# ele 2 = value for p = true, q = false
# ele 3 = value for p = true, q = true
# warning-ignore:shadowed_variable
func truth_table(parsed):
	var table = []
	var parsed_str = ""
	for token in parsed:
		parsed_str += token + " "
	parsed_str.trim_suffix(" ")
	
	var expr = Expression.new()
	expr.parse(parsed_str.replace("varp", "false") \
						.replace("varq", "false"))
	table.append(expr.execute())
	
	expr.parse(parsed_str.replace("varp", "false") \
						.replace("varq", "true"))
	table.append(expr.execute())
	
	expr.parse(parsed_str.replace("varp", "true") \
						.replace("varq", "false"))
	table.append(expr.execute())
	
	expr.parse(parsed_str.replace("varp", "true") \
						.replace("varq", "true"))
	table.append(expr.execute())
	
	return table


func _on_ActiveTiles_checkButton_pressed(activeTiles):
	parseActiveTiles(activeTiles)
	
	if not check_validity(parsed):
		emit_signal("activeTilesInvalid")
		print("this is where mackey devours your soul")
		return
	
	print(truth_table(parsed))
