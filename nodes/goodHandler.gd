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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in AllGoods.Goods.size():
		var current_good = cat_model.instantiate();
		
		current_good.good = Good.new(goodsContainer.typeList[AllGoods.Goods.values()[i]], [Attribute.new(goodsContainer.attribute1List[AllGoods.Goods.values()[1]])], goodsContainer.priceList[AllGoods.Goods.values()[i]], AllGoods.Goods.values()[i], goodsContainer.outlineList[AllGoods.Goods.values()[i]], goodsContainer.colorList[AllGoods.Goods.values()[i]]);
		
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
				
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
