class_name GoodsContainer
extends Resource

@export var outlineList : Dictionary[AllGoods.Goods, Texture2D] = {
	AllGoods.Goods.ACCESSORY_TIE: preload("res://images/dressing/accessories/outlines/tie_outline.png"),
	AllGoods.Goods.ACCESSORY_SHADES: preload("res://images/dressing/accessories/outlines/shades_outline.png"),
	AllGoods.Goods.ACCESSORY_CIRCLE_GLASSES: preload("res://images/dressing/accessories/outlines/circle_glasses_outline.png"),
	AllGoods.Goods.ACCESSORY_SQUARE_GLASSES: preload("res://images/dressing/accessories/outlines/square_glasses_outline.png"),
	
	AllGoods.Goods.FACE_HAPPY: preload("res://images/dressing/faces/full/happy.png"),
	AllGoods.Goods.FACE_KISSY: preload("res://images/dressing/faces/full/kissy.png"),
	AllGoods.Goods.FACE_NEUTRAL: preload("res://images/dressing/faces/outlines/neutral_outline.png"),
	AllGoods.Goods.FACE_ZOINKED: preload("res://images/dressing/faces/full/zoinked.png"),
	
	AllGoods.Goods.FULL_BODY_ORANGE_OVERALLS: preload("res://images/dressing/fullBody/outline/orange_overalls_outline.png"),
	AllGoods.Goods.FULL_BODY_STAR_DRESS: preload("res://images/dressing/fullBody/outline/star_dress_outline.png"),

	AllGoods.Goods.HAT_BASEBALL: preload("res://images/dressing/hats/outlines/baseball_hat_outline.png"),
	AllGoods.Goods.HAT_BEANIE: preload("res://images/dressing/hats/outlines/beanie_outline.png"),
	AllGoods.Goods.HAT_CHEF: preload("res://images/dressing/hats/outlines/chef_outline.png"),
	AllGoods.Goods.HAT_FEDORA: preload("res://images/dressing/hats/outlines/fedora_outline.png"),
	AllGoods.Goods.HAT_FEZ: preload("res://images/dressing/hats/outlines/fez_outline.png"),
	AllGoods.Goods.HAT_ORANGE: preload("res://images/dressing/hats/outlines/orange_hat_outline.png"),
	AllGoods.Goods.HAT_SAILOR: preload("res://images/dressing/hats/outlines/sailor_outline.png"),
	AllGoods.Goods.HAT_TOP_HAT: preload("res://images/dressing/hats/outlines/top_hat_outline.png"),
	AllGoods.Goods.HAT_VISOR: preload("res://images/dressing/hats/outlines/visor_outline.png"),
	
	AllGoods.Goods.PANTS_BAGGY: preload("res://images/dressing/pants/outlines/baggy_pants_outline.png"),
	AllGoods.Goods.PANTS_TWO_COLOR: preload("res://images/dressing/pants/outlines/jeans_two_color_outline.png"),
	AllGoods.Goods.PANTS_LOVE_JEANS: preload("res://images/dressing/pants/outlines/love_jeans_outline.png"),
	AllGoods.Goods.PANTS_NORM: preload("res://images/dressing/pants/outlines/pants_outline.png"),
	
	AllGoods.Goods.SHIRT_BLUE_WAVEY: preload("res://images/dressing/shirts/outlines/blue_wavey_shirt_outline.png"),
	AllGoods.Goods.SHIRT_BUTTONUP: preload("res://images/dressing/shirts/outlines/buttonup_outline.png"),
	AllGoods.Goods.SHIRT_CROP_TOP_GREEN: preload("res://images/dressing/shirts/outlines/crop_top_green_outline.png"),
	
	AllGoods.Goods.TAIL_1: preload("res://images/dressing/tails/outlines/tail1_outline.png"),
	AllGoods.Goods.TAIL_2: preload("res://images/dressing/tails/outlines/tail2_outline.png"),
	AllGoods.Goods.TAIL_3: preload("res://images/dressing/tails/outlines/tail3_outline.png"),
	AllGoods.Goods.TAIL_4: preload("res://images/dressing/tails/outlines/tail4_outline.png"),
	AllGoods.Goods.TAIL_5: preload("res://images/dressing/tails/outlines/tail5_outline.png")
}

