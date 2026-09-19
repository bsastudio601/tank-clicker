extends Node2D

@export_category("Tank Setup")
@export var starting_tank: PackedScene
var current_tank: tank_data


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_tank(starting_tank)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func load_tank(tank_scene: PackedScene) -> void:
	if tank_scene == null:
		push_error("no starting tank has been selected")
		return
	if current_tank != null:
		current_tank.queue_free()
		
	current_tank = tank_scene.instantiate()
	
	add_child(current_tank)
	
	current_tank.position = Vector2.ZERO
