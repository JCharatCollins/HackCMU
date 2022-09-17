extends Label

var score = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func parse_score(score):
	return "Score: " + str(score)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_text(parse_score(score))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_LogicParser_activeTilesCorrect():
	score += 1
	set_text(parse_score(score))
	Hiscore.currentScore = score
	pass # Replace with function body.
