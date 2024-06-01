extends Node2D

const SHADER := "shader_type canvas_item;

void fragment() {
	COLOR.rg *= cos(SCREEN_UV * 10.0 + TIME * 0.5) * 0.2 + 0.8;
}"



func _ready() : pass
func _exit_tree() : pass
func parent_material_propagation(_node) : pass
