extends Node2D

var tiles = []
var tile = preload("res://Tile.tscn")

signal expr_generated(activeTiles)

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_tiles(["varp", "lor", "varq"])
	emit_signal("expr_generated", tiles)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func generate_tiles(varTiles):
	var expressionLoc = Vector2(400,  250)
	for i in range(len(varTiles)):
		var newTile = tile.instance()
		newTile.init_tile_worldPos(varTiles[i], expressionLoc.x + 60*i, expressionLoc.y, 0.4)
		add_child(newTile, true)
		tiles.append(newTile)
