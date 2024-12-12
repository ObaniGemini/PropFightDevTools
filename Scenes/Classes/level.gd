class_name Level extends Node2D

const OUTLINE_LAYER := 2
const NOOUTLINE_LAYER := 4

@export var forced_bg : PackedScene = null
@export_flags("Flying:1", "Big:2") var prop_type := 0
@export var allowed_props : Array[String] = []
@export var excluded_props : Array[String] = []
var props_selection : bool

var allowed : Array[String] = []
var excluded : Array[String] = []

@onready var _hack_connection := _on_ready()

func init(_force:bool) : pass
func set_visibility(_node:CanvasItem, _idx:int) : pass
func _on_ready() -> int : return int()
