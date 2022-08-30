extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

onready var player := $AnimationPlayer

func _ready() -> void:
	player.stop()
	#target = position
			
func get_8way_input():
	#velocity = Vector2.ZERO
	velocity.x = Input.get_action_strength("right")-Input.get_action_strength("left")
	velocity.y = Input.get_action_strength("down")-Input.get_action_strength("up")
	velocity = velocity.normalized() * speed
	if velocity.x < 0:
		player.play("walk-left")
	elif velocity.x > 0:
		player.play("walk-right")
	elif velocity.y > 0:
		player.play("walk-down")
	elif velocity.y < 0:
		player.play("walk-up")
	else:
		#player.animation = "walk-down"
		#player.frame = 0
		player.stop()
		

func _physics_process(delta):
	get_8way_input()
	velocity = move_and_slide(velocity)
	
func final_animacao():
	print("Final da animação")
