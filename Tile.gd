extends Area2D

var propType = "default"
var gridLocation = Vector2(0, 0)
var worldLocation = Vector2(0, 0)
var grid

var selected = false
var lastSelected = false

signal tile_clicked(location, tilePropType)

func get_gridLocation():
	return gridLocation

func get_propType():
	return propType

func init_tile(var type, var x, var y, var setScale):
	propType = type
	gridLocation.x = x
	gridLocation.y = y
	worldLocation.x = (166*setScale) * x + 25
	worldLocation.y = (166*setScale) * y + 50
	set_scale(Vector2(setScale, setScale))
	$TileSprite.play(propType)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func init_tile_worldPos(var type, var worldX, var worldY, var setScale):
	propType = type
	worldLocation.x = worldX
	worldLocation.y = worldY
	gridLocation = Vector2(-1, -1)
	set_scale(Vector2(setScale, setScale))
	$TileSprite.play(propType)


# Called when the node enters the scene tree for the first time.
func _ready():
	set_position(worldLocation)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Tile_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton) and (event.is_pressed() == false) and !get_parent().get_paused():
		print("input event")
		emit_signal("tile_clicked", gridLocation, propType)
			
func set_selected(var new):
	selected = new
	if new == "lastSelected":
		modulate = Color.green
	elif new == "selected":
		modulate = Color.gray
	else:
		modulate = Color.white
