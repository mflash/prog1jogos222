extends Label

onready var score := 0

func updateScore(incr: int):
	score += incr
	text = "Score: " + str(score)
