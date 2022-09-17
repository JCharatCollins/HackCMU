extends Node2D

var currentHiScore

# The URL we will connect 

func _ready():
	currentHiScore = Hiscore.currentScore
