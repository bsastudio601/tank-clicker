extends CanvasLayer
@export var ui_menu: PackedScene

var current_menu: Control = null 
var current_scene: PackedScene = null

func _on_texture_button_pressed() -> void:
	toggle_menu(ui_menu)
	pass # Replace with function body.

	
func toggle_menu(ui_scene: PackedScene) -> void:
	if current_menu != null and current_scene == ui_scene: 
		current_menu.queue_free() 
		current_menu = null 
		current_scene = null 
		return
	if current_menu != null:
		current_menu.queue_free()
		current_menu = null 
		
	if ui_scene == null:
		return
		
	current_menu = ui_scene.instantiate()
	current_scene = ui_scene
	add_child(current_menu)
