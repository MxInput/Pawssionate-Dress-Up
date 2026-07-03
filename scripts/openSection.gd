extends TextureButton

@export var homeList : ScrollContainer;
@export var goodList : ScrollContainer;

@export var backButton : TextureButton;

@export var dressUpControl : Control;

@export var color_picker : ColorPicker;

@export var section_title : Label;

signal enableColor(good_type);

func _ready() -> void:
	if (color_picker != null):
		enableColor.connect(color_picker.change)

func closeAll() -> void:
	for control in dressUpControl.get_children():
		if ((control.is_class("ScrollContainer") || control.is_class("ColorPicker"))  && control.name != "List"):
			control.visible = false;
	
func _on_button_down() -> void:
	backButton.visible = true;
	
	section_title.visible = true;
	section_title.text = name;
	
	if (name == "FullBody"):
		section_title.text = "Full Body Clothes";
	
	homeList.visible = false;
	
	if (goodList != null):
		goodList.visible = true;
	else:
		if (color_picker != null):
			color_picker.visible = true;
			enableColor.emit(Good.GoodType.BODY);

func _on_back_button_down() -> void:
	backButton.visible = false;
	section_title.visible = false;
	
	closeAll();
	homeList.visible = true;
