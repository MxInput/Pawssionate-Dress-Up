extends TextureButton

@export var good : Good;

@onready var goodHandler : Node = get_node("/root/Game/Container/GoodHandler");

signal chose_good

func _ready() -> void:
	chose_good.connect(goodHandler.change)
	
func _on_button_down() -> void:
	chose_good.emit(good)
