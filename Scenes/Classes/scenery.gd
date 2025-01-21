class_name Scenery extends Node2D

const FADE_TIME := 1
@export var sounds : Array[Node]
var sounds_base_volume : Array[float]

func add_sound(stream: Node):
	sounds.push_front(stream)
	sounds_base_volume.push_front(stream.volume_db)

func exit(): pass
