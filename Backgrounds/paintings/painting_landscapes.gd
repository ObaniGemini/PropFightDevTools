extends "res://Scenes/Classes/background.gd"

const TIME := 35

@onready var sprites := [$AnimatedSprite2D, $AnimatedSprite2D.duplicate()]

func _ready():
	sprites[0].add_sibling(sprites[1])
	sprites[1].frame = randi() % sprites[1].sprite_frames.get_frame_count("default")
	tween()

var i := 1
func tween():
	var i_old := i
	i = (i + 1) % 2
	
	sprites[i].frame = randi() % sprites[i].sprite_frames.get_frame_count("default")
	
	var tb := util.make_tween(self, Tween.TRANS_LINEAR, Tween.EASE_OUT, true)
	tb.tween_property(sprites[i_old], "modulate:a", 0.0, TIME)
	tb.tween_property(sprites[i], "modulate:a", 1.0, TIME)
	tb.finished.connect(tween)
