extends Control

onready var global = get_node("/root/Global")
onready var music = get_node("/root/Game/Music")
onready var bc = get_node("/root/Game/Ball_Container")
onready var music_1 = load("res://audio/music_1.ogg")
onready var music_2 = load("res://audio/music_2.ogg")
onready var music_3 = load("res://audio/music_3.ogg")

func _ready():
	pass
	
func update_score():
	global.score += 1
	$Score.text = "SCORE: " + str(global.score)
	if global.score == 2:
		music.playing = true
	if global.score == 5 and music.stream != music_2:
		music.playing = false
		music.stream = music_2
		music.playing = true
		global.ball_count = 2
	if global.score == 20:
		global.lives += 1
		music.playing = false
		music.stream = music_3
		music.playing = true
		global.ball_count = 3
	if global.score >= 30:
		get_tree().change_scene("res://menu/LevelUp.tscn")
	if global.score >= 30 and global.level == 2:
		get_tree().change_scene("res://menu/Victory.tscn")

func update_lives():
	global.lives -= 1
	$Lives.text = "LIVES: " + str(global.lives)
	if global.lives <= 0:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://menu/main_menu.tscn")
