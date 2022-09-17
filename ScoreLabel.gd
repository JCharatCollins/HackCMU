extends Label

var score = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_text(str(score))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_LogicParser_activeTilesCorrect():
	score += 1
	set_text(str(score))
	Hiscore.currentScore = score
	pass # Replace with function body.
