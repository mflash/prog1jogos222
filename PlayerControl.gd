extends KinematicBody2D

export (int) var speed = 500
export var rotation_speed = 1.5

var velocity = Vector2()
var rotation_dir = 0 # ang. inicial de rotação

onready var target := position # alvo inicial é a própria posição
onready var player := $Player

func _ready() -> void:
	player.rotation_degrees = 0
	player.stop()
	#target = position
	
# Usada apenas para o modo de point-and-click
func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()
	
func get_rotate_mouse_input():
	look_at(get_global_mouse_position())
	rotation_degrees += 90
	velocity = Vector2()
	if Input.is_action_pressed("down"):
		velocity = Vector2(0, speed).rotated(rotation)
	if Input.is_action_pressed("up"):
		velocity = Vector2(0, -speed).rotated(rotation)
		
func get_rotate_input():
	rotation_dir = 0
	velocity = Vector2.ZERO
	rotation_dir = Input.get_action_strength("right")-Input.get_action_strength("left")
	if Input.is_action_pressed("down"):
		velocity = Vector2(0, speed).rotated(rotation)
	if Input.is_action_pressed("up"):
		velocity = Vector2(0, -speed).rotated(rotation)
		
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
		player.frame = 0
		player.stop()
		

func calc_velocity_click():
	velocity = position.direction_to(target) * speed
	
func _physics_process(delta):
	get_8way_input()
	#get_rotate_input()
	#get_rotate_mouse_input()
	#calc_velocity_click()
	#rotation += rotation_dir * rotation_speed * delta
	#if position.distance_to(target) > 5:
	velocity = move_and_slide(velocity)
