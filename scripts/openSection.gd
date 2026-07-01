extends TextureButton

@export var homeList : ScrollContainer;
@export var goodList : ScrollContainer;

@export var dressUpControl : Control;

func closeAll() -> void:
	for control in dressUpControl.get_children():
		if (control.is_class("ScrollContainer") && control.name != "List"):
			control.visible = false;
	
func _on_button_down() -> void:
	homeList.visible = false;
	goodList.visible = true;

func _on_back_button_down() -> void:
	closeAll();
	homeList.visible = true;
