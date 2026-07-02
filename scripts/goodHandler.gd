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
		var rand_color := get_random_color();
		player_cat.find_child("Body_Color").modulate = rand_color;
		
		var accessory = player_cat.find_child("Accessory");
		var accessories := accessory_container.get_child(0).get_children();
				
		var acc_chance = randi_range(0, accessories.size());
				
		if (acc_chance != 0):
			accessory.visible = true;
					
			var new_accessory = accessories.pick_random();
					
			accessory.get_child(1).texture = new_accessory.good.outline;
					
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

		var face = player_cat.find_child("Face");
		var faces := face_container.get_child(0).get_children();
				
		var face_chance = randi_range(0, faces.size());
				
		if (face_chance != 0):
			face.visible = true;
					
			var new_face = faces.pick_random();
					
			face.get_child(1).texture = new_face.good.outline;
					
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
		else:
			var full_body = player_cat.find_child("FullBody");

			var pants = player_cat.find_child("Pants");
				
			var all_pants := pants_container.get_child(0).get_children();
				
			var chance = randi_range(0, all_pants.size());
				
			if (chance != 0):	
				pants.visible = true;
					
				var new_pants = all_pants.pick_random();
					
				pants.get_child(1).texture = new_pants.good.outline;
						
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
					pants.visible = false;
					
					full_body.visible = false;

			var shirt = player_cat.find_child("Shirt");
				
			var all_shirts := shirt_container.get_child(0).get_children();
				
			var shirt_chance = randi_range(0, all_shirts.size());
				
			if (shirt_chance != 0):	
				shirt.visible = true;
					
				var new_shirt = all_shirts.pick_random();
					
				shirt.get_child(1).texture = new_shirt.good.outline;
						
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
				shirt.visible = false;
				
		var hat = player_cat.find_child("Hat");
		var hats := hat_container.get_child(0).get_children();
				
		var hat_chance = randi_range(0, hats.size());
				
		if (hat_chance != 0):
			hat.visible = true;
					
			var new_hat = hats.pick_random();
					
			hat.get_child(1).texture = new_hat.good.outline;
					
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
			hat.visible = false;

		var tail = player_cat.find_child("Tail");
		var tails := tail_container.get_child(0).get_children();
				
		var tail_chance = randi_range(0, tails.size());
				
		if (tail_chance != 0):
			tail.visible = true;
					
			var new_tail = tails.pick_random();
					
			tail.get_child(1).texture = new_tail.good.outline;
					
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
				var faces := face_container.get_child(0).get_children();
				
				var chance = randi_range(0, faces.size());
				
				if (chance != 0):
					face.visible = true;
					
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
				else:
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
					color_picker.visible = false;
			"Tail":	
				var tail = player_cat.find_child("Tail");
				var tails := tail_container.get_child(0).get_children();
				
				var chance = randi_range(0, tails.size());
				
				if (chance != 0):
					tail.visible = true;
					
					var new_tail = tails.pick_random();
					
					tail.get_child(1).texture = new_tail.good.outline;
					
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
					color_picker.visible = false;


func _on_save_button_down() -> void:
	var body_color : Color = player_cat.get_child(0).modulate;
	
	var accessory = player_cat.find_child("Accessory");
	var accessory_to_save
	
	if (accessory.visible):
		if (accessory.get_child(0).visible):
			accessory_to_save = [accessory.get_child(0).texture, accessory.get_child(1).texture];
		else:
			accessory_to_save = [null, accessory.get_child(1).texture];
	else:
		accessory_to_save = [null, null];
		
	var face = player_cat.find_child("Face");
	var face_to_save
	
	if (face.visible):
		if (face.get_child(0).visible):
			face_to_save = [face.get_child(0).texture, face.get_child(1).texture];
		else:
			face_to_save = [null, face.get_child(1).texture];
	else:
		face_to_save = [null, null];
		
	var full_body = player_cat.find_child("FullBody");
	var full_body_to_save
	
	if (full_body.visible):
		if (full_body.get_child(0).visible):
			full_body_to_save = [full_body.get_child(0).texture, full_body.get_child(1).texture];
		else:
			full_body_to_save = [null, full_body.get_child(1).texture];
	else:
		full_body_to_save = [null, null];
		
	var hat = player_cat.find_child("Hat");
	var hat_to_save
	
	if (hat.visible):
		if (hat.get_child(0).visible):
			hat_to_save = [hat.get_child(0).texture, hat.get_child(1).texture];
		else:
			hat_to_save = [null, hat.get_child(1).texture];
	else:
		hat_to_save = [null, null];
		
	var shirt = player_cat.find_child("Shirt");
	var shirt_to_save
	
	if (shirt.visible):
		if (shirt.get_child(0).visible):
			shirt_to_save = [shirt.get_child(0).texture, shirt.get_child(1).texture];
		else:
			shirt_to_save = [null, shirt.get_child(1).texture];
	else:
		shirt_to_save = [null, null];
		
	var pants = player_cat.find_child("Pants");
	var pants_to_save
	
	if (pants.visible):
		if (pants.get_child(0).visible):
			pants_to_save = [pants.get_child(0).texture, pants.get_child(1).texture];
		else:
			pants_to_save = [null, pants.get_child(1).texture];
	else:
		pants_to_save = [null, null];
		
	var tail = player_cat.find_child("Tail");
	var tail_to_save
	
	if (tail.visible):
		if (tail.get_child(0).visible):
			tail_to_save = [tail.get_child(0).texture, tail.get_child(1).texture];
		else:
			tail_to_save = [null, tail.get_child(1).texture];
	else:
		tail_to_save = [null, null];
		
	var complete_cat_model := CompleteModel.new(body_color, face_to_save, tail_to_save, full_body_to_save, accessory_to_save, hat_to_save, shirt_to_save, pants_to_save);
	print(complete_cat_model.body_color);
