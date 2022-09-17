extends Node2D

var activeTiles = []
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Grid_active_tiles_add(new_tile):
	activeTiles.append(new_tile)
	pass # Replace with function body.
