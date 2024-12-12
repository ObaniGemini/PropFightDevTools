extends Node2D

@export var sounds : Array[Node]
var sounds_base_volume : Array[float]

const FADE_TIME := 1
var exiting := false


@onready var _hack_on_ready := ready.connect(_on_ready)

func add_sound(_stream:Node) : pass
var t_main_background : Tween
func _on_ready() : pass
func exit() : pass
func custom_exit() : pass
