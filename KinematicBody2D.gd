extends KinematicBody2D

#    ============   ppppppppppppppppp p    p

var state_machine
var run_speed = 80
var velocity = Vector2.ZERO
var is_attacking = false


func _ready():
	state_machine = $AnimationTree.get("parameters/playback")

func get_input():
	var current = state_machine.get_current_node()
	velocity = Vector2.ZERO
	if Input.is_action_just_pressed("attack"):
		state_machine.travel("attack1")
		return
		
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		#velocity = velocity.normalized() * run_speed 
		$Sprite.scale.x = 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		#velocity = velocity.normalized() * run_speed 
		$Sprite.scale.x = -1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		#velocity = velocity.normalized() * run_speed
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	velocity = velocity.normalized() * run_speed 
		
		
	if velocity.length() == 0:
		state_machine.travel("idle")
	if velocity.length() > 0:
		state_machine.travel("walk")
		
		
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
func die():
	state_machine.travel("die")
	set_physics_process(false)
	
	

func _on_SwordHit_area_entered(area):
	pass

#func hurt():
	#state_machine.travel("hurt")
	

