extends Node2D


onready var Ball = load("res://ball/Ball.tscn")
onready var global = get_node("/root/Global")
var speed = 250

func _ready():
	randomize()

func _physics_process(_delta):
		load_ball()

func load_ball():
	var ball = Ball.instance()
	var impulse = Vector2.RIGHT
	var impulse2 = Vector2.LEFT
	impulse = impulse.rotated(randf()*-PI)
	if Input.is_action_just_pressed("launch") and get_child_count() == 0:
		ball.apply_central_impulse(impulse)
		add_child(ball)
	if get_child_count() < global.ball_count:
		ball.apply_central_impulse(impulse2)
		add_child(ball)
