extends StaticBody2D

const C = preload("res://Scenes/Coin.tscn")

func activate():
	var coin = C.instance()
	get_parent().add_child(coin)
	coin.position = $Position2D.global_position
	
	
	pass 
