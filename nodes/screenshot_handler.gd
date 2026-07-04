extends Node

@export var dressup_control : Control;

@export var screenshot_info : Label;

signal text_updated;

func _ready() -> void:
	text_updated.connect(screenshot_info.reset_time);
	
func _on_screenshot_button_down() -> void:
	var date = Time.get_date_string_from_system().replace(".", ",");
	var time : String = Time.get_time_string_from_system().replace(":", "");
	var screenshot_path = "user://" + "screenshot_" + date + "_" + time + ".jpg";
	
	dressup_control.visible = false;

	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_jpg(screenshot_path);

	dressup_control.visible = true;
	
	screenshot_info.visible = true;
	screenshot_info.text = "Saved to " + screenshot_path;
	
