extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayButton_mouse_entered():
	self.modulate = Color.gray
	pass # Replace with function body.


func _on_PlayButton_mouse_exited():
	self.modulate = Color.white
	pass # Replace with function body.
