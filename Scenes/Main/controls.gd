extends Node

enum { KEY, MOUSE, BTN, AXIS }

enum { UP, LEFT, DOWN, RIGHT, CROSS, SQUARE, CIRCLE, TRIANGLE, COLOR, EMOTE1, EMOTE2 }

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
	'emote1',
	'emote2',
]

const default_keys : Array[Array]= [
	[KEY, KEY_UP],
	[KEY, KEY_LEFT],
	[KEY, KEY_DOWN],
	[KEY, KEY_RIGHT],
	[KEY, KEY_SPACE],
	[KEY, KEY_W],
	[KEY, KEY_E],
	[KEY, KEY_R],
	[KEY, KEY_X],
	[KEY, KEY_KP_1],
	[KEY, KEY_KP_2],
]

@onready var joy_actions := [
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
]

var keys := {}


func controller_actions(_id) -> Array[String] : return Array[String]()
func get_action_set(_controller) -> Array[String] : return Array[String]()
func key(_keycode) : pass
func mouse_button(_btn) : pass
func change_key(_action, _array) : pass
func set_keys(_k) : pass
