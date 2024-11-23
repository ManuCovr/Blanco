extends Area2D

var entered = false
const main = preload("res://Levels/test_level.gd")

func _on_body_entered(body: Player) -> void:
	entered = true

func _on_body_exited(body: Player) -> void:
	entered = false
	
func _process(delta):
	if entered == true:
		if(Input.is_action_pressed("interact")):
			get_tree().change_scene_to_file("res://Levels/world3.tscn")
