class_name Good
extends Resource

enum GoodType {
	BODY,
	ACCESSORY,
	FACE,
	FULL_BODY,
	HAT,
	PANTS,
	SHIRT,
	TAIL
}

@export var good_type : GoodType;
@export var attributes : Array[Attribute];
@export var price : int;
@export var goodEnum : AllGoods.Goods;
@export var outline : Texture2D;
@export var color : Texture2D;
@export var customizable : bool;

func _init(_good_type : GoodType, _attributes : Array[Attribute], _price : int, _goodEnum : AllGoods.Goods, _outline : Texture2D, _color : Texture2D, _customizable : bool):
	good_type = _good_type;
	attributes = _attributes;
	price = _price;
	goodEnum = _goodEnum;
	outline = _outline;
	color = _color;
	customizable = _customizable;
