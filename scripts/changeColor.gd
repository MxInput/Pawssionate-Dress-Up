extends ColorPicker

@export var player_cat : Sprite2D;

@export var good_handler : Node;

var to_change : Sprite2D;
var key : Good.GoodType;

func change(good_type : Good.GoodType) -> void:
	key = good_type;
	
	match (good_type):
		Good.GoodType.BODY:
			to_change = player_cat.get_child(0);
		Good.GoodType.ACCESSORY:
			to_change = player_cat.find_child("Accessory").get_child(0);
		Good.GoodType.FACE:	
			to_change = player_cat.find_child("Face").get_child(0);
		Good.GoodType.FULL_BODY:
			to_change = player_cat.find_child("FullBody").get_child(0);
		Good.GoodType.HAT:
			to_change = player_cat.find_child("Hat").get_child(0);
		Good.GoodType.PANTS:
			to_change = player_cat.find_child("Pants").get_child(0);
		Good.GoodType.SHIRT:
			to_change = player_cat.find_child("Shirt").get_child(0);
		Good.GoodType.TAIL:
			to_change = player_cat.find_child("Tail").get_child(0);
	
func _on_color_changed(color: Color) -> void:
	if (to_change != null):
		good_handler.saved_colors[key] = color;
		to_change.modulate = color;
