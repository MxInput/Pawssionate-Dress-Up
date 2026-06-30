class_name Good
extends Resource

const Goods = preload("res://scripts/allGoods.gd")

enum GoodType {
	ACCESSORY,
	FACE,
	FULL_BODY,
	HAT,
	PANTS,
	SHIRT,
	TAIL
}

@export var good_type : GoodType
@export var attributes : Array[Attribute]
@export var price : int
@export var goodEnum : Goods

func _init(_good_type : GoodType, _attributes : Array[Attribute], _price : int, goodEnum : Goods):
	good_type = _good_type
	attributes = _attributes
	price = _price
	goodEnum = _goodEnum
