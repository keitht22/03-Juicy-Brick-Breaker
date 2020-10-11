extends Control

onready var global = get_node("/root/Global")

func _ready():
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Game2.tscn")
	global.score = 0
	global.lives = 5
	global.level = 2
	global.ball_count = 0

func _on_Button2_pressed():
	get_tree().quit()
