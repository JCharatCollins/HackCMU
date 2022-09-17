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
			newTile.init_tile("varp", x, y, 0.3)
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
	
	#tile to be removed
	if activeTiles.size() > 0 and activeTile == activeTiles[-1]:
		activeTile.set_selected("false")
		activeTiles.erase(activeTile)
		if activeTiles.size() > 0:
			activeTiles[-1].set_selected("lastSelected")
	
	elif !(activeTile in activeTiles):
		if activeTiles.size() > 0:
			var lastTileLoc = activeTiles[-1].get_gridLocation()
			if (abs(lastTileLoc.x - location.x) <= 1) and (abs(lastTileLoc.y - location.y) <= 1):
				add_activeTile(activeTile)
		if activeTiles.size() == 0:
			add_activeTile(activeTile)
		
	print(activeTiles)

func add_activeTile(activeTile):
	if (activeTiles.size() > 0):
		activeTiles[-1].set_selected("selected")
	activeTiles.append(activeTile)
	activeTiles[-1].set_selected("lastSelected")
	emit_signal("active_tiles_add", activeTile)
