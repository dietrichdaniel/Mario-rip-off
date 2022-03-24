extends Node2D

var level = load("res://Scenes/Map.tscn")


func _ready():
	pass 


func _on_Button_pressed():
	get_tree().change_scene_to(level)
	Global.life_count = 3
