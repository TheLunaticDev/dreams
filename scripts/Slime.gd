extends RigidBody2D

func _ready() -> void:
	randomize()
	$Explore.wait_time = randi() % 10
	$Explore.start()

func find_random_location() -> Vector2:
	return Vector2(rand_range(-100.0, 100.0), rand_range(-100, 100.0))

func _on_Explore_timeout() -> void:
	linear_velocity = Vector2(find_random_location())
	$Explore.start()
