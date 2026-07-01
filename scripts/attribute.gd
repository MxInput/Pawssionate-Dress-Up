class_name Attribute
extends Resource

enum ATTRIBUTES {
	CUTE,
	COOL,
	COZY,
	WORK,
	CLASSY,
	SMART,
	COLD_WEAR,
	HOT_WEAR
}

var attribute : ATTRIBUTES;

func _init(_attribute : ATTRIBUTES):
	attribute = _attribute;
