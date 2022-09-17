extends Node2D

var propVars = ["varp", "varq"]
var logConnectives = ["or", "and", "implies"] #not is a logical connective, but we're allowed to do funny things with it

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
				parsed.append("implies")
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

func parse_to_sentence(parsed):
	var parsed_str = ""
	for token in parsed:
		parsed_str += token
		if token in propVars:
			parsed_str = "(" + parsed_str + ")"
		parsed_str += " "
		
	parsed_str.trim_suffix(" ")
	
	return parsed_str
	
func eval(parsed, varp, varq):
	
	var expr = Expression.new()
	
	if parsed.count("(") <= 1:
		if "implies" in parsed:
			var impl_idx = parsed.find("implies")
			parsed = "(not " + parsed.substr(1, impl_idx - 1) + " or" + parsed.substr(impl_idx + 7)

		expr.parse(parsed.replace("varp", str(varp).to_lower()) \
						.replace("varq", str(varq).to_lower()))
		
		print(expr.get_error_text())
		return expr.execute()
	
	var earliest_close_idx = parsed.find(")")
	var latest_open_idx = parsed.substr(0, earliest_close_idx).find_last("(")
	var substr = parsed.substr(latest_open_idx, earliest_close_idx - latest_open_idx + 1)
	
	if "implies" in substr:
		var impl_idx = substr.find("implies")
		substr = "(not " + substr.substr(1, impl_idx - 1) + " or" + substr.substr(impl_idx + 7)
	
	expr.parse(substr.replace("varp", str(varp).to_lower()) \
						.replace("varq", str(varq).to_lower())) 
	var newstr = parsed.substr(0, latest_open_idx) + str(expr.execute()).to_lower() + parsed.substr(earliest_close_idx + 1)
	
	return eval(newstr, varp, varq)
	
	

# Returns a list of 4 elements:
# ele 0 = value for p = false, q = false
# ele 1 = value for p = false, q = true
# ele 2 = value for p = true, q = false
# ele 3 = value for p = true, q = true
# warning-ignore:shadowed_variable
func truth_table(sentence):
	
	var table = []
	
	table.append(eval(sentence, false, false))
	table.append(eval(sentence, false, true))
	table.append(eval(sentence, true, false))
	table.append(eval(sentence, true, true))
	
	return table

func _on_ActiveTiles_checkButton_pressed(activeTiles):
	
	parseActiveTiles(activeTiles)
	
	if not check_validity(parsed):
		emit_signal("activeTilesInvalid")
		print("this is where mackey devours your soul")
		return
	
	print(parse_to_sentence(parsed))
	
	print(truth_table(parse_to_sentence(parsed)))