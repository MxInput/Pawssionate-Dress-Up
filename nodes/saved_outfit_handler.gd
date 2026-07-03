extends Control

func _on_delete_button_down() -> void:
	queue_free();

func _on_load_button_down() -> void:
	print("loaded");
