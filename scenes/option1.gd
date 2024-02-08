extends Control

onready var button := $VBoxContainer/Button
onready var texturerect := $VBoxContainer/TextureRect



func _ready() -> void:
	#Conecto la señal "pressed" del botón back_button al método "volver"
	button.connect("pressed", self, "volver")
	

func volver() -> void:
	button.hide()
	texturerect.hide()
	
