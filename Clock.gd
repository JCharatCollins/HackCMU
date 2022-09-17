extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal time_left(time)

# Called when the node enters the scene tree for the first time.
func _ready():
	start(60)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	emit_signal("time_left", get_time_left())
#	pass

func _on_PauseButton_pressed():
	if (is_paused()):
		set_paused(false)
	else:
		set_paused(true)
	pass # Replace with function body.
