extends Node

@onready var cat_model = preload("res://nodes/cat_model.tscn");

@export var goodsContainer : GoodsContainer;

@export var tail_container : ScrollContainer;
@export var accessory_container : ScrollContainer;
@export var face_container : ScrollContainer;
@export var full_body_container : ScrollContainer;
@export var hat_container : ScrollContainer;                 
@export var pants_container : ScrollContainer;
@export var shirt_container : ScrollContainer;

@export var player_cat : Sprite2D;

@export var color_picker : ColorPicker;

@export var section_title : Label;

signal enableColor(good_type);
signal transfer_cat(created_model);

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enableColor.connect(color_picker.change)
	
	for i in AllGoods.Goods.size():
		var current_good = cat_model.instantiate();
		
		current_good.good = Good.new(goodsContainer.typeList[AllGoods.Goods.values()[i]], [Attribute.new(goodsContainer.attribute1List[AllGoods.Goods.values()[1]])], goodsContainer.priceList[AllGoods.Goods.values()[i]], AllGoods.Goods.values()[i], goodsContainer.outlineList[AllGoods.Goods.values()[i]], goodsContainer.colorList[AllGoods.Goods.values()[i]], goodsContainer.customizableList[AllGoods.Goods.values()[i]]);
		
		current_good.get_child(0).get_child(1).texture = current_good.good.outline;
		
		if (current_good.good.color != null):
			current_good.get_child(0).get_child(2).texture = current_good.good.color;
		else:
			current_good.get_child(0).get_child(2).visible = false;
		
		match current_good.good.good_type:
			Good.GoodType.ACCESSORY:
				accessory_container.get_child(0).add_child(current_good);
			Good.GoodType.FACE:	
				face_container.get_child(0).add_child(current_good);
			Good.GoodType.FULL_BODY:
				full_body_container.get_child(0).add_child(current_good);
			Good.GoodType.HAT:
				hat_container.get_child(0).add_child(current_good);
			Good.GoodType.PANTS:
				pants_container.get_child(0).add_child(current_good);
			Good.GoodType.SHIRT:
				shirt_container.get_child(0).add_child(current_good);
			Good.GoodType.TAIL:
				tail_container.get_child(0).add_child(current_good);
				current_good.get_child(0).get_child(2).z_index = 0;
				current_good.get_child(0).get_child(1).z_index = 0;
				
