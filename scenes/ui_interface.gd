extends Control


# Cargo la escena Menu2 y la almaceno en la variable Menu2
const option1 := preload("res://scenes/option1.tscn")
const scene_playgame := "res://levels/rooms/street_part1.tscn"


# Declaración de nodos y variables
#onready var tween := $Tween

onready var btn_playgame := $HBoxContainer/btn_play
onready var screens_container := $HBoxContainer
onready var btn_opt1 := $HBoxContainer/btn_opt1
onready var btn_close = $HBoxContainer/btn_salir

# Método llamado cuando el nodo ha sido inicializado
func _ready() -> void:
	#Conecto la señal "pressed" del botón back_button al método "volver"
	#back_button.connect("pressed", self, "volver")
	
	# Conecta la señal "pressed" del botón redirigir
	# al método "mostrar" con la escena Menu2 como argumento
	btn_playgame.connect("pressed", self, "mostrar_escena_playgame")
	btn_opt1.connect("pressed", self, "mostrar",[option1])
	btn_close.connect("pressed", self, "cerrar_escena")


# Método para mostrar una nueva escena
func mostrar(scene: PackedScene):
	
	# Instancia la nueva escena y agrega al contenedor
	var screen := scene.instance()
	screens_container.add_child(screen)

	# Muestra el botón de retroceso
	#back_button.show()
	
	# Oculta el botón redirigir
	#btn_play.hide()

	
# Método para volver a la escena anterior
func volver() -> void:
	#Oculta el botón de retroceso
	#back_button.hide()
	
	#Muestra el botón redirigir
	#btn_play.show()
	
	# Elimina las escenas existentes
	for child in screens_container.get_children():
		child.queue_free()
	
func mostrar_escena_playgame() -> void:
	# Obtén el SceneTree y cambia a la escena deseada
	var tree = get_tree()
	tree.change_scene(scene_playgame)
	
	
func cerrar_escena():
	get_tree().quit()
	
	
