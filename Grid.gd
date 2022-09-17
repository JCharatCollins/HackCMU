extends Node2D

var tile = preload("res://Tile.tscn")

var tiles = []
var activeTiles = []

signal active_tiles_add(new_tile)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func generate_grid(var size):
	for x in range(size):
		for y in range(size):
			var newTile = tile.instance()
			newTile.init_tile("varp", 50*(x)+25, 50*(y)+25, 0.3)
			add_child(newTile, true)
			tiles.append(newTile)
			newTile.connect("tile_clicked", self, "_tile_clicked")
	print(tiles)
	
func get_tile_at(var x, var y):
	for tile in tiles:
		if tile.get_gridLocation() == Vector2(x, y):
			return tile

func _on_Root_ready():
	generate_grid(4)
	print_tree_pretty()
	pass # Replace with function body.

func _tile_clicked(location, tilePropType):
	var activeTile = get_tile_at(location.x, location.y)
	if activeTiles.size() > 0 and activeTile == activeTiles[-1]:
		activeTiles.erase(activeTile)
		activeTile.set_selected(false)
	elif !(activeTile in activeTiles):
		activeTiles.append(activeTile)
		activeTile.set_selected(true)
		emit_signal("active_tiles_update", activeTile)
	print(activeTiles)