func change(selected_good : Good):
	if (selected_good.customizable):
		color_picker.visible = true;
		enableColor.emit(selected_good.good_type);
	else:
		color_picker.visible = false;
		
	match selected_good.good_type:		
		Good.GoodType.ACCESSORY:
			var accessory = player_cat.find_child("Accessory");
			
			accessory.get_child(0).modulate = Color.WHITE;
			color_picker.color = Color.WHITE;
			
			if (selected_good.outline == accessory.get_child(1).texture && accessory.visible):
				accessory.visible = false;
				color_picker.visible = false;
			else: 
				accessory.visible = true;
					
				accessory.get_child(1).texture = selected_good.outline;
				
				if (selected_good.color != null):
					accessory.get_child(0).visible = true;
					accessory.get_child(0).texture = selected_good.color;
				else:
					accessory.get_child(0).visible = false;
		Good.GoodType.FACE:	
			var face = player_cat.find_child("Face");
			
			face.get_child(0).modulate = Color.WHITE;
			color_picker.color = Color.WHITE;
				
			if (selected_good.outline == face.get_child(1).texture && face.visible):
				face.visible = false;
				color_picker.visible = false;
			else: 
				face.get_child(1).texture = selected_good.outline;
				
				face.visible = true;
				
				if (selected_good.color != null):
					face.get_child(0).visible = true;
					face.get_child(0).texture = selected_good.color;
				else:
					face.get_child(0).visible = false;
		Good.GoodType.FULL_BODY:
			var full_body = player_cat.find_child("FullBody");
			
			var shirt = player_cat.find_child("Shirt");
			var pants = player_cat.find_child("Pants");
			
			full_body.get_child(0).modulate = Color.WHITE;
			color_picker.color = Color.WHITE;
			
			if (selected_good.outline == full_body.get_child(1).texture && full_body.visible):
				full_body.visible = false;
				color_picker.visible = false;
			else: 
				full_body.get_child(1).texture = selected_good.outline;
				
				full_body.visible = true;
				
				if (shirt.visible):
					shirt.visible = false;
					
				if (pants.visible):
					pants.visible = false;
				
				if (selected_good.color != null):
					full_body.get_child(0).visible = true;
					full_body.get_child(0).texture = selected_good.color;
				else:
					full_body.get_child(0).visible = false;
		Good.GoodType.HAT:
			var hat = player_cat.find_child("Hat");
			
			hat.get_child(0).modulate = Color.WHITE;
			color_picker.color = Color.WHITE;
			
			if (selected_good.outline == hat.get_child(1).texture && hat.visible):
				hat.visible = false;
				color_picker.visible = false;
			else: 
				hat.visible = true;
				
				hat.get_child(1).texture = selected_good.outline;
				
				if (selected_good.color != null):
					hat.get_child(0).visible = true;
					hat.get_child(0).texture = selected_good.color;
				else:
					hat.get_child(0).visible = false;
		Good.GoodType.PANTS:
			var full_body = player_cat.find_child("FullBody");
			var pants = player_cat.find_child("Pants");
			
			pants.get_child(0).modulate = Color.WHITE;
			color_picker.color = Color.WHITE;
			
			if (selected_good.outline == pants.get_child(1).texture && pants.visible):
				pants.visible = false;
				color_picker.visible = false;
			else: 
				pants.get_child(1).texture = selected_good.outline;
				
				pants.visible = true;
				
				if (full_body.visible):
					full_body.visible = false;
				
				if (selected_good.color != null):
					pants.get_child(0).visible = true;
					pants.get_child(0).texture = selected_good.color;
				else:
					pants.get_child(0).visible = false;
		Good.GoodType.SHIRT:
			var full_body = player_cat.find_child("FullBody");
			var shirt = player_cat.find_child("Shirt");
			
			shirt.get_child(0).modulate = Color.WHITE;
			color_picker.color = Color.WHITE;
			
			if (selected_good.outline == shirt.get_child(1).texture && shirt.visible):
				shirt.visible = false;
				color_picker.visible = false;
			else: 
				shirt.get_child(1).texture = selected_good.outline;
				
				shirt.visible = true;
				
				if (full_body.visible):
					full_body.visible = false;
					
				if (selected_good.color != null):
					shirt.get_child(0).visible = true;
					shirt.get_child(0).texture = selected_good.color;
				else:
					shirt.get_child(0).visible = false;
		Good.GoodType.TAIL:
			var tail = player_cat.find_child("Tail");
			
			tail.get_child(0).modulate = Color.WHITE;
			color_picker.color = Color.WHITE;
			
			if (selected_good.outline == tail.get_child(1).texture && tail.visible):
				tail.visible = false;
				color_picker.visible = false;
			else: 
				tail.visible = true;
				
				tail.get_child(1).texture = selected_good.outline;
				
				if (selected_good.color != null):
					tail.get_child(0).visible = true;
					tail.get_child(0).texture = selected_good.color;
				else:
					tail.get_child(0).visible = false;

func get_random_color() -> Color: 
	return Color(
		randf(),
		randf(),
		randf()
	)

