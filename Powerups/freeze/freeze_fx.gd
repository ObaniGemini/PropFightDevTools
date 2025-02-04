extends PowerupEffect

var gravity_scale : float
var linear_damp : float
var angular_damp : float

func _ready():
	gravity_scale = player.gravity_scale
	linear_damp = player.linear_damp
	angular_damp = player.angular_damp
	
	player.linear_damp = 0.0
	player.gravity_scale = 0.0
	player.angular_damp = 0.0
	
	$AudioStreamPlayer2D.volume_db = -20.0
	var t := util.make_tween(self)
	t.tween_property($AudioStreamPlayer2D, "volume_db", 0.0, 0.1)
	$AudioStreamPlayer2D.play()


func exit():
	if is_instance_valid(player):
		player.gravity_scale = gravity_scale
		player.linear_damp = linear_damp
		player.angular_damp = angular_damp
