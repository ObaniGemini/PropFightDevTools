extends Powerup


func active(id):
	for i in global.playerIds():
		if i != id:
			for instance in global.players[i].instances:
				if is_instance_valid(instance):
					instance.mass *= 0.5
