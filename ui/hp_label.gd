extends Label

@export var float_speed : Vector2 = Vector2(0, -60)
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += float_speed * delta

func _on_timer_timeout():
	queue_free()
