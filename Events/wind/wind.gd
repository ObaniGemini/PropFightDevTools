extends Event

const MAX_GRAVITY := 1000.0
const MAX_SPEED_SCALE := 5.0
const VOLUME_RANGE := 20.0
const MAX_PITCH := 2.0


var former_factor := 0.0
@onready var MAX_ALPHA : float = $Area2D/L2R.modulate.a

func _ready() -> void:
	update_force()

func exit():
	util.clean_tween(t)
	t = util.make_tween(self)
	t.tween_property($Area2D/wind, "volume_db", -50.0, 0.5)
	t.parallel().tween_property($Area2D, "modulate:a", 0.0, 0.5)
	t.tween_callback(queue_free)

func pick(f: float) -> GPUParticles2D:
	return $Area2D/R2L if f < 0.0 else $Area2D/L2R

var t : Tween
func update_force():
	var factor := randf_range(0.4, 1.0) * util.rands()
	var diff := factor - former_factor
	var time := absf(diff * 2.0)
	
	t = util.make_tween(self, Tween.TRANS_SINE, Tween.EASE_IN_OUT, true)
	t.tween_property($Area2D, "gravity", factor * MAX_GRAVITY, time)
	
	var FACTOR := absf(factor)
	var new := pick(factor)
	if signf(factor) != signf(former_factor):
		var former := pick(former_factor)
		t.tween_property(former, "speed_scale", 0.0, time)
		t.tween_property(former, "modulate:a", 0.0, time)
	
	t.tween_property(new, "speed_scale", sqrt(MAX_SPEED_SCALE * FACTOR), time)
	t.tween_property(new, "modulate:a", MAX_ALPHA * FACTOR, time)
	
	t.tween_property($Area2D/wind, "pitch_scale", FACTOR * MAX_PITCH, time)
	t.tween_property($Area2D/wind, "volume_db", -(1.0 - FACTOR) * VOLUME_RANGE, time)
	
	t.chain().tween_interval(time * 2.0)
	t.chain().tween_callback(update_force)
	
	former_factor = factor
