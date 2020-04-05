extends Node2D

var squareTscn = preload("res://Square.tscn")

var LEVELS = [[1, 10], [2, 2], [3, 2], [4, 2], [5, 2], [6, 2], [7, 2], [8, 2], [9, 2], [10, 2], [11, 2], [12, 2]]

export var lvl = 0
export var lvlTime = 10

var time = 0
var squareCount = 0

var paused = false


func _ready():
	start_lvl()


func start_lvl():
	
	# запись значений переменных текущего уровня
	squareCount = LEVELS[lvl][0]
	lvlTime = LEVELS[lvl][1]
	time = lvlTime
	
	for i in range(squareCount):
		var squareNode = squareTscn.instance()
		squareNode.connect("destroyed", self,"square_destroyed")
		squareNode.position = Vector2(randi() % 540 + 12, randi() % 960 + 12)
		squareNode.scale = Vector2(2, 2)
		
		$Squares.add_child(squareNode)
	
	$LevelTimer.start(lvl)


func next_lvl():
	if LEVELS.size() > lvl:
		lvl += 1
	start_lvl()


func square_destroyed():
	squareCount -= 1
	if squareCount == 0:
		next_lvl()
