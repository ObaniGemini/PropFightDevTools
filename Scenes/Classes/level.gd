class_name Level extends Node2D

const OUTLINE_LAYER := 2
const NOOUTLINE_LAYER := 4

enum FilterType {
	Exclude,
	Restrict
}

@export var forced_bg : PackedScene = null
@export_flags("Small", "Medium", "Big") var size := 7
@export_flags("Normal", "Flying") var movement := 3
@export var filtered_props : Array[String] = []
@export var filter_type := FilterType.Exclude

var allowed : Array = []

func __get_positions(_path:String) -> Array[Vector2] : return []
@onready var spawns := __get_positions("Spawns")
@onready var winner_spawns := __get_positions("WinnerSpawns")

var forced_bg_instance : Scenery = null
func init(_force:bool) : pass
func set_visibility(_node:CanvasItem, _idx:int) : pass
