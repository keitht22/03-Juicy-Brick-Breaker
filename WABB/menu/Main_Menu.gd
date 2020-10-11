extends Control


onready var global = get_node("/root/Global")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("quit"):
		get_tree().quit()


func _on_Start_pressed():
	global.lives = 3
	global.score = 0
	global.ball_count = 0
	global.level = 1
	get_tree().change_scene("res://Game.tscn")

func _on_Quit_pressed():
	get_tree().quit()
