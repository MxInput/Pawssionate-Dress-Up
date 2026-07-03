class_name CompleteModel
extends Resource

@export var body_color : Color;

@export var face : Array;
@export var face_color : Color;

@export var tail : Array;
@export var tail_color : Color;

@export var full_body : Array;
@export var full_body_color : Color;

@export var accessory : Array;
@export var accessory_color : Color;

@export var hat : Array;
@export var hat_color : Color;

@export var shirt : Array;
@export var shirt_color : Color;

@export var pants : Array;
@export var pants_color : Color;

func _init(_body_color : Color = Color.WHITE, _face : Array = [], _face_color : Color = Color.WHITE, _tail : Array = [], _tail_color : Color = Color.WHITE, _full_body : Array = [], _full_body_color : Color = Color.WHITE, _accessory : Array = [], _accessory_color : Color = Color.WHITE, _hat : Array = [], _hat_color : Color = Color.WHITE, _shirt : Array = [], _shirt_color : Color = Color.WHITE, _pants : Array = [], _pants_color : Color = Color.WHITE):
	body_color = _body_color;
	
	face = _face;
	face_color = _face_color;
	
	tail = _tail;
	tail_color = _tail_color;
	
	full_body = _full_body;
	full_body_color = _full_body_color;
	
	accessory = _accessory;
	accessory_color = _accessory_color;
	
	hat = _hat;
	hat_color = _hat_color;
	
	shirt = _shirt;
	shirt_color = _shirt_color;
	
	pants = _pants;
	pants_color = _pants_color;
