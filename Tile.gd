extends AnimatedSprite

var propType = "default"
var gridLocation = Vector2(0, 0)

func init_tile(var type, var x, var y):
	propType = type
	gridLocation.x = x
	gridLocation.y = y
	play(propType)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_position(gridLocation)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
