extends Control

var button_type = null
@onready var settings_menu = $Settings as OptionsMenu
@onready var play_button: Button = $MarginContainer/VBoxContainer/Play
@onready var options_button: Button = $MarginContainer/VBoxContainer/Options
@onready var quit_button: Button = $MarginContainer/VBoxContainer/Quit
@onready var start_level = preload("res://Levels/game.tscn") as PackedScene
@onready var margin_container: MarginContainer = $MarginContainer
@onready var title: Label = $Label
@onready var menu_s_ong: AudioStreamPlayer = $menuSOng
@onready var hover: AudioStreamPlayer = $hover
@onready var press: AudioStreamPlayer = $press

func _ready():
	handle_signals()

func _on_play_pressed():
	button_type = "play"
	menu_s_ong.stop()
	hover.stop()
	press.play()
	$fade.show()
	$fade/Timer.start()
	$fade/AnimationPlayer.play("fade_in")

func _on_options_pressed():
	margin_container.visible = false
	hover.stop()
	press.play()
	settings_menu.set_process(false)
	settings_menu.visible = true
	title.visible = false

func _on_quit_pressed():
	menu_s_ong.stop()
	hover.stop()
	press.play()
	get_tree().quit()

func _on_timer_timeout():
	if button_type == "play":
		get_tree().change_scene_to_file("res://Levels/test_level.tscn")

func _on_exit_options_menu() -> void:
	margin_container.visible = true
	settings_menu.visible = false
	title.visible = true

func handle_signals():
	play_button.pressed.connect(_on_play_pressed)
	options_button.pressed.connect(_on_options_pressed)
	quit_button.pressed.connect(_on_quit_pressed)
	settings_menu.exit_menu.connect(_on_exit_options_menu)

func _on_play_mouse_entered() -> void:
	hover.play()

func _on_options_mouse_entered() -> void:
	hover.play()

func _on_quit_mouse_entered() -> void:
	hover.play()
