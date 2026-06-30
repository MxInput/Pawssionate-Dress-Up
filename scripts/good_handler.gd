extends Node


const Goods = preload("res://scripts/allGoods.gd")

@onready var outlineList : Dictionary[Goods, Texture2D];
@onready var colorList : Dictionary[Goods, Texture2D];
@onready var priceList : Dictionary[Goods, Texture2D];

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
