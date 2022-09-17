extends Node2D

var tile = preload("res://Tile.tscn")

var activeTiles = []
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func delete_children():
	for n in get_children():
		remove_child(n)
		n.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func updateActiveTiles():
	var x = 0
	delete_children()
	for activeTile in activeTiles:
		var newTile = tile.instance()
		newTile.init_tile(activeTile.get_propType(), x, 0, 0.3)
		x += 1
		add_child(newTile, true)
	print(get_child_count())

func _on_Grid_active_tiles_update(tiles):
	activeTiles = tiles
	updateActiveTiles()
	pass # Replace with function body.
