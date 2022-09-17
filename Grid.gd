extends Node2D

var tile = preload("res://Tile.tscn")

var tiles = []

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Root_ready():
	for x in range(4):
		for y in range(4):
			var newTile = tile.instance()
			newTile.init_tile("varp", 50*(x)+50, 50*(y)+50, 0.3)
			add_child(newTile, true)
	
	print_tree_pretty()
	pass # Replace with function body.
