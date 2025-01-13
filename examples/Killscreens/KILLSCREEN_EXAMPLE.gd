extends Killscreen

# A killscreen is just a scene that's supposed to kill people in some way if the game lasts too long.
# This avoids stalling and should preferably not just be "die" but something that forces you to move (the base game has some good examples imo)

func _ready():
	$Area2D.body_entered.connect(kill)

func kill(body):
	if util.player(body):
		body.kill()
