extends KinematicBody2D


# Declaramos variables y las inicializamos con valores predeterminados.
var player = null  # Variable para almacenar la referencia al jugador.
var move = Vector2.ZERO  # Vector de movimiento inicializado en (0, 0).
var speed = 110  # Velocidad predeterminada del movimiento.
var health := 100
var attack := 10
var player_script = null



# Método que se ejecuta en cada frame para manejar la física del cuerpo.
func _physics_process(_delta):
	move = Vector2.ZERO  # Reseteamos el vector de movimiento en cada frame.
	
	# Verificamos si hay un jugador asignado para seguir.
	if player != null:
		move = position.direction_to(player.position)  # Obtenemos la dirección hacia el jugador.
	else:
		move = Vector2.ZERO  # Si no hay jugador, detenemos el movimiento.
		
	move = move.normalized() * speed  # Normalizamos y escalamos el vector de movimiento por la velocidad.
	move = move_and_slide(move)  # Aplicamos el movimiento y detección de colisiones.

# Método que se llama cuando un cuerpo entra en el área.
func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		player = body
		# f_attack(player)
	elif body.is_in_group("coin"):
		# Si es una moneda, no hacemos nada
		pass
	
		
# Método que se llama cuando un cuerpo sale del área.
func _on_Area2D_body_exited(body):
	# Verificamos si el cuerpo que salió es el jugador.
	if body.is_in_group("player"):  # Comprobamos si el cuerpo pertenece al grupo "player".
		player = null  # Desasignamos al jugador.

# func f_attack(body):
# 	player_script.healtah = player_script.health - attack
	
	
	
