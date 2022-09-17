extends ItemList

var hiscores = File.new()
var hiscore_list = [["ABC", 10]]
var new_hiscore_list

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if (hiscores.file_exists("user://highscores.save")):
		hiscores.open("user://highscores.save", hiscores.READ)
		if (hiscores.get_len() > 0):
			hiscore_list = hiscores.get_var(true)
	if (hiscore_list != null):
		for score in hiscore_list:
			add_item(score[0] + ": " + str(score[1]))
	hiscores.close()
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_EnterName_text_entered(new_text):
	hiscores.open("user://highscores.save", hiscores.WRITE)
	hiscore_list.append([new_text, get_parent().currentHiScore])
	hiscores.store_var(hiscore_list)
	hiscores.close()
	clear()
	for score in hiscore_list:
		add_item(score[0] + ": " + str(score[1]))
	pass # Replace with function body.
