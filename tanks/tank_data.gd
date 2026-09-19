class_name tank_data
extends Node2D

@export var tank_name: String = "m22_usa"
@export var fire_rate: float = 1.0
@export var shell_scene: PackedScene

@onready var muzzle: Marker2D = $Marker2D
@onready var fire_timer:Timer = $Timer



func _ready() -> void:
	fire_timer.wait_time = 1.0 / fire_rate
	fire_timer.start()
	
func _on_timer_timeout() -> void:
	fire()
func fire() -> void:
	if shell_scene == null:
		return
	var shell = shell_scene.instantiate()
	shell.global_position = muzzle.global_position
	
	get_tree().current_scene.add_child(shell)
