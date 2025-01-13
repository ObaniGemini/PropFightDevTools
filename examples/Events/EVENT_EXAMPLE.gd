extends Event

const FORCE := 1500.0

func _ready():
	$Timer.timeout.connect(jump)
	$Timer.start()

func jump():
	for id in global.playerIds():
		for instance in global.players[id].instances:
			instance.jump(randf_range(-FORCE, FORCE), randf_range(-FORCE, FORCE), 0.0)
