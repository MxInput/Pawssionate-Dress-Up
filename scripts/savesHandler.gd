extends Node

@export var char_pos : Sprite2D;
@export var container : Node;

var player_cat;

signal finished;

func load_cat(cat : Sprite2D) -> void:
	var created_cat = cat.duplicate()
	created_cat.position = char_pos.position;
	container.add_child(created_cat);
	
	player_cat = created_cat;
	
func _on_save_button_down() -> void:
	var body_color : Color = player_cat.get_child(0).modulate;

	var accessory = player_cat.find_child("Accessory", true, false);
	var accessory_to_save
	
	if (accessory.visible):
		if (accessory.get_child(0).visible):
			accessory_to_save = [accessory.get_child(0).texture, accessory.get_child(1).texture];
		else:
			accessory_to_save = [null, accessory.get_child(1).texture];
	else:
		accessory_to_save = [null, null];
		
	var face = player_cat.find_child("Face", true, false);
	var face_to_save
	
	if (face.visible):
		if (face.get_child(0).visible):
			face_to_save = [face.get_child(0).texture, face.get_child(1).texture];
		else:
			face_to_save = [null, face.get_child(1).texture];
	else:
		face_to_save = [null, null];
		
	var full_body = player_cat.find_child("FullBody", true, false);
	var full_body_to_save
	
	if (full_body.visible):
		if (full_body.get_child(0).visible):
			full_body_to_save = [full_body.get_child(0).texture, full_body.get_child(1).texture];
		else:
			full_body_to_save = [null, full_body.get_child(1).texture];
	else:
		full_body_to_save = [null, null];
		
	var hat = player_cat.find_child("Hat", true, false);
	var hat_to_save
	
	if (hat.visible):
		if (hat.get_child(0).visible):
			hat_to_save = [hat.get_child(0).texture, hat.get_child(1).texture];
		else:
			hat_to_save = [null, hat.get_child(1).texture];
	else:
		hat_to_save = [null, null];
		
	var shirt = player_cat.find_child("Shirt", true, false);
	var shirt_to_save
	
	if (shirt.visible):
		if (shirt.get_child(0).visible):
			shirt_to_save = [shirt.get_child(0).texture, shirt.get_child(1).texture];
		else:
			shirt_to_save = [null, shirt.get_child(1).texture];
	else:
		shirt_to_save = [null, null];
		
	var pants = player_cat.find_child("Pants", true, false);
	var pants_to_save
	
	if (pants.visible):
		if (pants.get_child(0).visible):
			pants_to_save = [pants.get_child(0).texture, pants.get_child(1).texture];
		else:
			pants_to_save = [null, pants.get_child(1).texture];
	else:
		pants_to_save = [null, null];
		
	var tail = player_cat.find_child("Tail", true, false);
	var tail_to_save
	
	if (tail.visible):
		if (tail.get_child(0).visible):
			tail_to_save = [tail.get_child(0).texture, tail.get_child(1).texture];
		else:
			tail_to_save = [null, tail.get_child(1).texture];
	else:
		tail_to_save = [null, null];
		
	var complete_cat_model := CompleteModel.new(body_color, face_to_save, tail_to_save, full_body_to_save, accessory_to_save, hat_to_save, shirt_to_save, pants_to_save);

func _on_return_button_down() -> void:
	finished.emit();
