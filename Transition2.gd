extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayButton_pressed():
	play("Transition")
	pass # Replace with function body.


func _on_Transition_animation_finished(anim_name):
	if(anim_name == "Transition2"):
		get_tree().change_scene("res://GameOver.tscn")
	pass # Replace with function body.
	
func _on_Game_ready():
	play("Transition")
	pass # Replace with function body.


func _on_Clock_timeout():
	yield(get_tree().create_timer(3), "timeout")
	play("Transition2")
	pass # Replace with function body.
