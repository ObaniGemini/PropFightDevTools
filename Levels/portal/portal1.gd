extends Level

const OPENED_POS := 160

const WIND_VOLUME_MAX := -15
const WIND_VOLUME_MIN := -100

# Called when the node enters the scene tree for the first time.
func _ready():
	$collisions/portal_button.button_pressed.connect(door_open)
	$collisions/death_zone.body_entered.connect(kill)
	$Timer.timeout.connect(activate_gravity.bind(false))
	activate_gravity(false)

func door_open(boolean):
	if boolean:
		$Timer.stop()
		activate_gravity(true)
	else:
		$Timer.start()

var t : Tween
func activate_gravity(boolean):
	var pos := OPENED_POS * int(boolean)
	
	util.clean_tween(t)
	t = util.make_tween(self, Tween.TRANS_SINE, Tween.EASE_OUT, true)
	t.tween_property($decor/Node2D/door1, "position:x", -pos, 0.125)
	t.tween_property($decor/Node2D/door2, "position:x", pos, 0.125)
	t.tween_property($decor/Node2D/AudioStreamPlayer2D, "volume_db", WIND_VOLUME_MAX + int(!boolean) * WIND_VOLUME_MIN, 0.125)
	
	$decor/GPUParticles2D.emitting = boolean
	
	if boolean:
		$collisions/Area2D.gravity_space_override = Area2D.SPACE_OVERRIDE_COMBINE
		$collisions/Area2D.gravity = 4096
		
		for body in $collisions/death_zone.get_overlapping_bodies():
			kill(body)
	else:
		$collisions/Area2D.gravity_space_override = Area2D.SPACE_OVERRIDE_DISABLED

func kill(body):
	if util.player(body) && $decor/Node2D/door2.position.x > OPENED_POS/2:
		body.kill()
