extends Event

func exit():
	for p in get_children():
		p.emitting = false
		
	debug.dbg("LIFETIME: " + str(get_children()[0].lifetime))
	get_tree().create_timer(get_children()[0].lifetime).timeout.connect(queue_free)
