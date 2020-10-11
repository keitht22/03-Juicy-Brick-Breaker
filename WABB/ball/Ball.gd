extends RigidBody2D

onready var HUD = get_node("/root/Game/HUD")
onready var VP = get_viewport_rect().size

export var max_speed = 400.0
export var min_speed = 200.0



func _ready():
	$AnimatedSprite.visible = false
	contact_monitor = true
	set_max_contacts_reported(4)
	position = Vector2(VP.x/2, VP.y - 150)


func _physics_process(_delta):
	if position.y > VP.y - 10:
		die()
	
	
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.name == "Walls":
			$Ball_SFX.play()
		if body.name == "Paddle":
			$Ball_SFX.play()
		if body.is_in_group("Brick"):
			$Ball_SFX.play()
			
		if body.is_in_group("Brick"):
			HUD.update_score()
			body.die()

func die():
	HUD.update_lives()
	queue_free()
	
func _integrate_forces(state):
	if abs(state.linear_velocity.x) < min_speed:
		state.linear_velocity.x = sign(state.linear_velocity.x) * min_speed
	if abs(state.linear_velocity.y) < min_speed:
		state.linear_velocity.y = sign(state.linear_velocity.y) * min_speed
	if state.linear_velocity.length() > max_speed:
		state.linear_velocity = state.linear_velocity.normalized() * max_speed
