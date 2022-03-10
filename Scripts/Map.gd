extends Node2D


func _process(delta):

	if Global.coin_collected == true:
		Global.coin_count += 1
		Global.coin_collected = false


func _ready():
	pass 

