extends Control

@export var game_manager: GameManager
@onready var press: AudioStreamPlayer = $press
@onready var hover: AudioStreamPlayer = $hover
@onready var resume: Button = $Panel/VBoxContainer/resume
@onready var restart: Button = $Panel/VBoxContainer/restart
@onready var options: Button = $Panel/VBoxContainer/options
@onready var exit: Button = $Panel/VBoxContainer/exit

func _ready():
	hide()
	game_manager.connect("toggle_pause", _manager_pause)
	
func _manager_pause(is_paused : bool):
	if(is_paused):
		show()
		$AnimationPlayer.play("blur")
	else:
		hide()


func _on_resume_pressed() -> void:
	game_manager.game_paused = false
	hover.stop()
	press.play()
	$AnimationPlayer.play_backwards("blur")

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_restart_pressed() -> void:
	game_manager.game_paused = false
	hover.stop()
	press.play()
	get_tree().reload_current_scene()


func _on_options_pressed() -> void:
	hover.stop()
	press.play()


func _on_resume_mouse_entered() -> void:
	hover.play()

func _on_restart_mouse_entered() -> void:
	hover.play()

func _on_options_mouse_entered() -> void:
	hover.play()

func _on_exit_mouse_entered() -> void:
	hover.play()
