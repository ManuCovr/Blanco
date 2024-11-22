extends Control

class_name SettingsTabContainer
@onready var hover: AudioStreamPlayer = $hover
@onready var press: AudioStreamPlayer = $press
signal Exit_Options_Menu
@onready var tab_container: TabContainer = $TabContainer


func _ready() -> void:
	pass
	
func _process(delta):
	pass
