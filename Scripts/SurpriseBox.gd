extends StaticBody2D

const C = preload("res://Scenes/Coin.tscn")

func activate():
	var coin = C.instance()
	get_parent().add_child(coin)
	coin.position = $Position2D.global_position
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
