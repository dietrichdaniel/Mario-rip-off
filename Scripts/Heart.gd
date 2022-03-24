extends Area2D



func _ready():
	$AnimationPlayer.play("Heart")
	pass 



func _on_Heart_body_entered(body):
	if 'Player' in body.name:
		_increase_life()
		queue_free()

func _increase_life():
	if Global.life_count != 3:
		Global.life_count += 1
