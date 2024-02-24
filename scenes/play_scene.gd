extends KinematicBody2D  # Hereda las características de un cuerpo cinemático en 2D.

# Velocidad de movimiento constante en píxeles por segundo.
const MOTION_SPEED = 300

func _physics_process(_delta):
	# Método que se ejecuta en cada frame para manejar la física del cuerpo.
	
	# Inicializa un vector para almacenar el movimiento.
	var motion = Vector2()
	
	# Calcula el movimiento en el eje X y el eje Y basado en las entradas de teclado.
	motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	motion.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	# Divide el movimiento en el eje Y por 2 para ajustar la velocidad diagonal.
	motion.y /= 2
	
	# Normaliza el vector de movimiento y luego lo escala por la velocidad predeterminada.
	motion = motion.normalized() * MOTION_SPEED
	print("Hola mundo commit")
	# Aplica el movimiento y detección de colisiones.
	# El valor devuelto de move_and_slide() se ignora intencionalmente porque no se usa en este caso.
	move_and_slide(motion)


