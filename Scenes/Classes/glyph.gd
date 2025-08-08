class_name Glyph extends Control

enum Type { CROSS, SQUARE, CIRCLE, TRIANGLE }

var GODOT_ACTIONS := [controls.CROSS, controls.SQUARE, controls.CIRCLE, controls.TRIANGLE]
var KEYBOARD_KEYS := ['cross', 'square', 'circle', 'triangle']

var controller : int
var icon_size : float
var button: Type

var label := Label.new()
var sprite := Sprite2D.new()

func _init(_c:int, _i_s:float, _b:Type) : pass

func update_keyboard() : pass

func update() : pass

