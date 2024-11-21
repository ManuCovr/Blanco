extends Control

class_name OptionsMenu
@onready var exit: Button = $MarginContainer/VBoxContainer/exit

signal exit_menu

func _ready() -> void:
	exit.pressed.connect(_on_exit_pressed)
	set_process(false)
	

func _on_exit_pressed() -> void:
	exit_menu.emit()
	set_process(false)
