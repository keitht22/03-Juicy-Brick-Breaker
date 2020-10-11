extends KinematicBody2D

var row = 0
var col = 0
var dying = false

export var appear_speed = 3

func _ready():
	pass

func _process(_delta):
	if dying:
		$CollisionPolygon2D.disabled = true
		$Sprite.visible = false
		$AnimatedSprite.visible = true
		$AnimatedSprite.play("default")

func start_brick():
	var target_pos = position
	var appear_duration = randf()*appear_speed + 1.0
	position.y = -100
	$Tween.interpolate_property(self, "position", position, target_pos, appear_duration, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	$Tween.start()

func die():
	dying = true


func _on_AnimatedSprite_animation_finished():
	self.queue_free()
