extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_entered", self, "_on_gold_money_area_entered")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_gold_money_area_entered(area):
	if area.is_in_group("enemy"):
		# No hacemos nada si el área es del enemigo.
		pass
	else:
		queue_free()
