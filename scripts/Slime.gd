extends RigidBody2D

"""
The basic idea for the behavior of this mob.
The slime tries to find a random spot within a certain range.
Once that spot is found the slime would try to approach it.
Once that position is approached the slime would try to do this step again.

Apart from that the slime has a tendancy to jump randomly.
When this happens the slime would temporarily stop and complete it's jump.
After that the slime would continue what it was doing.
"""

func _ready() -> void:
	randomize()
	reset_timer()

func _process(delta: float) -> void:
	pass

func find_random_location() -> Vector2:
	var random_location = Vector2(rand_range(-50.0, 50.0), rand_range(-50.0, 50.0))
	return Vector2(random_location)

func _on_Explore_timeout() -> void:
	$AnimationPlayer.play("Idle")
	var target_location = find_random_location()
	if (target_location.x < 0):
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
	linear_velocity = Vector2(target_location)
	print("The slime would now explore...")
	reset_timer()

func reset_timer() -> void:
	$Explore.wait_time = randi() % 10
	$Jump.wait_time = randi() % 5
	$Explore.start()
	$Jump.start()


func _on_Jump_timeout() -> void:
	linear_velocity = Vector2.ZERO
	$AnimationPlayer.play("Jump")
	print("The slime just jumped!")
