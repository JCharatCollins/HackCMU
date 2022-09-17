extends MenuButton

var popup = get_popup()

func restartScene(var difficulty):
	Hiscore.difficulty = difficulty + 3
	get_tree().change_scene("res://Root.tscn")

func _ready():
	popup.connect("id_pressed", self, "restartScene")
