extends Area2D

@export var connected_scene: String
var scene_folder = "res://Levels/"
var entered = false

func _on_body_entered(body: Player) -> void:
	entered = true

func _on_body_exited(body: Player) -> void:
	entered = false
	
func _process(delta):
	if entered == true:
		if(Input.is_action_pressed("interact")):
			scene_manager.change_scene(get_owner(), connected_scene)
