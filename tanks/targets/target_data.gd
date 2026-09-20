class_name target_data
extends Area2D

signal target_destroyed

@export_category("target info")
@export var target_name: String = "Wood Target"
@export var health_max: float = 250

@onready var health_bar:TextureProgressBar = $TextureProgressBar

var health: float

func _ready() -> void:
	health = health_max
	health_bar.max_value = health_max
	health_bar.value = health
	pass
	
func take_damage(shell: shell_data) -> void:
	health -= shell.hit_damage
	health_bar.value = health
	
	print(target_name, "HP: ",health)
	
	for stat in shell.rewards:
		print(stat, " +",shell.rewards[stat])
	
	if health <=0:
		die()
func die() -> void:
	print(target_name, "destroyed")
	target_destroyed.emit()
	queue_free()
