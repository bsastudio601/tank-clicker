extends Node2D

@export_category("Tank Setup")
@export var starting_tank: PackedScene

var current_tank: tank_data


func _ready() -> void:
	add_to_group("tank_manager")
	load_tank(starting_tank)


func load_tank(tank_scene: PackedScene) -> void:
	if tank_scene == null:
		push_error("no starting tank has been selected")
		return

	if current_tank != null:
		current_tank.queue_free()

	current_tank = tank_scene.instantiate()
	add_child(current_tank)

	current_tank.position = Vector2.ZERO


func stop_firing() -> void:
	if current_tank != null:
		current_tank.fire_timer.stop()


func start_firing() -> void:
	if current_tank != null:
		current_tank.fire_timer.start()
