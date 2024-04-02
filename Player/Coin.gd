extends Area2D

# Variables to track the direction and increment
var direction : int = 1
var increment : float = 3.0

var bob_speed : float = 5.0
var bob_height : float = 5.0

@onready var start_y : float = global_position.y
var t : float = 0.0

# Called every frame
func _process(delta):
	t += delta
	
	var ddelta = (sin(t * bob_speed) + 1) / 2
	
	global_position.y = start_y + (ddelta * bob_height)
	# Access the Sprite child of the Area2D
	var sprite = $Sprite
	
	# Update the object's x scale
	sprite.scale.x += direction * increment * delta
	
	# If the object reaches the boundary, change direction
	if sprite.scale.x >= 1 or sprite.scale.x <= -1:
		direction *= -1


func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.add_score(1)
		queue_free()
