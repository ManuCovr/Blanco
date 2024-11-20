extends State

class_name AirState

@export var landing_state : State
@export var double_jump_velocity : float = -150
@export var double_jump_animation : String = "double_jump"
@export var landing_animation : String = "landing"
@onready var sfx_jump: AudioStreamPlayer = $"../../SFXJump"
@onready var sfx_jump_2: AudioStreamPlayer = $"../../SFXJump2"
@onready var landing: AudioStreamPlayer = $"../../Landing"

var has_double_jumped = false

func state_process(delta):
	if(character.is_on_floor()):
		next_state = landing_state
		
func state_input(event : InputEvent):
	if(event.is_action_pressed("jump") && !has_double_jumped):
		sfx_jump_2.play()
		double_jump()

func on_exit():
	if(next_state == landing_state):
		landing.play()
		playback.travel(landing_animation)
		has_double_jumped = false

func double_jump():
	character.velocity.y = double_jump_velocity
	playback.travel(double_jump_animation)
	has_double_jumped = true
