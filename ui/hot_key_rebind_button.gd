extends Control

class_name HotKeyRebindButton

@onready var label: Label = $HBoxContainer/Label
@onready var button: Button = $HBoxContainer/Button

@export var action_name : String = "left"


func _ready() -> void:
	set_process_unhandled_input(false)
	set_action_name()
	
func set_action_name() -> void:
	label.text = "Unassigned"
	match action_name:
		"left":
			label.text = "Move Left"
		"right":
			label.text = "Move Right"
		"up":
			label.text = "Up"
		"down":
			label.text = "Down"
		"jump":
			label.text = "Jump"
		"attack":
			label.text = "Melee Attack"
		"interact":
			label.text = "Interact"
