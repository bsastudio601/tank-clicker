class_name shell_data
extends Area2D

@export_category("shell info")
@export var shell_name: String = "AP"
@export var speed: float = 150.0
@export var hit_damage: float = 1

@export var rewards: Dictionary = {
	"damage":10,
	"accuracy":5
}

func _process(delta: float) -> void:
	position.x += speed * delta
	pass
	
func _on_area_entered(area: Area2D) -> void:
	if area.has_method("take_damage"):
		area.take_damage(self)
		queue_free()
	pass