@export var colorList : Dictionary[AllGoods.Goods, Texture2D] = {
	AllGoods.Goods.ACCESSORY_TIE: preload("res://images/dressing/accessories/colors/tie_color.png"),
	AllGoods.Goods.ACCESSORY_SHADES: preload("res://images/dressing/accessories/colors/shades_color.png"),
	AllGoods.Goods.ACCESSORY_CIRCLE_GLASSES: null,
	AllGoods.Goods.ACCESSORY_SQUARE_GLASSES: null,
	
	AllGoods.Goods.FACE_HAPPY: null,
	AllGoods.Goods.FACE_KISSY: null,
	AllGoods.Goods.FACE_NEUTRAL: preload("res://images/dressing/faces/colors/neutral_color.png"),
	AllGoods.Goods.FACE_ZOINKED: null,
	
	AllGoods.Goods.FULL_BODY_ORANGE_OVERALLS: preload("res://images/dressing/fullBody/color/orange_overalls_color.png"),
	AllGoods.Goods.FULL_BODY_STAR_DRESS: preload("res://images/dressing/fullBody/color/star_dress_color.png"),
	
	AllGoods.Goods.HAT_BASEBALL: preload("res://images/dressing/hats/colors/baseball_hat_color.png"),
	AllGoods.Goods.HAT_BEANIE: preload("res://images/dressing/hats/colors/beanie_color.png"),
	AllGoods.Goods.HAT_CHEF: preload("res://images/dressing/hats/colors/chef_color.png"),
	AllGoods.Goods.HAT_FEDORA: preload("res://images/dressing/hats/colors/fedora_color..png"),
	AllGoods.Goods.HAT_FEZ: preload("res://images/dressing/hats/colors/fez_color.png"),
	AllGoods.Goods.HAT_ORANGE: preload("res://images/dressing/hats/colors/orange_hat_color.png"),
	AllGoods.Goods.HAT_SAILOR: preload("res://images/dressing/hats/colors/sailor_color.png"),
	AllGoods.Goods.HAT_TOP_HAT: preload("res://images/dressing/hats/colors/top_hat_color.png"),
	AllGoods.Goods.HAT_VISOR: preload("res://images/dressing/hats/colors/visor_color.png"),
	
	AllGoods.Goods.PANTS_BAGGY: preload("res://images/dressing/pants/colors/baggy_pants_color.png"),
	AllGoods.Goods.PANTS_TWO_COLOR: preload("res://images/dressing/pants/colors/jeans_two_color_color.png"),
	AllGoods.Goods.PANTS_LOVE_JEANS: preload("res://images/dressing/pants/colors/love_jeans_color.png"),
	AllGoods.Goods.PANTS_NORM: preload("res://images/dressing/pants/colors/pants_color.png"),
	
	AllGoods.Goods.SHIRT_BLUE_WAVEY: preload("res://images/dressing/shirts/colors/blue_wavey_shirt_color.png"),
	AllGoods.Goods.SHIRT_BUTTONUP: preload("res://images/dressing/shirts/colors/buttonup_color.png"),
	AllGoods.Goods.SHIRT_CROP_TOP_GREEN: preload("res://images/dressing/shirts/colors/crop_top_green_color.png"),
	
	AllGoods.Goods.TAIL_1: preload("res://images/dressing/tails/color/tail1_color.png"),
	AllGoods.Goods.TAIL_2: preload("res://images/dressing/tails/color/tail2_color.png"),
	AllGoods.Goods.TAIL_3: preload("res://images/dressing/tails/color/tail3_color.png"),
	AllGoods.Goods.TAIL_4: preload("res://images/dressing/tails/color/tail4_color.png"),
	AllGoods.Goods.TAIL_5: preload("res://images/dressing/tails/color/tail5_color.png")
}

