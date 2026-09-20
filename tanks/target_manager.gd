extends Node2D

@export var starting_target: PackedScene
@export var build_target: Button

var current_target: target_data


func _ready() -> void:
	add_to_group("target_manager")
	load_target(starting_target)

	build_target.hide()
	build_target.pressed.connect(_on_build_target_pressed)


func load_target(target_scene: PackedScene) -> void:
	if target_scene == null:
		push_error("not any target selected")
		return

	if current_target != null:
		current_target.queue_free()

	current_target = target_scene.instantiate()
	add_child(current_target)

	current_target.position = Vector2.ZERO

	current_target.target_destroyed.connect(_on_target_destroyed)


func _on_target_destroyed() -> void:
	current_target = null
	build_target.show()

	var tank_manager = get_tree().get_first_node_in_group("tank_manager")

	if tank_manager != null:
		tank_manager.stop_firing()


func _on_build_target_pressed() -> void:
	build_target.hide()
	load_target(starting_target)

	var tank_manager = get_tree().get_first_node_in_group("tank_manager")

	if tank_manager != null:
		tank_manager.start_firing()
