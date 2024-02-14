extends KinematicBody2D

var player = null
var move = Vector2.ZERO
var speed = 110

func _physics_process(delta):
	move = Vector2.ZERO
	
	if player != null:
		move = position.direction_to(player.position)
	else:
		move = Vector2.ZERO
		
	move = move.normalized() * speed
	move = move_and_slide(move)

func _on_Area2D_body_entered(body):
	# Verificar si el cuerpo que entró es el jugador
	if body.is_in_group("player"):  # Asumiendo que el jugador está en un grupo llamado "player"
		player = body

func _on_Area2D_body_exited(body):
	# Verificar si el cuerpo que salió es el jugador
	if body.is_in_group("player"):  # Asumiendo que el jugador está en un grupo llamado "player"
		player = null
