extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree
@export var moving: Vector2 = Vector2.LEFT
@onready var sprite : Sprite2D = $Sprite2D
@export var speed: float = 10.0
@onready var state_machine: CharacterStateMachine = $CharacterStateMachine
@export var hit_state: State

@export var wander_range: float = 5.0  # Controls how far left or right the snail can wander
@export var direction_change_interval: float = 3.0  # How often the direction changes (in seconds)

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var wander_timer: Timer  # Timer to manage random wandering

func _ready():
	animation_tree.active = true
	
	# Create and configure the wander timer
	wander_timer = Timer.new()
	wander_timer.wait_time = direction_change_interval
	wander_timer.one_shot = false
	wander_timer.connect("timeout", Callable(self, "_on_wander_timer_timeout"))
	add_child(wander_timer)
	wander_timer.start()

	# Initialize random direction
	randomize_direction()

func _physics_process(delta: float) -> void:
	# Apply gravity if not on the floor
	if not is_on_floor():
		velocity.y += gravity * delta

	# Move according to the current direction
	if moving and state_machine.check_if_can_move():
		velocity.x = moving.x * speed
	elif state_machine.current_state != hit_state:
		# Gradually slow down to a stop
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()

func _on_wander_timer_timeout():
	# Change direction randomly when the timer triggers
	randomize_direction()

func randomize_direction():
	# Pick a random direction: left, right, or stop
	var random_value = randi() % 3  # Generates 0, 1, or 2
	if random_value == 0:
		moving.x = -1  # Move left
		sprite.flip_h = false
	elif random_value == 1:
		sprite.flip_h = true
		moving.x = 1  # Move right
	else:
		moving.x = 0  # Stop
