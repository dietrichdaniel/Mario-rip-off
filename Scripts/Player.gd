extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 40
const MAXFALLSPEED = 1000
const MAXSPEED = 150
const JUMPFORCE = 1000
const ACCEL = 10 

var motion = Vector2()

func _physics_process(delta):

	motion.x = clamp(motion.x,-MAXSPEED,MAXSPEED)
	
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED

	if Input.is_action_pressed("Right"):
		motion.x += ACCEL
	
	elif Input.is_action_pressed("Left"):
		motion.x += -ACCEL
	
	else:
		motion.x = lerp(motion.x,0,0.2)
	
	if is_on_floor():
		if Input.is_action_just_pressed("Jump"):
			motion.y = -JUMPFORCE
	
	motion = move_and_slide(motion,UP)

func _on_Hitbox_body_entered(body):
	if "Enemy" in body.name:
		body.dead()
		
	print(body)
	
