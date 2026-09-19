class_name shell_data
extends Area2D

@export_category("shell info")
@export var shell_name: String = "AP"
@export var speed: float = 150.0
@export var damage: float = 10


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed * delta
	pass
	
func _on_area_entered(area: Area2D) -> void:
	if area.has_method("take_damage"):
		area.take_damage(damage)
		queue_free()
	pass # Replace with function body.