@export var typeList : Dictionary[AllGoods.Goods, Good.GoodType] = {
	AllGoods.Goods.ACCESSORY_TIE: Good.GoodType.ACCESSORY,
	AllGoods.Goods.ACCESSORY_SHADES: Good.GoodType.ACCESSORY,
	AllGoods.Goods.ACCESSORY_CIRCLE_GLASSES: Good.GoodType.ACCESSORY,
	AllGoods.Goods.ACCESSORY_SQUARE_GLASSES: Good.GoodType.ACCESSORY,
	
	AllGoods.Goods.FACE_HAPPY: Good.GoodType.FACE,
	AllGoods.Goods.FACE_KISSY: Good.GoodType.FACE,
	AllGoods.Goods.FACE_NEUTRAL: Good.GoodType.FACE,
	AllGoods.Goods.FACE_ZOINKED: Good.GoodType.FACE,
	
	AllGoods.Goods.FULL_BODY_ORANGE_OVERALLS: Good.GoodType.FULL_BODY,
	AllGoods.Goods.FULL_BODY_STAR_DRESS: Good.GoodType.FULL_BODY,
	
	AllGoods.Goods.HAT_BASEBALL: Good.GoodType.HAT,
	AllGoods.Goods.HAT_BEANIE: Good.GoodType.HAT,
	AllGoods.Goods.HAT_CHEF: Good.GoodType.HAT,
	AllGoods.Goods.HAT_FEDORA: Good.GoodType.HAT,
	AllGoods.Goods.HAT_FEZ: Good.GoodType.HAT,
	AllGoods.Goods.HAT_ORANGE: Good.GoodType.HAT,
	AllGoods.Goods.HAT_SAILOR: Good.GoodType.HAT,
	AllGoods.Goods.HAT_TOP_HAT: Good.GoodType.HAT,
	AllGoods.Goods.HAT_VISOR: Good.GoodType.HAT,
	
	AllGoods.Goods.PANTS_BAGGY: Good.GoodType.PANTS,
	AllGoods.Goods.PANTS_TWO_COLOR: Good.GoodType.PANTS,
	AllGoods.Goods.PANTS_LOVE_JEANS: Good.GoodType.PANTS,
	AllGoods.Goods.PANTS_NORM: Good.GoodType.PANTS,
	
	AllGoods.Goods.SHIRT_BLUE_WAVEY: Good.GoodType.SHIRT,
	AllGoods.Goods.SHIRT_BUTTONUP: Good.GoodType.SHIRT,
	AllGoods.Goods.SHIRT_CROP_TOP_GREEN: Good.GoodType.SHIRT,
	
	AllGoods.Goods.TAIL_1: Good.GoodType.TAIL,
	AllGoods.Goods.TAIL_2: Good.GoodType.TAIL,
	AllGoods.Goods.TAIL_3: Good.GoodType.TAIL,
	AllGoods.Goods.TAIL_4: Good.GoodType.TAIL,
	AllGoods.Goods.TAIL_5: Good.GoodType.TAIL
}

@export var attribute1List : Dictionary[AllGoods.Goods, Attribute.ATTRIBUTES] = {
	AllGoods.Goods.ACCESSORY_TIE: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.ACCESSORY_SHADES: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.ACCESSORY_CIRCLE_GLASSES: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.ACCESSORY_SQUARE_GLASSES: Attribute.ATTRIBUTES.WORK,
	
	AllGoods.Goods.FACE_HAPPY: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.FACE_KISSY: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.FACE_NEUTRAL: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.FACE_ZOINKED: Attribute.ATTRIBUTES.WORK,
	
	AllGoods.Goods.FULL_BODY_ORANGE_OVERALLS: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.FULL_BODY_STAR_DRESS: Attribute.ATTRIBUTES.WORK,
	
	AllGoods.Goods.HAT_BASEBALL: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.HAT_BEANIE: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.HAT_CHEF: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.HAT_FEDORA: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.HAT_FEZ: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.HAT_ORANGE: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.HAT_SAILOR: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.HAT_TOP_HAT: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.HAT_VISOR: Attribute.ATTRIBUTES.WORK,
	
	AllGoods.Goods.PANTS_BAGGY: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.PANTS_TWO_COLOR: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.PANTS_LOVE_JEANS: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.PANTS_NORM: Attribute.ATTRIBUTES.WORK,
	
	AllGoods.Goods.SHIRT_BLUE_WAVEY: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.SHIRT_BUTTONUP: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.SHIRT_CROP_TOP_GREEN: Attribute.ATTRIBUTES.WORK,
	
	AllGoods.Goods.TAIL_1: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.TAIL_2: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.TAIL_3: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.TAIL_4: Attribute.ATTRIBUTES.WORK,
	AllGoods.Goods.TAIL_5: Attribute.ATTRIBUTES.WORK
}

