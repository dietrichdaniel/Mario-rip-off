extends Area2D



func _ready():
	pass
	
	
func _on_Coin_body_entered(body):
	if "Player" in body.name:
		_collected()
		

func _collected():
	Global.coin_collected = true
	queue_free()
