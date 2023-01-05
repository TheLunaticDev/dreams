extends RigidBody2D

func _ready() -> void:
	randomize()
	reset_timer()

func _process(delta: float) -> void:
	pass

func find_random_location() -> Vector2:
	var random_location = Vector2(rand_range(-50.0, 50.0), rand_range(-50.0, 50.0))
	print(random_location)
	return Vector2(random_location)

func _on_Explore_timeout() -> void:
	linear_velocity = Vector2(find_random_location())
	reset_timer()

func reset_timer() -> void:
	$Explore.wait_time = randi() % 10
	$Explore.start()
