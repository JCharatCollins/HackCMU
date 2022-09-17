extends Button

var isPaused = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal pause_button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PauseButton_pressed():
	if isPaused:
		isPaused = false
		self.icon = load("res://pausebutton.png")
	else:
		isPaused = true
		self.icon = load("res://unpausebutton.png")
	pass # Replace with function body.
