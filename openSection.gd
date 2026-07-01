extends TextureButton

enum Openables {
	BODY,
	TAIL,
	HAT
}

@export var value : Openables;

@export var homeList : ScrollContainer;
@export var goodList : ScrollContainer;

func _on_button_down() -> void:
	match (value):
		Openables.BODY:
			homeList.visible = false;
			goodList.visible = true;
			print("body")
		Openables.TAIL:
			goodList.visible = true
			homeList.visible = false;
			
			print("tail")
		_:
			print("bad")

func _on_back_button_down() -> void:
	goodList.visible = false;
	homeList.visible = true;
