extends Sprite

var speed = 400
var angular_speed = PI

signal health_depleted

var health = 10

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = get_node("Timer")
	#var timer = $Timer
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.wait_time = 3 # troca para 3 segundos


func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta


func _on_Button_pressed() -> void:
	print("button pressed")
	set_process(not is_processing())


func _on_Button2_pressed() -> void:
	take_damage(2) # toma 2 unidades de dano
	
func _on_Timer_timeout():
	visible = not visible
	
func take_damage(amount):
	print("Tomei dano! ",amount)
	health -= amount
	if health <= 0:
		# Alguém pode estar interessado neste sinal
		# (por exemplo, a cena)
		emit_signal("health_depleted")


func _on_HSlider_value_changed(value: float) -> void:
	print("Valor do slider: ",value)
	
	
	
	
	
