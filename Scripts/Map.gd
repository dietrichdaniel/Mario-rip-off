extends Node2D

var coin = preload("res://Scenes/Coin.tscn").instance()


func _process(delta):
	print(Global.coin_count)
	if Global.coin_collected == true:
		Global.coin_count += 1
		Global.coin_collected = false

func _ready():
	pass 

