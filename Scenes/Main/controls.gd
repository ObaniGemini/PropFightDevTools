extends Node

enum { KEY, MOUSE, BTN, AXIS }

enum { UP, LEFT, DOWN, RIGHT, CROSS, SQUARE, CIRCLE, TRIANGLE, COLOR, TEAM, INDICATOR, EMOTE1, EMOTE2 }

const actions_name : Array[String] = [
	'up',
	'left',
	'down',
	'right',
	'cross',
	'square',
	'circle',
	'triangle',
	'color',
	'team',
	'indicator',
	'emote1',
	'emote2',
]

const default_keys : Array[Array]= [
	[KEY, KEY_W],
	[KEY, KEY_A],
	[KEY, KEY_S],
	[KEY, KEY_D],
	[KEY, KEY_SPACE],
	[MOUSE, MOUSE_BUTTON_LEFT],
	[MOUSE, MOUSE_BUTTON_RIGHT],
	[MOUSE, MOUSE_BUTTON_MIDDLE],
	[KEY, KEY_X],
	[KEY, KEY_1],
	[KEY, KEY_2],
	[KEY, KEY_3],
	[KEY, KEY_4],
]

const joy_actions := [
	[JOY_BUTTON_DPAD_UP],
	[JOY_BUTTON_DPAD_LEFT],
	[JOY_BUTTON_DPAD_DOWN],
	[JOY_BUTTON_DPAD_RIGHT],
	[JOY_BUTTON_A],
	[JOY_BUTTON_X],
	[JOY_BUTTON_B],
	[JOY_BUTTON_Y],
	[JOY_BUTTON_BACK],
	[JOY_BUTTON_RIGHT_SHOULDER],
	[JOY_BUTTON_LEFT_SHOULDER],
	[JOY_BUTTON_LEFT_STICK],
	[JOY_BUTTON_RIGHT_STICK],
]

var keys := {}


func controller_actions(_id) -> Array : return []
func key(_keycode) -> InputEventKey : return InputEventKey.new()
func mouse_button(_btn) -> InputEventMouseButton : return InputEventMouseButton.new()
func get_key_name(_action:Array, _mouse_prefix:String) -> String : return String()
func get_action_set(_controller) -> Array : return []
func change_key(_action, _array) : pass
func set_keys(_k) : pass
const JOY_BUTTON_L2 := JOY_BUTTON_LEFT_SHOULDER + 2
const JOY_BUTTON_R2 := JOY_BUTTON_RIGHT_SHOULDER + 2

#const XBOX_GLYPHS := [
	#"res://Data/Textures/glyphs/xbox_a.png"
#]

func glyph(_id:int, _button:int) -> Texture : return Texture.new()
func inputPressed(_c:int, _steam_action:int, _godot_action:String) -> bool : return bool()
func inputJustPressed(_c:int, _steam_action:int, _godot_action:String) -> bool : return bool()
func inputJustReleased(_c:int, _steam_action:int, _godot_action:String) -> bool : return bool()
func _ready() : pass
func controllers() -> Array : return []
var GODOT_CONTROLLERS := []
func __godot_controller(_id:int, _connected:bool) : pass
func _controller(_id:int, _connected:bool) : pass
func setGodotInput(_on:bool) : pass
func setMenu(_boolean:bool) : pass
var previous_mouse_pos := Vector2()
var mouse_moved := false
func _process(_delta:float) : pass
