extends Control

var complete_model : CompleteModel;

@onready var save_handler : Node = get_tree().root.get_child(1);
var save_game : AllModels;

func _on_delete_button_down() -> void:
	save_game = save_handler.save_game;
	
	if (save_game.models.has(complete_model)):
		save_game.models.erase(complete_model);
		
	queue_free();

func _on_load_button_down() -> void:
	pass
