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
	
func _on_randomize_button_down() -> void:
	if (!section_title.visible):
		pass
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
					accessory.visible = false;
					color_picker.visible = false;
					
			"Face":
				var face = player_cat.find_child("Face");
				
				face.visible = true;
				
				var faces := face_container.get_child(0).get_children();
				
				var new_face = faces.pick_random();
				
				face.get_child(1).texture = new_face.good.outline;
				
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
			"Full Body Clothes":
				var full_body = player_cat.find_child("FullBody");
				var shirt = player_cat.find_child("Shirt");
				var pants = player_cat.find_child("Pants");
				
				full_body.visible = true;
				
				var full_bodies := full_body_container.get_child(0).get_children();
				
				var new_full_body = full_bodies.pick_random();
				
				full_body.get_child(1).texture = new_full_body.good.outline;
				
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
				
