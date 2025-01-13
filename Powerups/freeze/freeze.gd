extends Powerup

func active(id):
	for ply in global.getPlayers():
		if ply.id != id:
			for instance in ply.instances:
				if is_instance_valid(instance):
					instance.add_fx(preload("res://Powerups/freeze/freeze_fx.tscn").instantiate(), false, 2.0)
