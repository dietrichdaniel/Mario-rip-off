extends KinematicBody2D


const UP = Vector2(0,-1)
const GRAVITY = Global.GRAVITY
const MAXFALLSPEED = Global.MAXFALLSPEED
const SPEED = 80
const C = preload("res://Scenes/Coin.tscn")

var direction = 1 
var motion = Vector2()
var is_dead = false


func _physics_process(delta):

	$AnimationPlayer.play("Walking")


	if direction == 1:
		$Sprite.scale.x = 1
	if direction == -1:
		$Sprite.scale.x = -1

	motion.x = SPEED * direction

	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED

	motion = move_and_slide(motion,UP)

	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *= -1

	if $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *= -1


func _ready():
	pass

func _dead():
	is_dead = true
	motion = Vector2(0,0)
	var coin = C.instance()
	get_parent().get_parent().add_child(coin)
	coin.global_position = self.global_position
	queue_free()
