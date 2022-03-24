extends Sprite


var life

func _ready():
	pass

func _process(delta):
	life = Global.life_count
	frame = (life * -1) + 3
