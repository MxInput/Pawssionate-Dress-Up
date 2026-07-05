extends Node

const SAVE_PATH := "user://paw_dressup_save.tres"

var save_game : AllModels = null

@export var char_pos : Sprite2D;
@export var container : Node;

@onready var complete_temp = preload("res://nodes/saved_outfit.tscn");
@export var saves_container : GridContainer;

var player_cat;

signal finished;

func _ready() -> void:
	if ResourceLoader.exists(SAVE_PATH):
		save_game = ResourceLoader.load(SAVE_PATH, "", ResourceLoader.CACHE_MODE_IGNORE)
		load_saved_outfits();
	else:
		save_game = AllModels.new();
	
func save() -> void:
	var error := ResourceSaver.save(save_game, SAVE_PATH);
	if error != OK:
		print("This is a saving error: " + str(error));
		
func load_cat(cat : Sprite2D) -> void:
	var created_cat = cat.duplicate()
	created_cat.position = char_pos.position;
	container.add_child(created_cat);
	
	player_cat = created_cat;
	
func load_saved_outfits() -> void:
	for saved_outfit in save_game.models:
		var new_model_display = complete_temp.instantiate();
		new_model_display.complete_model = saved_outfit;
		saves_container.add_child(new_model_display);

		new_model_display.get_child(0).get_child(0).find_child("Body_Color").modulate = saved_outfit.body_color;
		
		if (saved_outfit.accessory[0] == null && saved_outfit.accessory[1] == null):
			new_model_display.get_child(0).get_child(0).find_child("Accessory").visible = false;
		elif (saved_outfit.accessory[0] == null):
			new_model_display.get_child(0).get_child(0).find_child("Accessory").get_child(0).visible = false;
			new_model_display.get_child(0).get_child(0).find_child("Accessory").visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Accessory").texture = saved_outfit.accessory[1];
		else:
			new_model_display.get_child(0).get_child(0).find_child("Accessory").get_child(0).visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Accessory").visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Accessory").get_child(0).texture = saved_outfit.accessory[0];
			new_model_display.get_child(0).get_child(0).find_child("Accessory").texture = saved_outfit.accessory[1];
			
			if (saved_outfit.accessory_color != Color.WHITE):
				new_model_display.get_child(0).get_child(0).find_child("Accessory").get_child(0).modulate = saved_outfit.accessory_color;
				
		if (saved_outfit.face[0] == null && saved_outfit.face[1] == null):
			new_model_display.get_child(0).get_child(0).find_child("Face").visible = false;
		elif (saved_outfit.face[0] == null):
			new_model_display.get_child(0).get_child(0).find_child("Face").get_child(0).visible = false;
			new_model_display.get_child(0).get_child(0).find_child("Face").visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Face").texture = saved_outfit.face[1];
		else:
			new_model_display.get_child(0).get_child(0).find_child("Face").get_child(0).visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Face").visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Face").get_child(0).texture = saved_outfit.face[0];
			new_model_display.get_child(0).get_child(0).find_child("Face").texture = saved_outfit.face[1];
			
			if (saved_outfit.face_color != Color.WHITE):
				new_model_display.get_child(0).get_child(0).find_child("Face").get_child(0).modulate = saved_outfit.face_color;
				
		if (saved_outfit.full_body[0] == null && saved_outfit.full_body[1] == null):
			new_model_display.get_child(0).get_child(0).find_child("FullBody").visible = false;
		elif (saved_outfit.full_body[0] == null):
			new_model_display.get_child(0).get_child(0).find_child("FullBody").get_child(0).visible = false;
			new_model_display.get_child(0).get_child(0).find_child("FullBody").visible = true;
			new_model_display.get_child(0).get_child(0).find_child("FullBody").texture = saved_outfit.full_body[1];
		else:
			new_model_display.get_child(0).get_child(0).find_child("FullBody").get_child(0).visible = true;
			new_model_display.get_child(0).get_child(0).find_child("FullBody").visible = true;
			new_model_display.get_child(0).get_child(0).find_child("FullBody").get_child(0).texture = saved_outfit.full_body[0];
			new_model_display.get_child(0).get_child(0).find_child("FullBody").texture = saved_outfit.full_body[1];
			
			if (saved_outfit.full_body_color != Color.WHITE):
				new_model_display.get_child(0).get_child(0).find_child("FullBody").get_child(0).modulate = saved_outfit.full_body_color;
		
		if (saved_outfit.hat[0] == null && saved_outfit.hat[1] == null):
			new_model_display.get_child(0).get_child(0).find_child("Hat").visible = false;
		elif (saved_outfit.hat[0] == null):
			new_model_display.get_child(0).get_child(0).find_child("Hat").get_child(0).visible = false;
			new_model_display.get_child(0).get_child(0).find_child("Hat").visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Hat").texture = saved_outfit.hat[1];
		else:
			new_model_display.get_child(0).get_child(0).find_child("Hat").get_child(0).visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Hat").visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Hat").get_child(0).texture = saved_outfit.hat[0];
			new_model_display.get_child(0).get_child(0).find_child("Hat").texture = saved_outfit.hat[1];
			
			if (saved_outfit.hat_color != Color.WHITE):
				new_model_display.get_child(0).get_child(0).find_child("Hat").get_child(0).modulate = saved_outfit.hat_color;
		
		if (saved_outfit.shirt[0] == null && saved_outfit.shirt[1] == null):
			new_model_display.get_child(0).get_child(0).find_child("Shirt").visible = false;
		elif (saved_outfit.shirt[0] == null):
			new_model_display.get_child(0).get_child(0).find_child("Shirt").get_child(0).visible = false;
			new_model_display.get_child(0).get_child(0).find_child("Shirt").visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Shirt").texture = saved_outfit.shirt[1];
		else:
			new_model_display.get_child(0).get_child(0).find_child("Shirt").get_child(0).visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Shirt").visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Shirt").get_child(0).texture = saved_outfit.shirt[0];
			new_model_display.get_child(0).get_child(0).find_child("Shirt").texture = saved_outfit.shirt[1];
			
			if (saved_outfit.shirt_color != Color.WHITE):
				new_model_display.get_child(0).get_child(0).find_child("Shirt").get_child(0).modulate = saved_outfit.shirt_color;
		
		if (saved_outfit.pants[0] == null && saved_outfit.pants[1] == null):
			new_model_display.get_child(0).get_child(0).find_child("Pants").visible = false;
		elif (saved_outfit.pants[0] == null):
			new_model_display.get_child(0).get_child(0).find_child("Pants").get_child(0).visible = false;
			new_model_display.get_child(0).get_child(0).find_child("Pants").visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Pants").texture = saved_outfit.pants[1];
		else:
			new_model_display.get_child(0).get_child(0).find_child("Pants").get_child(0).visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Pants").visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Pants").get_child(0).texture = saved_outfit.pants[0];
			new_model_display.get_child(0).get_child(0).find_child("Pants").texture = saved_outfit.pants[1];
			
			if (saved_outfit.pants_color != Color.WHITE):
				new_model_display.get_child(0).get_child(0).find_child("Pants").get_child(0).modulate = saved_outfit.pants_color;
		
		if (saved_outfit.tail[0] == null && saved_outfit.tail[1] == null):
			new_model_display.get_child(0).get_child(0).find_child("Tail").visible = false;
		elif (saved_outfit.tail[0] == null):
			new_model_display.get_child(0).get_child(0).find_child("Tail").get_child(0).visible = false;
			new_model_display.get_child(0).get_child(0).find_child("Tail").visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Tail").texture = saved_outfit.tail[1];
		else:
			new_model_display.get_child(0).get_child(0).find_child("Tail").get_child(0).visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Tail").visible = true;
			new_model_display.get_child(0).get_child(0).find_child("Tail").get_child(0).texture = saved_outfit.tail[0];
			new_model_display.get_child(0).get_child(0).find_child("Tail").texture = saved_outfit.tail[1];
			
			if (saved_outfit.tail_color != Color.WHITE):
				new_model_display.get_child(0).get_child(0).find_child("Tail").get_child(0).modulate = saved_outfit.tail_color;	
		
		
