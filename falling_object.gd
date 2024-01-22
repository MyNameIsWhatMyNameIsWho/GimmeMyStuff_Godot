extends Area2D

var direction : Vector2
var base_speed : float = 300
var speed_multiplier : float = 1.0
var speed_increase_rate : float = 0.1  # Adjust this rate to control the speed increase

func _process(delta):
	var speed = base_speed * speed_multiplier
	position += direction * delta * speed
	
	# Increase speed over time
	speed_multiplier += speed_increase_rate * delta

func _on_area_entered(area):
	queue_free()
	#player.score += 1
	#print("Score: ", score)
