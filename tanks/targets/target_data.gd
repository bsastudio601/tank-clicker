class_name target_data
extends Area2D

@export_category("target info")
@export var target_name: String = "Wood Target"
@export var health_max: float = 250
@export var damage_point: int = 10

var health: float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = health_max
	pass # Replace with function body.
func take_damage(amount: float) -> void:
	health -= amount
	
	print(target_name, "HP: ",health)
	
	if health <=0:
		die()
func die() -> void:
	print(target_name, "destroyed")
	queue_free()
