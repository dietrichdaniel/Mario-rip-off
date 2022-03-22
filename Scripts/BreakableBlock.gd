extends StaticBody2D




func _ready():
	pass 

func _break():
	$AnimationPlayer.play("Breaking")
	$Timer.start()


func _on_Timer_timeout():
	queue_free()
