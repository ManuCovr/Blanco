extends State

class_name GroundState

@export var jump_velocity : float = -200.0
@export var air_state : State
@export var jump_animation : String = "jump"
@export var attack_state: State
@export var attack_node : String = "attack1"
@onready var timer : Timer = $Timer
@onready var sfx_jump: AudioStreamPlayer = $"../../SFXJump"
@onready var attack_1: AudioStreamPlayer = $"../../attack1"

func state_process(delta):
	if(!character.is_on_floor() && timer.is_stopped):
		next_state = air_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
		sfx_jump.play()
	if(event.is_action_pressed("attack")):
		attack_1.play()
		attack()
		
func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)

func attack():
	next_state = attack_state
	playback.travel(attack_node)
