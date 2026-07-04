extends Control

var complete_model : CompleteModel;

@onready var save_handler : Node = get_tree().root.get_child(1);
@onready var game_handler : Node = get_tree().root.get_child(0);

var save_game : AllModels;

var player_cat;

signal save;

func _ready() -> void:
	save.connect(save_handler.save)

func _on_delete_button_down() -> void:
	save_game = save_handler.save_game;
	
	if (save_game.models.has(complete_model)):
		save_game.models.erase(complete_model);
		save.emit();
		
	queue_free();

func _on_load_button_down() -> void:
	var player_cat = save_handler.player_cat;
	
	var game_container = game_handler.get_child(0);
	var home_cat = game_container.find_child("Character");
	
	player_cat.find_child("Body_Color", true, false).modulate = complete_model.body_color;
	home_cat.find_child("Body_Color", true, false).modulate = complete_model.body_color;
		
	if (complete_model.accessory[0] == null && complete_model.accessory[1] == null):
		player_cat.find_child("Accessory", true, false).visible = false;
		home_cat.find_child("Accessory", true, false).visible = false;
	elif (complete_model.accessory[0] == null):
		player_cat.find_child("Accessory", true, false).visible = true;
		home_cat.find_child("Accessory", true, false).visible = true;
		
		player_cat.find_child("Accessory", true, false).get_child(0).visible = false;
		home_cat.find_child("Accessory", true, false).get_child(0).visible = false;
		
		player_cat.find_child("Accessory", true, false).get_child(1).visible = true;
		player_cat.find_child("Accessory", true, false).get_child(1).texture = complete_model.accessory[1];
		home_cat.find_child("Accessory", true, false).get_child(1).visible = true;
		home_cat.find_child("Accessory", true, false).get_child(1).texture = complete_model.accessory[1];
	else:
		player_cat.find_child("Accessory", true, false).visible = true;
		home_cat.find_child("Accessory", true, false).visible = true;
		
		player_cat.find_child("Accessory", true, false).get_child(0).visible = true;
		player_cat.find_child("Accessory", true, false).get_child(0).texture = complete_model.accessory[0];
		home_cat.find_child("Accessory", true, false).get_child(0).visible = true;
		home_cat.find_child("Accessory", true, false).get_child(0).texture = complete_model.accessory[0];

		player_cat.find_child("Accessory", true, false).get_child(1).visible = true;
		player_cat.find_child("Accessory", true, false).get_child(1).texture = complete_model.accessory[1];
		home_cat.find_child("Accessory", true, false).get_child(1).visible = true;
		home_cat.find_child("Accessory", true, false).get_child(1).texture = complete_model.accessory[1];	
			
		if (complete_model.accessory_color != Color.WHITE):
			player_cat.find_child("Accessory", true, false).get_child(0).modulate = complete_model.accessory_color;
			home_cat.find_child("Accessory", true, false).get_child(0).modulate = complete_model.accessory_color;
		else:
			player_cat.find_child("Accessory", true, false).get_child(0).modulate = Color.WHITE;
			home_cat.find_child("Accessory", true, false).get_child(0).modulate = Color.WHITE;
	
	if (complete_model.face[0] == null && complete_model.face[1] == null):
		player_cat.find_child("Face", true, false).visible = false;
		home_cat.find_child("Face", true, false).visible = false;
	elif (complete_model.face[0] == null):
		player_cat.find_child("Face", true, false).visible = true;
		home_cat.find_child("Face", true, false).visible = true;
		
		player_cat.find_child("Face", true, false).get_child(0).visible = false;
		home_cat.find_child("Face", true, false).get_child(0).visible = false;
		
		player_cat.find_child("Face", true, false).get_child(1).visible = true;
		player_cat.find_child("Face", true, false).get_child(1).texture = complete_model.face[1];
		home_cat.find_child("Face", true, false).get_child(1).visible = true;
		home_cat.find_child("Face", true, false).get_child(1).texture = complete_model.face[1];
	else:
		player_cat.find_child("Face", true, false).visible = true;
		home_cat.find_child("Face", true, false).visible = true;
		
		player_cat.find_child("Face", true, false).get_child(0).visible = true;
		player_cat.find_child("Face", true, false).get_child(0).texture = complete_model.face[0];
		home_cat.find_child("Face", true, false).get_child(0).visible = true;
		home_cat.find_child("Face", true, false).get_child(0).texture = complete_model.face[0];

		player_cat.find_child("Face", true, false).get_child(1).visible = true;
		player_cat.find_child("Face", true, false).get_child(1).texture = complete_model.face[1];
		home_cat.find_child("Face", true, false).get_child(1).visible = true;
		home_cat.find_child("Face", true, false).get_child(1).texture = complete_model.face[1];	
			
		if (complete_model.face_color != Color.WHITE):
			player_cat.find_child("Face", true, false).get_child(0).modulate = complete_model.face_color;
			home_cat.find_child("Face", true, false).get_child(0).modulate = complete_model.face_color;
		else:
			player_cat.find_child("Face", true, false).get_child(0).modulate = Color.WHITE;
			home_cat.find_child("Face", true, false).get_child(0).modulate = Color.WHITE;
			
	if (complete_model.full_body[0] == null && complete_model.full_body[1] == null):
		player_cat.find_child("FullBody", true, false).visible = false;
		home_cat.find_child("FullBody", true, false).visible = false;
	elif (complete_model.full_body[0] == null):
		player_cat.find_child("FullBody", true, false).visible = true;
		home_cat.find_child("FullBody", true, false).visible = true;
		
		player_cat.find_child("FullBody", true, false).get_child(0).visible = false;
		home_cat.find_child("FullBody", true, false).get_child(0).visible = false;
		
		player_cat.find_child("FullBody", true, false).get_child(1).visible = true;
		player_cat.find_child("FullBody", true, false).get_child(1).texture = complete_model.full_body[1];
		home_cat.find_child("FullBody", true, false).get_child(1).visible = true;
		home_cat.find_child("FullBody", true, false).get_child(1).texture = complete_model.full_body[1];
	else:
		player_cat.find_child("FullBody", true, false).visible = true;
		home_cat.find_child("FullBody", true, false).visible = true;
		
		player_cat.find_child("FullBody", true, false).get_child(0).visible = true;
		player_cat.find_child("FullBody", true, false).get_child(0).texture = complete_model.full_body[0];
		home_cat.find_child("FullBody", true, false).get_child(0).visible = true;
		home_cat.find_child("FullBody", true, false).get_child(0).texture = complete_model.full_body[0];

		player_cat.find_child("FullBody", true, false).get_child(1).visible = true;
		player_cat.find_child("FullBody", true, false).get_child(1).texture = complete_model.full_body[1];
		home_cat.find_child("FullBody", true, false).get_child(1).visible = true;
		home_cat.find_child("FullBody", true, false).get_child(1).texture = complete_model.full_body[1];	
			
		if (complete_model.full_body_color != Color.WHITE):
			player_cat.find_child("FullBody", true, false).get_child(0).modulate = complete_model.full_body_color;
			home_cat.find_child("FullBody", true, false).get_child(0).modulate = complete_model.full_body_color;
		else:
			player_cat.find_child("FullBody", true, false).get_child(0).modulate = Color.WHITE;
			home_cat.find_child("FullBody", true, false).get_child(0).modulate = Color.WHITE;

	if (complete_model.hat[0] == null && complete_model.hat[1] == null):
		player_cat.find_child("Hat", true, false).visible = false;
		home_cat.find_child("Hat", true, false).visible = false;
	elif (complete_model.hat[0] == null):
		player_cat.find_child("Hat", true, false).visible = true;
		home_cat.find_child("Hat", true, false).visible = true;
		
		player_cat.find_child("Hat", true, false).get_child(0).visible = false;
		home_cat.find_child("Hat", true, false).get_child(0).visible = false;
		
		player_cat.find_child("Hat", true, false).get_child(1).visible = true;
		player_cat.find_child("Hat", true, false).get_child(1).texture = complete_model.hat[1];
		home_cat.find_child("Hat", true, false).get_child(1).visible = true;
		home_cat.find_child("Hat", true, false).get_child(1).texture = complete_model.hat[1];
	else:
		player_cat.find_child("Hat", true, false).visible = true;
		home_cat.find_child("Hat", true, false).visible = true;
		
		player_cat.find_child("Hat", true, false).get_child(0).visible = true;
		player_cat.find_child("Hat", true, false).get_child(0).texture = complete_model.hat[0];
		home_cat.find_child("Hat", true, false).get_child(0).visible = true;
		home_cat.find_child("Hat", true, false).get_child(0).texture = complete_model.hat[0];

		player_cat.find_child("Hat", true, false).get_child(1).visible = true;
		player_cat.find_child("Hat", true, false).get_child(1).texture = complete_model.hat[1];
		home_cat.find_child("Hat", true, false).get_child(1).visible = true;
		home_cat.find_child("Hat", true, false).get_child(1).texture = complete_model.hat[1];	
			
		if (complete_model.hat_color != Color.WHITE):
			player_cat.find_child("Hat", true, false).get_child(0).modulate = complete_model.hat_color;
			home_cat.find_child("Hat", true, false).get_child(0).modulate = complete_model.hat_color;
		else:
			player_cat.find_child("Hat", true, false).get_child(0).modulate = Color.WHITE;
			home_cat.find_child("Hat", true, false).get_child(0).modulate = Color.WHITE;
			
	if (complete_model.shirt[0] == null && complete_model.shirt[1] == null):
		player_cat.find_child("Shirt", true, false).visible = false;
		home_cat.find_child("Shirt", true, false).visible = false;
	elif (complete_model.shirt[0] == null):
		player_cat.find_child("Shirt", true, false).visible = true;
		home_cat.find_child("Shirt", true, false).visible = true;
		
		player_cat.find_child("Shirt", true, false).get_child(0).visible = false;
		home_cat.find_child("Shirt", true, false).get_child(0).visible = false;
		
		player_cat.find_child("Shirt", true, false).get_child(1).visible = true;
		player_cat.find_child("Shirt", true, false).get_child(1).texture = complete_model.shirt[1];
		home_cat.find_child("Shirt", true, false).get_child(1).visible = true;
		home_cat.find_child("Shirt", true, false).get_child(1).texture = complete_model.shirt[1];
	else:
		player_cat.find_child("Shirt", true, false).visible = true;
		home_cat.find_child("Shirt", true, false).visible = true;
		
		player_cat.find_child("Shirt", true, false).get_child(0).visible = true;
		player_cat.find_child("Shirt", true, false).get_child(0).texture = complete_model.shirt[0];
		home_cat.find_child("Shirt", true, false).get_child(0).visible = true;
		home_cat.find_child("Shirt", true, false).get_child(0).texture = complete_model.shirt[0];

		player_cat.find_child("Shirt", true, false).get_child(1).visible = true;
		player_cat.find_child("Shirt", true, false).get_child(1).texture = complete_model.shirt[1];
		home_cat.find_child("Shirt", true, false).get_child(1).visible = true;
		home_cat.find_child("Shirt", true, false).get_child(1).texture = complete_model.shirt[1];	
			
		if (complete_model.shirt_color != Color.WHITE):
			player_cat.find_child("Shirt", true, false).get_child(0).modulate = complete_model.shirt_color;
			home_cat.find_child("Shirt", true, false).get_child(0).modulate = complete_model.shirt_color;
		else:
			player_cat.find_child("Shirt", true, false).get_child(0).modulate = Color.WHITE;
			home_cat.find_child("Shirt", true, false).get_child(0).modulate = Color.WHITE;

	if (complete_model.pants[0] == null && complete_model.pants[1] == null):
		player_cat.find_child("Pants", true, false).visible = false;
		home_cat.find_child("Pants", true, false).visible = false;
	elif (complete_model.pants[0] == null):
		player_cat.find_child("Pants", true, false).visible = true;
		home_cat.find_child("Pants", true, false).visible = true;
		
		player_cat.find_child("Pants", true, false).get_child(0).visible = false;
		home_cat.find_child("Pants", true, false).get_child(0).visible = false;
		
		player_cat.find_child("Pants", true, false).get_child(1).visible = true;
		player_cat.find_child("Pants", true, false).get_child(1).texture = complete_model.pants[1];
		home_cat.find_child("Pants", true, false).get_child(1).visible = true;
		home_cat.find_child("Pants", true, false).get_child(1).texture = complete_model.pants[1];
	else:
		player_cat.find_child("Pants", true, false).visible = true;
		home_cat.find_child("Pants", true, false).visible = true;
		
		player_cat.find_child("Pants", true, false).get_child(0).visible = true;
		player_cat.find_child("Pants", true, false).get_child(0).texture = complete_model.pants[0];
		home_cat.find_child("Pants", true, false).get_child(0).visible = true;
		home_cat.find_child("Pants", true, false).get_child(0).texture = complete_model.pants[0];

		player_cat.find_child("Pants", true, false).get_child(1).visible = true;
		player_cat.find_child("Pants", true, false).get_child(1).texture = complete_model.pants[1];
		home_cat.find_child("Pants", true, false).get_child(1).visible = true;
		home_cat.find_child("Pants", true, false).get_child(1).texture = complete_model.pants[1];	
			
		if (complete_model.pants_color != Color.WHITE):
			player_cat.find_child("Pants", true, false).get_child(0).modulate = complete_model.pants_color;
			home_cat.find_child("Pants", true, false).get_child(0).modulate = complete_model.pants_color;
		else:
			player_cat.find_child("Pants", true, false).get_child(0).modulate = Color.WHITE;
			home_cat.find_child("Pants", true, false).get_child(0).modulate = Color.WHITE;
			
	if (complete_model.tail[0] == null && complete_model.tail[1] == null):
		player_cat.find_child("Tail", true, false).visible = false;
		home_cat.find_child("Tail", true, false).visible = false;
	elif (complete_model.tail[0] == null):
		player_cat.find_child("Tail", true, false).visible = true;
		home_cat.find_child("Tail", true, false).visible = true;
		
		player_cat.find_child("Tail", true, false).get_child(0).visible = false;
		home_cat.find_child("Tail", true, false).get_child(0).visible = false;
		
		player_cat.find_child("Tail", true, false).get_child(1).visible = true;
		player_cat.find_child("Tail", true, false).get_child(1).texture = complete_model.tail[1];
		home_cat.find_child("Tail", true, false).get_child(1).visible = true;
		home_cat.find_child("Tail", true, false).get_child(1).texture = complete_model.tail[1];
	else:
		player_cat.find_child("Tail", true, false).visible = true;
		home_cat.find_child("Tail", true, false).visible = true;
		
		player_cat.find_child("Tail", true, false).get_child(0).visible = true;
		player_cat.find_child("Tail", true, false).get_child(0).texture = complete_model.tail[0];
		home_cat.find_child("Tail", true, false).get_child(0).visible = true;
		home_cat.find_child("Tail", true, false).get_child(0).texture = complete_model.tail[0];

		player_cat.find_child("Tail", true, false).get_child(1).visible = true;
		player_cat.find_child("Tail", true, false).get_child(1).texture = complete_model.tail[1];
		home_cat.find_child("Tail", true, false).get_child(1).visible = true;
		home_cat.find_child("Tail", true, false).get_child(1).texture = complete_model.tail[1];
		
		if (complete_model.tail_color != Color.WHITE):
			player_cat.find_child("Tail", true, false).get_child(0).modulate = complete_model.tail_color;
			home_cat.find_child("Tail", true, false).get_child(0).modulate = complete_model.tail_color;
		else:
			player_cat.find_child("Tail", true, false).get_child(0).modulate = Color.WHITE;
			home_cat.find_child("Tail", true, false).get_child(0).modulate = Color.WHITE;
