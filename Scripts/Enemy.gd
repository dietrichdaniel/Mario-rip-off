extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 40
const MAXFALLSPEED = 1000
const SPEED = 80

var direction = 1 
var motion = Vector2()
var is_dead = false


func _physics_process(delta):
	if is_dead == false:

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

func dead():
	is_dead = true
	motion = Vector2(0,0)
	
