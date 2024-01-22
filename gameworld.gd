extends Node2D

var obstacle = preload("res://falling_object.tscn")
var t = randf_range(0.5, 1)

func _ready():
	$Timer.start(t)

func _on_timer_timeout():
	spawn_obstacle()

func spawn_obstacle():
	var screen = get_viewport_rect().size
	var dir : Vector2
	var position1 = Vector2(-100, -100) 
	#left top corner
	var position2 = Vector2(screen.x+100, -100) #right top corner
	var position3 = Vector2(-100, screen.y+100) #left down corner
	
	var random_position_index = randi_range(1, 3)
	
	if random_position_index == 1:
		position = position1
		dir = Vector2(1.8, 1.0)
	elif random_position_index == 2:
		position = position2
		dir = Vector2(-1.8, 1.0)
	else:
		position = position3
		dir = Vector2(1.8, -1.0)
	
	var obstacle = load("res://falling_object.tscn") 
	obstacle = obstacle.instantiate()
	
	obstacle.position = position
	obstacle.direction = dir
	
	add_child(obstacle)
