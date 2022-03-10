extends Node2D


var score


# Called when the node enters the scene tree for the first time.
func _ready():
	score=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score+=delta*3
	get_node("Camera2D/Control/TextEdit").text="Score : "+str(round(score))
