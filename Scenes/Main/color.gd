extends MainNode

var shaders := []

@onready var STARTING_COLOR := Color(0.247, 0.263, 0.29)
@onready var current_color := STARTING_COLOR
@onready var nodes := []


func append(_node:Node2D) : pass

func parent_material_propagation(_node:Node) : pass

func remove(_node:Node2D) : pass


func clear() : pass

