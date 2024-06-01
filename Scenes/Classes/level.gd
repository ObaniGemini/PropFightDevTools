class_name Level extends Node2D


@export var forced_bg : PackedScene = null
@export_flags("Flying:1", "Big:2") var prop_type := Character.All
@export var allowed_props : Array[String] = []
@export var excluded_props : Array[String] = []
var props_selection : bool

var allowed : Array[String] = []
var excluded : Array[String] = []


func init(_force:bool) : pass
