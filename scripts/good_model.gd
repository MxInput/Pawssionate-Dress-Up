extends TextureButton

@export var good : Good;

var is_sparkling = false;

@onready var goodHandler : Node = get_node("/root/Game/Container/GoodHandler");

signal chose_good

func _ready() -> void:
	chose_good.connect(goodHandler.change);
	
func _on_button_down() -> void:
	chose_good.emit(good);
	
	if (!is_sparkling):
		sparkle();
	else:
		stop_sparkling();
		
	for clothes_option in get_parent().get_children():
		if (clothes_option.is_sparkling && clothes_option != self):
			clothes_option.stop_sparkling();
	
func sparkle() -> void:
	is_sparkling = true;
	get_child(1).visible = true;
	
func stop_sparkling() -> void:
	is_sparkling = false;
	get_child(1).visible = false;