func sparkle_option(selected_good : Good) -> void:
	match (selected_good.good_type):
		Good.GoodType.ACCESSORY:		
			for clothes_option in accessory_container.get_child(0).get_children():
				if (clothes_option.get_child(0).find_child("Thing_Outline").texture == selected_good.outline):
					clothes_option.sparkle();
				elif (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.FACE:	
			for clothes_option in face_container.get_child(0).get_children():
				if (clothes_option.get_child(0).find_child("Thing_Outline").texture == selected_good.outline):
					clothes_option.sparkle();
				elif (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.FULL_BODY:
			for clothes_option in full_body_container.get_child(0).get_children():
				if (clothes_option.get_child(0).find_child("Thing_Outline").texture == selected_good.outline):
					clothes_option.sparkle();
				elif (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.HAT:
			for clothes_option in hat_container.get_child(0).get_children():
				if (clothes_option.get_child(0).find_child("Thing_Outline").texture == selected_good.outline):
					clothes_option.sparkle();
				elif (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.PANTS:
			for clothes_option in pants_container.get_child(0).get_children():
				if (clothes_option.get_child(0).find_child("Thing_Outline").texture == selected_good.outline):
					clothes_option.sparkle();
				elif (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.SHIRT:
			for clothes_option in shirt_container.get_child(0).get_children():
				if (clothes_option.get_child(0).find_child("Thing_Outline").texture == selected_good.outline):
					clothes_option.sparkle();
				elif (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.TAIL:
			for clothes_option in tail_container.get_child(0).get_children():
				if (clothes_option.get_child(0).find_child("Thing_Outline").texture == selected_good.outline):
					clothes_option.sparkle();
				elif (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
					
func sparkle_option_texture(selected_outline : Texture2D, good_type : Good.GoodType) -> void:
	match (good_type):
		Good.GoodType.ACCESSORY:		
			for clothes_option in accessory_container.get_child(0).get_children():
				if (clothes_option.get_child(0).find_child("Thing_Outline").texture == selected_outline):
					clothes_option.sparkle();
				elif (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.FACE:	
			for clothes_option in face_container.get_child(0).get_children():
				if (clothes_option.get_child(0).find_child("Thing_Outline").texture == selected_outline):
					clothes_option.sparkle();
				elif (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.FULL_BODY:
			for clothes_option in full_body_container.get_child(0).get_children():
				if (clothes_option.get_child(0).find_child("Thing_Outline").texture == selected_outline):
					clothes_option.sparkle();
				elif (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.HAT:
			for clothes_option in hat_container.get_child(0).get_children():
				if (clothes_option.get_child(0).find_child("Thing_Outline").texture == selected_outline):
					clothes_option.sparkle();
				elif (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.PANTS:
			for clothes_option in pants_container.get_child(0).get_children():
				if (clothes_option.get_child(0).find_child("Thing_Outline").texture == selected_outline):
					clothes_option.sparkle();
				elif (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.SHIRT:
			for clothes_option in shirt_container.get_child(0).get_children():
				if (clothes_option.get_child(0).find_child("Thing_Outline").texture == selected_outline):
					clothes_option.sparkle();
				elif (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.TAIL:
			for clothes_option in tail_container.get_child(0).get_children():
				if (clothes_option.get_child(0).find_child("Thing_Outline").texture == selected_outline):
					clothes_option.sparkle();
				elif (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();

func unsparkle_all(selected_good_type : Good.GoodType) -> void:
	match (selected_good_type):
		Good.GoodType.ACCESSORY:		
			for clothes_option in accessory_container.get_child(0).get_children():
				if (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.FACE:	
			for clothes_option in face_container.get_child(0).get_children():
				if (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.FULL_BODY:
			for clothes_option in full_body_container.get_child(0).get_children():
				if (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.HAT:
			for clothes_option in hat_container.get_child(0).get_children():
				if (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.PANTS:
			for clothes_option in pants_container.get_child(0).get_children():
				if (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.SHIRT:
			for clothes_option in shirt_container.get_child(0).get_children():
				if (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
		Good.GoodType.TAIL:
			for clothes_option in tail_container.get_child(0).get_children():
				if (clothes_option.is_sparkling):
					clothes_option.stop_sparkling();
										
func _on_randomize_button_down() -> void:
	if (!section_title.visible):
		var rand_color := get_random_color();
		player_cat.find_child("Body_Color").modulate = rand_color;
		
		var accessory = player_cat.find_child("Accessory");
		var accessories := accessory_container.get_child(0).get_children();
				
		var acc_chance = randi_range(0, accessories.size());
				
		if (acc_chance != 0):
			accessory.visible = true;
					
			var new_accessory = accessories.pick_random();
					
			accessory.get_child(1).texture = new_accessory.good.outline;
					
			sparkle_option(new_accessory.good);
			
			if (new_accessory.good.color != null):
				accessory.get_child(0).visible = true;
				accessory.get_child(0).texture = new_accessory.good.color;
			else:
				accessory.get_child(0).visible = false;
						
			if (new_accessory.good.customizable):			
				var rand_acc_color := get_random_color();
				accessory.get_child(0).modulate = rand_acc_color;
			else:
				accessory.get_child(0).modulate = Color.WHITE;
		else:
			accessory.visible = false;
			unsparkle_all(Good.GoodType.ACCESSORY);

		var face = player_cat.find_child("Face");
		var faces := face_container.get_child(0).get_children();
				
		var face_chance = randi_range(0, faces.size());
				
		if (face_chance != 0):
			face.visible = true;
					
			var new_face = faces.pick_random();
					
			face.get_child(1).texture = new_face.good.outline;
					
			sparkle_option(new_face.good);
			
			if (new_face.good.color != null):
				face.get_child(0).visible = true;
				face.get_child(0).texture = new_face.good.color;
			else:
				face.get_child(0).visible = false;
						
			if (new_face.good.customizable):	
				var rand_face_color := get_random_color();
				face.get_child(0).modulate = rand_face_color;
			else:
				face.get_child(0).modulate = Color.WHITE;
		else:
			face.visible = false;
			unsparkle_all(Good.GoodType.FACE);
			
		var clothes_type_chance = randi_range(0, 1);
		
		if (clothes_type_chance == 0):
				var full_body = player_cat.find_child("FullBody");
				
				var shirt = player_cat.find_child("Shirt");
				var pants = player_cat.find_child("Pants");
				
				var full_bodies := full_body_container.get_child(0).get_children();
				
				var chance = randi_range(0, full_bodies.size());
				
				if (chance != 0):	
					full_body.visible = true;
					
					var new_full_body = full_bodies.pick_random();
					
					full_body.get_child(1).texture = new_full_body.good.outline;
					
					sparkle_option(new_full_body.good);
					
					if (shirt.visible):
						shirt.visible = false;
						
					if (pants.visible):
						pants.visible = false;
						
					if (new_full_body.good.color != null):
						full_body.get_child(0).visible = true;
						full_body.get_child(0).texture = new_full_body.good.color;
					else:
						full_body.get_child(0).visible = false;
						
					if (new_full_body.good.customizable):							
						var rand_full_body_color := get_random_color();
						full_body.get_child(0).modulate = rand_full_body_color;
					else:
						full_body.get_child(0).modulate = Color.WHITE;
				else:
					shirt.visible = false;
					pants.visible = false;
					
					full_body.visible = false;
					unsparkle_all(Good.GoodType.FULL_BODY);
					
		else:
			var full_body = player_cat.find_child("FullBody");

			var pants = player_cat.find_child("Pants");
				
			var all_pants := pants_container.get_child(0).get_children();
				
			var chance = randi_range(0, all_pants.size());
				
			if (chance != 0):	
				pants.visible = true;
					
				var new_pants = all_pants.pick_random();
					
				pants.get_child(1).texture = new_pants.good.outline;
					
				sparkle_option(new_pants.good);
						
				if (full_body.visible):
					full_body.visible = false;
						
				if (new_pants.good.color != null):
					pants.get_child(0).visible = true;
					pants.get_child(0).texture = new_pants.good.color;
				else:
					pants.get_child(0).visible = false;
						
				if (new_pants.good.customizable):	
					var rand_pants_color := get_random_color();
					pants.get_child(0).modulate = rand_pants_color;
				else:
					pants.get_child(0).modulate = Color.WHITE;
			else:
					unsparkle_all(Good.GoodType.PANTS);
					pants.visible = false;
					
					full_body.visible = false;

			var shirt = player_cat.find_child("Shirt");
				
			var all_shirts := shirt_container.get_child(0).get_children();
				
			var shirt_chance = randi_range(0, all_shirts.size());
				
			if (shirt_chance != 0):	
				shirt.visible = true;
					
				var new_shirt = all_shirts.pick_random();
					
				shirt.get_child(1).texture = new_shirt.good.outline;
					
				sparkle_option(new_shirt.good);
					
				if (new_shirt.good.color != null):
					shirt.get_child(0).visible = true;
					shirt.get_child(0).texture = new_shirt.good.color;
				else:
					shirt.get_child(0).visible = false;
	
				if (new_shirt.good.customizable):			
					var rand_shirt_color := get_random_color();
					shirt.get_child(0).modulate = rand_shirt_color;
				else:
					shirt.get_child(0).modulate = Color.WHITE;
			else:
				unsparkle_all(Good.GoodType.SHIRT);
				shirt.visible = false;
				
		var hat = player_cat.find_child("Hat");
		var hats := hat_container.get_child(0).get_children();
				
		var hat_chance = randi_range(0, hats.size());
				
		if (hat_chance != 0):
			hat.visible = true;
					
			var new_hat = hats.pick_random();
					
			hat.get_child(1).texture = new_hat.good.outline;
					
			sparkle_option(new_hat.good);
			
			if (new_hat.good.color != null):
				hat.get_child(0).visible = true;
				hat.get_child(0).texture = new_hat.good.color;
			else:
				hat.get_child(0).visible = false;
						
			if (new_hat.good.customizable):	
				var rand_hat_color := get_random_color();
				hat.get_child(0).modulate = rand_hat_color;
			else:
				hat.get_child(0).modulate = Color.WHITE;
		else:
			unsparkle_all(Good.GoodType.HAT);
			hat.visible = false;

		var tail = player_cat.find_child("Tail");
		var tails := tail_container.get_child(0).get_children();
				
		var tail_chance = randi_range(0, tails.size());
				
		if (tail_chance != 0):
			tail.visible = true;
					
			var new_tail = tails.pick_random();
					
			tail.get_child(1).texture = new_tail.good.outline;
					
			sparkle_option(new_tail.good);
			
			if (new_tail.good.color != null):
				tail.get_child(0).visible = true;
				tail.get_child(0).texture = new_tail.good.color;
			else:
				tail.get_child(0).visible = false;
						
			if (new_tail.good.customizable):						
				var rand_tail_color := get_random_color();
				tail.get_child(0).modulate = rand_tail_color;
			else:
				tail.get_child(0).modulate = Color.WHITE;
		else:
			tail.visible = false;
			unsparkle_all(Good.GoodType.TAIL);
	else:
		match (section_title.text):
			"Body":
				var rand_color := get_random_color();
				player_cat.find_child("Body_Color").modulate = rand_color;
				color_picker.color = rand_color;
			"Accessory":
				var accessory = player_cat.find_child("Accessory");
				var accessories := accessory_container.get_child(0).get_children();
				
				var chance = randi_range(0, accessories.size());
				
				if (chance != 0):
					accessory.visible = true;
					
					var new_accessory = accessories.pick_random();
					
					accessory.get_child(1).texture = new_accessory.good.outline;
					
					sparkle_option(new_accessory.good);
					
					if (new_accessory.good.color != null):
						accessory.get_child(0).visible = true;
						accessory.get_child(0).texture = new_accessory.good.color;
					else:
						accessory.get_child(0).visible = false;
						
					if (new_accessory.good.customizable):	
						color_picker.visible = true;
						
						var rand_color := get_random_color();
						accessory.get_child(0).modulate = rand_color;
						color_picker.color = rand_color;
					else:
						color_picker.visible = false;
						accessory.get_child(0).modulate = Color.WHITE;
				else:
					unsparkle_all(Good.GoodType.ACCESSORY);
					
					accessory.visible = false;
					color_picker.visible = false;
					
			"Face":
				var face = player_cat.find_child("Face");
				var faces := face_container.get_child(0).get_children();
				
				var chance = randi_range(0, faces.size());
				
				if (chance != 0):
					face.visible = true;
					
					var new_face = faces.pick_random();
					
					face.get_child(1).texture = new_face.good.outline;
					
					sparkle_option(new_face.good);
					
					if (new_face.good.color != null):
						face.get_child(0).visible = true;
						face.get_child(0).texture = new_face.good.color;
					else:
						face.get_child(0).visible = false;
						
					if (new_face.good.customizable):	
						color_picker.visible = true;
						
						var rand_color := get_random_color();
						face.get_child(0).modulate = rand_color;
						color_picker.color = rand_color;
					else:
						color_picker.visible = false;
						face.get_child(0).modulate = Color.WHITE;
				else:
					unsparkle_all(Good.GoodType.FACE);
					
					face.visible = false;
					color_picker.visible = false;
			"Full Body Clothes":
				var full_body = player_cat.find_child("FullBody");
				
				var shirt = player_cat.find_child("Shirt");
				var pants = player_cat.find_child("Pants");
				
				var full_bodies := full_body_container.get_child(0).get_children();
				
				var chance = randi_range(0, full_bodies.size());
				
				if (chance != 0):	
					full_body.visible = true;
					
					var new_full_body = full_bodies.pick_random();
					
					full_body.get_child(1).texture = new_full_body.good.outline;
					
					sparkle_option(new_full_body.good);
					
					if (shirt.visible):
						shirt.visible = false;
						
					if (pants.visible):
						pants.visible = false;
						
					if (new_full_body.good.color != null):
						full_body.get_child(0).visible = true;
						full_body.get_child(0).texture = new_full_body.good.color;
					else:
						full_body.get_child(0).visible = false;
						
					if (new_full_body.good.customizable):	
						color_picker.visible = true;
						
						var rand_color := get_random_color();
						full_body.get_child(0).modulate = rand_color;
						color_picker.color = rand_color;
					else:
						color_picker.visible = false;
						full_body.get_child(0).modulate = Color.WHITE;
				else:
					unsparkle_all(Good.GoodType.FULL_BODY);
					
					shirt.visible = false;
					pants.visible = false;
					
					full_body.visible = false;
					color_picker.visible = false;
			"Hat":
				var hat = player_cat.find_child("Hat");
				var hats := hat_container.get_child(0).get_children();
				
				var chance = randi_range(0, hats.size());
				
				if (chance != 0):
					hat.visible = true;
					
					var new_hat = hats.pick_random();
					
					hat.get_child(1).texture = new_hat.good.outline;
					
					sparkle_option(new_hat.good);
					
					if (new_hat.good.color != null):
						hat.get_child(0).visible = true;
						hat.get_child(0).texture = new_hat.good.color;
					else:
						hat.get_child(0).visible = false;
						
					if (new_hat.good.customizable):	
						color_picker.visible = true;
						
						var rand_color := get_random_color();
						hat.get_child(0).modulate = rand_color;
						color_picker.color = rand_color;
					else:
						color_picker.visible = false;
						hat.get_child(0).modulate = Color.WHITE;
				else:
					unsparkle_all(Good.GoodType.HAT);
					
					hat.visible = false;
					color_picker.visible = false;
			"Pants":
				var full_body = player_cat.find_child("FullBody");

				var pants = player_cat.find_child("Pants");
				
				var all_pants := pants_container.get_child(0).get_children();
				
				var chance = randi_range(0, all_pants.size());
				
				if (chance != 0):	
					pants.visible = true;
					
					var new_pants = all_pants.pick_random();
					
					pants.get_child(1).texture = new_pants.good.outline;
						
					sparkle_option(new_pants.good);
					
					if (full_body.visible):
						full_body.visible = false;
						
					if (new_pants.good.color != null):
						pants.get_child(0).visible = true;
						pants.get_child(0).texture = new_pants.good.color;
					else:
						pants.get_child(0).visible = false;
						
					if (new_pants.good.customizable):	
						color_picker.visible = true;
						
						var rand_color := get_random_color();
						pants.get_child(0).modulate = rand_color;
						color_picker.color = rand_color;
					else:
						color_picker.visible = false;
						pants.get_child(0).modulate = Color.WHITE;
				else:
					pants.visible = false;
					unsparkle_all(Good.GoodType.PANTS);
					
					full_body.visible = false;
					color_picker.visible = false;
			"Shirt":	
				var full_body = player_cat.find_child("FullBody");

				var shirt = player_cat.find_child("Shirt");
				
				var all_shirts := shirt_container.get_child(0).get_children();
				
				var chance = randi_range(0, all_shirts.size());
				
				if (chance != 0):	
					shirt.visible = true;
					
					var new_shirt = all_shirts.pick_random();
					
					shirt.get_child(1).texture = new_shirt.good.outline;
						
					sparkle_option(new_shirt.good);
					
					if (full_body.visible):
						full_body.visible = false;
						
					if (new_shirt.good.color != null):
						shirt.get_child(0).visible = true;
						shirt.get_child(0).texture = new_shirt.good.color;
					else:
						shirt.get_child(0).visible = false;
						
					if (new_shirt.good.customizable):	
						color_picker.visible = true;
						
						var rand_color := get_random_color();
						shirt.get_child(0).modulate = rand_color;
						color_picker.color = rand_color;
					else:
						color_picker.visible = false;
						shirt.get_child(0).modulate = Color.WHITE;
				else:
					shirt.visible = false;
					
					full_body.visible = false;
					unsparkle_all(Good.GoodType.SHIRT);
					color_picker.visible = false;
			"Tail":	
				var tail = player_cat.find_child("Tail");
				var tails := tail_container.get_child(0).get_children();
				
				var chance = randi_range(0, tails.size());
				
				if (chance != 0):
					tail.visible = true;
					
					var new_tail = tails.pick_random();
					
					tail.get_child(1).texture = new_tail.good.outline;
					
					sparkle_option(new_tail.good);
					
					if (new_tail.good.color != null):
						tail.get_child(0).visible = true;
						tail.get_child(0).texture = new_tail.good.color;
					else:
						tail.get_child(0).visible = false;
						
					if (new_tail.good.customizable):	
						color_picker.visible = true;
						
						var rand_color := get_random_color();
						tail.get_child(0).modulate = rand_color;
						color_picker.color = rand_color;
					else:
						color_picker.visible = false;
						tail.get_child(0).modulate = Color.WHITE;
				else:
					tail.visible = false;
					unsparkle_all(Good.GoodType.TAIL);
					color_picker.visible = false;

func _on_save_open_button_down() -> void:
	var saves := preload("res://nodes/saves.tscn").instantiate();
	var tree = get_tree();
	
	transfer_cat.connect(saves.load_cat);
	transfer_cat.emit(player_cat);
	
	tree.current_scene.process_mode = Node.PROCESS_MODE_DISABLED;
	tree.current_scene.get_child(0).visible = false;
	tree.current_scene.get_child(0).find_child("CanvasLayer").visible = false;
	
	tree.root.add_child(saves);
	
	await saves.finished
	saves.queue_free();
	tree.current_scene.process_mode = Node.PROCESS_MODE_PAUSABLE;
	tree.current_scene.get_child(0).find_child("CanvasLayer").visible = true;
	tree.current_scene.get_child(0).visible = true;
