extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Verificar si la señal 'area_entered' ya está conectada
	if not is_connected("area_entered", self, "_on_gold_money_area_entered"):
		connect("area_entered", self, "_on_gold_money_area_entered")

# Método llamado cuando el área entra en el área de la moneda.
func _on_gold_money_area_entered(area):
	if area.is_in_group("enemy"):
		# No hacemos nada si el área es del enemigo.
		pass
	else:
		queue_free()
