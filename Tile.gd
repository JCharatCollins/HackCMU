extends AnimatedSprite

var propType = "default"
var gridLocation = Vector2(0, 0)

func get_gridLocation():
	return gridLocation

func get_propType():
	return propType

func init_tile(var type, var x, var y, var setScale):
	propType = type
	gridLocation.x = x
	gridLocation.y = y
	set_scale(Vector2(setScale, setScale))
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
