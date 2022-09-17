extends Label

func isInvalid():
	self.text = "Invalid."
func isIncorrect():
	self.text = "Incorrect."
func isCorrect():
	self.text = "Correct!"
func isDuplicate():
	self.text = "Duplicate."
func clearText():
	self.text = ""
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_LogicParser_activeTilesCorrect():
	isCorrect()

func _on_LogicParser_activeTilesIncorrect():
	isIncorrect()

func _on_LogicParser_activeTilesInvalid():
	isInvalid()

func _on_LogicParser_duplicateSoln():
	isDuplicate()
