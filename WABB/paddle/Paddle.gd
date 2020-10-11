extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var motion = (get_global_mouse_position().x - position.x) * 1
	translate(Vector2(motion, 0))
	position.x = clamp(position.x, 0 + 53, 547)
