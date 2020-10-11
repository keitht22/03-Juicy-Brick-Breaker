extends Node

var score = 0
var lives = 3
var level = 1
var ball_count = 0

func _process(_delta):
	if Input.is_action_pressed("quit"):
		get_tree().change_scene("res://menu/Main_Menu.tscn")
