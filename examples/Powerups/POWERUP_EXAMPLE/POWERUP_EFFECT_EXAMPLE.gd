extends PowerupEffect


func _ready():
	player.mass *= 0.5
	
	var t := util.make_tween(self, Tween.TRANS_SINE, Tween.EASE_OUT, true)
	t.tween_property(self, "scale", Vector2(4, 4), 1.0)
	t.tween_property(self, "modulate:a", 0.0, 1.0)
	t.finished.connect(queue_free)
	queue_free()
