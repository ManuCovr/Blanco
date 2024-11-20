extends Control

class_name OptionsMenu
@onready var exit_button: Button = $MarginContainer/VBoxContainer/Exit_Button

signal exit_menu

func _ready() -> void:
	exit_button.pressed.connect(on_exit_pressed)
	set_process(false)
	
func on_exit_pressed():
	exit_menu.emit()
	set_process(false)
