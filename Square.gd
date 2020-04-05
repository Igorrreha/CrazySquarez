extends Area2D

enum COLORS {
	RED = 0,
	BLUE = 1,
	GREEN = 2,
	YELLOW = 3
}

var color

signal destroyed

func _ready():
	color = randi() % 3
	
	if color == COLORS.RED:
		$AnimatedSprite.play("red")
		#$ColorRect.color = Color.red
	elif color == COLORS.BLUE:
		$AnimatedSprite.play("blue")
		#$ColorRect.color = Color.blue
	elif color == COLORS.GREEN:
		$AnimatedSprite.play("green")
		#$ColorRect.color = Color.green
	elif color == COLORS.YELLOW:
		$AnimatedSprite.play("yellow")
		#$ColorRect.color = Color.yellow


func destroy():
	emit_signal("destroyed")
	queue_free() 


func _on_Square_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		destroy()
