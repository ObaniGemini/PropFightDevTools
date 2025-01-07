class_name Glyph extends Control

enum Type { CROSS, SQUARE, CIRCLE, TRIANGLE }

var STEAM_ACTIONS := [steam.GAME_CROSS, steam.GAME_SQUARE, steam.GAME_CIRCLE, steam.GAME_TRIANGLE]
var GODOT_ACTIONS := [controls.CROSS, controls.SQUARE, controls.CIRCLE, controls.TRIANGLE]
var KEYBOARD_KEYS := ['cross', 'square', 'circle', 'triangle']

var label := Label.new()
var sprite := Sprite2D.new()

func _init(_controller:int, _icon_size:float, _b:Type) : pass
func update(_controller:int, _icon_size:float, _button:Type) : pass
