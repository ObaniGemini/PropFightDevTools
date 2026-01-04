extends MainNode

const default_shaders := [
	preload("res://Resources/Effects/terrain1.tres"),
	preload("res://Resources/Effects/colored_voronoi.tres"),
	preload("res://Resources/Effects/dark_voronoi.tres")
]
#const default_physics := preload("res://Resources/Effects/default_physics.tres")

@onready var current_shader = fallback_shader()
#@onready var current_physics = default_physics
@onready var nodes := []


var background_shader = null # lowest priority
var level_shader = null # middle priority
var event_shader = null # highest priority

enum ShaderType {
	Background,
	Level,
	Event
}

func fallback_shader() -> ShaderMaterial : return null

func update_shader() : pass

func remove_shader(_shader:ShaderMaterial, _type:ShaderType) : pass

func set_shader(_shader:ShaderMaterial, _type:ShaderType) : pass

func set_background_shader(_shader:ShaderMaterial, _background:Scenery) : pass

func append(_node:Node2D) : pass

func parent_material_propagation(_node:Node) : pass

func remove(_node:Node2D) : pass


func clear() : pass