@export var priceList : Dictionary[AllGoods.Goods, int] = {
	AllGoods.Goods.ACCESSORY_TIE: 10,
	AllGoods.Goods.ACCESSORY_SHADES: 10,
	AllGoods.Goods.ACCESSORY_CIRCLE_GLASSES: 10,
	AllGoods.Goods.ACCESSORY_SQUARE_GLASSES: 10,
	
	AllGoods.Goods.FACE_HAPPY: 10,
	AllGoods.Goods.FACE_KISSY: 10,
	AllGoods.Goods.FACE_NEUTRAL: 10,
	AllGoods.Goods.FACE_ZOINKED: 10,
	
	AllGoods.Goods.FULL_BODY_ORANGE_OVERALLS: 10,
	AllGoods.Goods.FULL_BODY_STAR_DRESS: 10,
	
	AllGoods.Goods.HAT_BASEBALL: 10,
	AllGoods.Goods.HAT_BEANIE: 10,
	AllGoods.Goods.HAT_CHEF: 10,
	AllGoods.Goods.HAT_FEDORA: 10,
	AllGoods.Goods.HAT_FEZ: 10,
	AllGoods.Goods.HAT_ORANGE: 10,
	AllGoods.Goods.HAT_SAILOR: 10,
	AllGoods.Goods.HAT_TOP_HAT: 10,
	AllGoods.Goods.HAT_VISOR: 10,
	
	AllGoods.Goods.PANTS_BAGGY: 10,
	AllGoods.Goods.PANTS_TWO_COLOR: 10,
	AllGoods.Goods.PANTS_LOVE_JEANS: 10,
	AllGoods.Goods.PANTS_NORM: 10,
	
	AllGoods.Goods.SHIRT_BLUE_WAVEY: 10,
	AllGoods.Goods.SHIRT_BUTTONUP: 10,
	AllGoods.Goods.SHIRT_CROP_TOP_GREEN: 10,
	
	AllGoods.Goods.TAIL_1: 10,
	AllGoods.Goods.TAIL_2: 10,
	AllGoods.Goods.TAIL_3: 10,
	AllGoods.Goods.TAIL_4: 10,
	AllGoods.Goods.TAIL_5: 10
}

@export var customizableList : Dictionary[AllGoods.Goods, bool] = {
	AllGoods.Goods.ACCESSORY_TIE: true,
	AllGoods.Goods.ACCESSORY_SHADES: false,
	AllGoods.Goods.ACCESSORY_CIRCLE_GLASSES: false,
	AllGoods.Goods.ACCESSORY_SQUARE_GLASSES: false,
	
	AllGoods.Goods.FACE_HAPPY: false,
	AllGoods.Goods.FACE_KISSY: false,
	AllGoods.Goods.FACE_NEUTRAL: true,
	AllGoods.Goods.FACE_ZOINKED: false,
	
	AllGoods.Goods.FULL_BODY_ORANGE_OVERALLS: false,
	AllGoods.Goods.FULL_BODY_STAR_DRESS: false,
	
	AllGoods.Goods.HAT_BASEBALL: true,
	AllGoods.Goods.HAT_BEANIE: true,
	AllGoods.Goods.HAT_CHEF: true,
	AllGoods.Goods.HAT_FEDORA: false,
	AllGoods.Goods.HAT_FEZ: false,
	AllGoods.Goods.HAT_ORANGE: false,
	AllGoods.Goods.HAT_SAILOR: false,
	AllGoods.Goods.HAT_TOP_HAT: true,
	AllGoods.Goods.HAT_VISOR: true,
	
	AllGoods.Goods.PANTS_BAGGY: false,
	AllGoods.Goods.PANTS_TWO_COLOR: false,
	AllGoods.Goods.PANTS_LOVE_JEANS: false,
	AllGoods.Goods.PANTS_NORM: true,
	
	AllGoods.Goods.SHIRT_BLUE_WAVEY: false,
	AllGoods.Goods.SHIRT_BUTTONUP: true,
	AllGoods.Goods.SHIRT_CROP_TOP_GREEN: false,
	
	AllGoods.Goods.TAIL_1: true,
	AllGoods.Goods.TAIL_2: true,
	AllGoods.Goods.TAIL_3: true,
	AllGoods.Goods.TAIL_4: true,
	AllGoods.Goods.TAIL_5: true
}
