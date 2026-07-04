extends Label

var time := 0.0;

func reset_time() -> void:
	time = 0.0;
	
func _process(delta: float) -> void:
	if (visible):
		time += delta;
		
		if (time > 2.0):
			visible = false;
			reset_time();