func _on_save_button_down() -> void:
	var body_color : Color = player_cat.get_child(0).modulate;

	var accessory = player_cat.find_child("Accessory", true, false);
	var accessory_to_save;
	var accessory_color : Color;
	
	if (accessory.visible):
		if (accessory.get_child(0).visible):
			accessory_to_save = [accessory.get_child(0).texture, accessory.get_child(1).texture];
			
			if (accessory.get_child(0).modulate != Color.WHITE):
				accessory_color = accessory.get_child(0).modulate;	
			else:
				accessory_color = Color.WHITE;
		else:
			accessory_to_save = [null, accessory.get_child(1).texture];
			accessory_color = Color.WHITE;
	else:
		accessory_to_save = [null, null];
		accessory_color = Color.WHITE;
		
	var face = player_cat.find_child("Face", true, false);
	var face_to_save
	var face_color : Color;
	
	if (face.visible):
		if (face.get_child(0).visible):
			face_to_save = [face.get_child(0).texture, face.get_child(1).texture];
			if (face.get_child(0).modulate != Color.WHITE):
				face_color = face.get_child(0).modulate;	
			else:
				face_color = Color.WHITE;
		else:
			face_to_save = [null, face.get_child(1).texture];
			face_color = Color.WHITE;
	else:
		face_to_save = [null, null];
		face_color = Color.WHITE;
		
	var full_body = player_cat.find_child("FullBody", true, false);
	var full_body_to_save;
	var full_body_color : Color;
	
	if (full_body.visible):
		if (full_body.get_child(0).visible):
			full_body_to_save = [full_body.get_child(0).texture, full_body.get_child(1).texture];
			if (full_body.get_child(0).modulate != Color.WHITE):
				full_body_color = full_body.get_child(0).modulate;	
			else:
				full_body_color = Color.WHITE;
		else:
			full_body_to_save = [null, full_body.get_child(1).texture];
			full_body_color = Color.WHITE;
	else:
		full_body_to_save = [null, null];
		full_body_color = Color.WHITE;
		
	var hat = player_cat.find_child("Hat", true, false);
	var hat_to_save
	var hat_color : Color;
	
	if (hat.visible):
		if (hat.get_child(0).visible):
			hat_to_save = [hat.get_child(0).texture, hat.get_child(1).texture];
			if (hat.get_child(0).modulate != Color.WHITE):
				hat_color = hat.get_child(0).modulate;	
			else:
				hat_color = Color.WHITE;
		else:
			hat_to_save = [null, hat.get_child(1).texture];
			hat_color = Color.WHITE;
	else:
		hat_to_save = [null, null];
		hat_color = Color.WHITE;
		
	var shirt = player_cat.find_child("Shirt", true, false);
	var shirt_to_save
	var shirt_color : Color;
	
	if (shirt.visible):
		if (shirt.get_child(0).visible):
			shirt_to_save = [shirt.get_child(0).texture, shirt.get_child(1).texture];
			if (shirt.get_child(0).modulate != Color.WHITE):
				shirt_color = shirt.get_child(0).modulate;	
			else:
				shirt_color = Color.WHITE;
		else:
			shirt_to_save = [null, shirt.get_child(1).texture];
			shirt_color = Color.WHITE;
	else:
		shirt_to_save = [null, null];
		shirt_color = Color.WHITE;
		
	var pants = player_cat.find_child("Pants", true, false);
	var pants_to_save;
	var pants_color : Color;
	
	if (pants.visible):
		if (pants.get_child(0).visible):
			pants_to_save = [pants.get_child(0).texture, pants.get_child(1).texture];
			if (pants.get_child(0).modulate != Color.WHITE):
				pants_color = pants.get_child(0).modulate;	
			else:
				pants_color = Color.WHITE;
		else:
			pants_to_save = [null, pants.get_child(1).texture];
			pants_color = Color.WHITE;
	else:
		pants_to_save = [null, null];
		pants_color = Color.WHITE;
		
	var tail = player_cat.find_child("Tail", true, false);
	var tail_to_save;
	var tail_color : Color;
	
	if (tail.visible):
		if (tail.get_child(0).visible):
			tail_to_save = [tail.get_child(0).texture, tail.get_child(1).texture];
			if (tail.get_child(0).modulate != Color.WHITE):
				tail_color = tail.get_child(0).modulate;	
			else:
				tail_color = Color.WHITE;
		else:
			tail_to_save = [null, tail.get_child(1).texture];
			tail_color = Color.WHITE;
	else:
		tail_to_save = [null, null];
		tail_color = Color.WHITE;
		
	var complete_cat_model := CompleteModel.new(body_color, face_to_save, face_color, tail_to_save, tail_color, full_body_to_save, full_body_color, accessory_to_save, accessory_color, hat_to_save, hat_color, shirt_to_save, shirt_color, pants_to_save, pants_color);
	save_game.models.push_back(complete_cat_model);
	
	var new_model_display = complete_temp.instantiate();
	new_model_display.complete_model = complete_cat_model;
	saves_container.add_child(new_model_display);

	new_model_display.get_child(0).get_child(0).find_child("Body_Color").modulate = body_color;
	
	if (accessory_to_save[0] == null && accessory_to_save[1] == null):
		new_model_display.get_child(0).get_child(0).find_child("Accessory").visible = false;
	elif (accessory_to_save[0] == null):
		new_model_display.get_child(0).get_child(0).find_child("Accessory").get_child(0).visible = false;
		new_model_display.get_child(0).get_child(0).find_child("Accessory").visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Accessory").texture = accessory_to_save[1];
	else:
		new_model_display.get_child(0).get_child(0).find_child("Accessory").get_child(0).visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Accessory").visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Accessory").get_child(0).texture = accessory_to_save[0];
		new_model_display.get_child(0).get_child(0).find_child("Accessory").texture = accessory_to_save[1];
		
		if (accessory_color != Color.WHITE):
			new_model_display.get_child(0).get_child(0).find_child("Accessory").get_child(0).modulate = accessory_color;
			
	if (face_to_save[0] == null && face_to_save[1] == null):
		new_model_display.get_child(0).get_child(0).find_child("Face").visible = false;
	elif (face_to_save[0] == null):
		new_model_display.get_child(0).get_child(0).find_child("Face").get_child(0).visible = false;
		new_model_display.get_child(0).get_child(0).find_child("Face").visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Face").texture = face_to_save[1];
	else:
		new_model_display.get_child(0).get_child(0).find_child("Face").get_child(0).visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Face").visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Face").get_child(0).texture = face_to_save[0];
		new_model_display.get_child(0).get_child(0).find_child("Face").texture = face_to_save[1];
		
		if (face_color != Color.WHITE):
			new_model_display.get_child(0).get_child(0).find_child("Face").get_child(0).modulate = face_color;
			
	if (full_body_to_save[0] == null && full_body_to_save[1] == null):
		new_model_display.get_child(0).get_child(0).find_child("FullBody").visible = false;
	elif (full_body_to_save[0] == null):
		new_model_display.get_child(0).get_child(0).find_child("FullBody").get_child(0).visible = false;
		new_model_display.get_child(0).get_child(0).find_child("FullBody").visible = true;
		new_model_display.get_child(0).get_child(0).find_child("FullBody").texture = full_body_to_save[1];
	else:
		new_model_display.get_child(0).get_child(0).find_child("FullBody").get_child(0).visible = true;
		new_model_display.get_child(0).get_child(0).find_child("FullBody").visible = true;
		new_model_display.get_child(0).get_child(0).find_child("FullBody").get_child(0).texture = full_body_to_save[0];
		new_model_display.get_child(0).get_child(0).find_child("FullBody").texture = full_body_to_save[1];
		
		if (full_body_color != Color.WHITE):
			new_model_display.get_child(0).get_child(0).find_child("FullBody").get_child(0).modulate = full_body_color;
	
	if (hat_to_save[0] == null && hat_to_save[1] == null):
		new_model_display.get_child(0).get_child(0).find_child("Hat").visible = false;
	elif (hat_to_save[0] == null):
		new_model_display.get_child(0).get_child(0).find_child("Hat").get_child(0).visible = false;
		new_model_display.get_child(0).get_child(0).find_child("Hat").visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Hat").texture = hat_to_save[1];
	else:
		new_model_display.get_child(0).get_child(0).find_child("Hat").get_child(0).visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Hat").visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Hat").get_child(0).texture = hat_to_save[0];
		new_model_display.get_child(0).get_child(0).find_child("Hat").texture = hat_to_save[1];
		
		if (hat_color != Color.WHITE):
			new_model_display.get_child(0).get_child(0).find_child("Hat").get_child(0).modulate = hat_color;
	
	if (shirt_to_save[0] == null && shirt_to_save[1] == null):
		new_model_display.get_child(0).get_child(0).find_child("Shirt").visible = false;
	elif (shirt_to_save[0] == null):
		new_model_display.get_child(0).get_child(0).find_child("Shirt").get_child(0).visible = false;
		new_model_display.get_child(0).get_child(0).find_child("Shirt").visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Shirt").texture = shirt_to_save[1];
	else:
		new_model_display.get_child(0).get_child(0).find_child("Shirt").get_child(0).visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Shirt").visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Shirt").get_child(0).texture = shirt_to_save[0];
		new_model_display.get_child(0).get_child(0).find_child("Shirt").texture = shirt_to_save[1];
		
		if (shirt_color != Color.WHITE):
			new_model_display.get_child(0).get_child(0).find_child("Shirt").get_child(0).modulate = shirt_color;
	
	if (pants_to_save[0] == null && pants_to_save[1] == null):
		new_model_display.get_child(0).get_child(0).find_child("Pants").visible = false;
	elif (pants_to_save[0] == null):
		new_model_display.get_child(0).get_child(0).find_child("Pants").get_child(0).visible = false;
		new_model_display.get_child(0).get_child(0).find_child("Pants").visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Pants").texture = pants_to_save[1];
	else:
		new_model_display.get_child(0).get_child(0).find_child("Pants").get_child(0).visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Pants").visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Pants").get_child(0).texture = pants_to_save[0];
		new_model_display.get_child(0).get_child(0).find_child("Pants").texture = pants_to_save[1];
		
		if (pants_color != Color.WHITE):
			new_model_display.get_child(0).get_child(0).find_child("Pants").get_child(0).modulate = pants_color;
	
	if (tail_to_save[0] == null && tail_to_save[1] == null):
		new_model_display.get_child(0).get_child(0).find_child("Tail").visible = false;
	elif (tail_to_save[0] == null):
		new_model_display.get_child(0).get_child(0).find_child("Tail").get_child(0).visible = false;
		new_model_display.get_child(0).get_child(0).find_child("Tail").visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Tail").texture = tail_to_save[1];
	else:
		new_model_display.get_child(0).get_child(0).find_child("Tail").get_child(0).visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Tail").visible = true;
		new_model_display.get_child(0).get_child(0).find_child("Tail").get_child(0).texture = tail_to_save[0];
		new_model_display.get_child(0).get_child(0).find_child("Tail").texture = tail_to_save[1];
		
		if (tail_color != Color.WHITE):
			new_model_display.get_child(0).get_child(0).find_child("Tail").get_child(0).modulate = tail_color;	
	
	save();
	
func _on_return_button_down() -> void:
	finished.emit();
