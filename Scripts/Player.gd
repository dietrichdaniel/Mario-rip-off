extends KinematicBody2D

signal dead

const UP = Vector2(0,-1)
const GRAVITY = Global.GRAVITY
const MAXFALLSPEED = Global.MAXFALLSPEED
const MAXSPEED = 150
const JUMPFORCE = 1000
const ACCEL = 10 

var motion = Vector2()

func _ready():
	pass


func _physics_process(delta):

	motion.x = clamp(motion.x,-MAXSPEED,MAXSPEED)
	motion.y += GRAVITY
	motion = move_and_slide(motion,UP)

	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED


	if Input.is_action_pressed("Right"):
		$Sprite.scale.x = 1
		motion.x += ACCEL

	elif Input.is_action_pressed("Left"):
		$Sprite.scale.x = -1
		motion.x += -ACCEL

	else:
		motion.x = lerp(motion.x,0,0.2)



	if is_on_floor():
		if Input.is_action_just_pressed("Jump"):
			motion.y = -JUMPFORCE

		if $AnimationPlayer.is_playing() == false:
			$Sprite.set_frame(0)

		if   (0 <= motion.x and motion.x < 0.4) or (motion.x > -0.4 and motion.x <= 0):
			$AnimationPlayer.stop()

		if Input.is_action_pressed("Right"):
			$AnimationPlayer.play("Walking")

		if Input.is_action_pressed("Left"):
			$AnimationPlayer.play("Walking")

	else:
		$AnimationPlayer.stop()
		$Sprite.set_frame(1)

func _on_Hitbox_body_entered(body):
	if body.is_in_group('Enemies'):
		body._dead()
		motion.y = -JUMPFORCE / 2 


func _on_HitboxUp_body_entered(body):
	if "SurpriseBox" in body.name:
		body.activate()

	if body.is_in_group('Breakable Blocks'):
		body.queue_free()


func _on_HitboxSides_body_entered(body):
	if body.is_in_group('Enemies'):
		emit_signal("dead")


func _on_Player_dead():
	Global.coin_count = 0
	get_tree().paused = true
	yield(get_tree().create_timer(3),"timeout")
	get_tree().reload_current_scene()
	get_tree().paused = false
