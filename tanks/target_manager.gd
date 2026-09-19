extends Node2D

@export var starting_target: PackedScene

var current_target: target_data

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("target_manager")
	load_target(starting_target)
	pass # Replace with function body.

func load_target(target_scene:PackedScene) -> void:
	if target_scene == null:
		push_error("not any target selected")
		return
	if current_target != null:
		current_target.queue_free()
	current_target = target_scene.instantiate()
	add_child(current_target)
	
	current_target.position = Vector2.ZERO
	
