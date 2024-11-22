extends Control

class_name OptionsMenu
@onready var exit: Button = $MarginContainer/VBoxContainer/exit
@onready var hover: AudioStreamPlayer = $MarginContainer/VBoxContainer/MoreSettings/hover
@onready var press: AudioStreamPlayer = $MarginContainer/VBoxContainer/MoreSettings/press
@onready var tab_container: TabContainer = $MarginContainer/VBoxContainer/MoreSettings/TabContainer

signal exit_menu

func _ready() -> void:
	exit.pressed.connect(_on_exit_pressed)
	set_process(false)
	

func _on_exit_pressed() -> void:
	exit_menu.emit()
	set_process(false)
