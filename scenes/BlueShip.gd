extends RigidBody2D


export var speed = 500.0


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Blue ship initialized")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	var velocity = Vector2()
	
	# vertical, if none pressed drop faster
	if Input.is_action_pressed("move_up"):
		velocity.y -= 2
	if Input.is_action_pressed("move_down"):
		velocity.y += 2
	if not (Input.is_action_pressed("move_up") or Input.is_action_pressed("move_down")):
		velocity.y += 1
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 2
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 2
	
	velocity *=  speed * delta
	
	# air friction (coef. = 0.2)
	var air_friction = Vector2(linear_velocity.x * 0.4 * delta, 0)
	velocity -= air_friction
	
	apply_central_impulse(velocity)
