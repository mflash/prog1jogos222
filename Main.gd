extends Node2D

var total : float = 0

const SPEED : int = 100

func _ready():
	update_score(total)

#func _input(event: InputEvent):
	#print(event.as_text())
#	if(event.is_action_pressed("right")):
#		print("Right movement")
#	if(event.is_action_pressed("left")):
#		print("Left movement")
	
func _process(delta: float):
	#print(delta)
	total += delta
	update_score(total)
	
func _physics_process(delta: float):
	if Input.is_action_pressed("right"):
		$Score.rect_position.x += SPEED * delta
	if Input.is_action_pressed("left"):
		$Score.rect_position.x -= SPEED * delta
	
func update_score(current_score: float):
	$Score.text = "Score: " + str(current_score)
