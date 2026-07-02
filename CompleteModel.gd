class_name CompleteModel
extends Resource

@export var body_color : Color;
@export var face : Array;
@export var tail : Array;
@export var full_body : Array;
@export var accessory : Array;
@export var hat : Array;
@export var shirt : Array;
@export var pants : Array;

func _init(_body_color : Color, _face : Array, _tail : Array, _full_body : Array, _accessory : Array, _hat : Array, _shirt : Array, _pants : Array):
	body_color = _body_color;
	face = _face;
	tail = _tail;
	full_body = _full_body;
	accessory = _accessory;
	hat = _hat;
	shirt = _shirt;
	pants = _pants;
