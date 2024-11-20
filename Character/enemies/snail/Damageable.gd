extends Node

class_name Damageable
@onready var snail_hurt: AudioStreamPlayer = $"../SnailHurt"
signal on_hit(node : Node, damage_taken : int, knockback_direction : Vector2)
@export var hp: float = 30 : 
	get:
		return hp
	set(value):
		SignalBus.emit_signal("on_health_changed", get_parent(), value - hp)
		hp = value
		
@export var dead_animation_name : String = "rip"

func hit(damage : int, knockback_direction : Vector2):
	snail_hurt.play()
	hp -= damage
	emit_signal("on_hit", get_parent(), damage, knockback_direction)


func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == dead_animation_name):
		get_parent().queue_free()
		
