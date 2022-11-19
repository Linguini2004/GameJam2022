extends Actor

#var status = "idle" # idle, left, right, up, down
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var direction = Vector2()
var SPEED = 200

func move(direction: Vector2, delta) -> void:
	velocity.y = SPEED * direction.y
	velocity.x = SPEED * direction.x
	
	velocity = move_and_slide(velocity, Vector2(0, 0))


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	animated_sprite.play(current_status)
	if current_status != "idle":
		move(direction, delta)

func _input(ev):
	if Input.is_key_pressed(KEY_A):
		current_status = "running left"
		direction = Vector2(-1, 0)
	elif Input.is_key_pressed(KEY_D):
		current_status = "running right"
		direction = Vector2(1, 0)
	elif Input.is_key_pressed(KEY_S):
		current_status = "running down"
		direction = Vector2(0, 1)
	elif Input.is_key_pressed(KEY_W):
		current_status = "running up"
		direction = Vector2(0, -1)
	else:
		current_status = "idle"
		direction = Vector2(0, 0)
