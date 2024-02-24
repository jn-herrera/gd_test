extends KinematicBody2D

const MOTION_SPEED = 300

func _physics_process(_delta):
	var motion = Vector2()
	motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	motion.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	motion.y /= 2
	motion = motion.normalized() * MOTION_SPEED
	move_and_slide(motion)

# Método llamado cuando el cuerpo entra en el área de la moneda o del enemigo.
func _on_area_entered(area):
	# Aquí puedes agregar la lógica para manejar lo que ocurre cuando el jugador entra en el área de la moneda o del enemigo.
	pass
