extends Node2D

onready var scene_volver_menu := "res://scenes/ui_interface.tscn"

# Declare member variables here. Examples:
onready var btn_menu_volver := $CanvasLayer/btn_menu_volver


# Called when the node enters the scene tree for the first time.
func _ready():
	btn_menu_volver.connect("pressed", self, "menu_volver")



func menu_volver():
	var tree = get_tree()
	tree.change_scene(scene_volver_menu)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
