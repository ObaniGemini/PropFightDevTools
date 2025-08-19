extends MainNode

enum { KEY, MOUSE, BTN, AXIS }

enum {
	UP,
	LEFT,
	DOWN, 
	RIGHT,
	CROSS,
	SQUARE,
	CIRCLE,
	TRIANGLE,
	COLOR,
	TEAM,
	#INDICATOR,
	EMOTE1,
	EMOTE2
}

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
	#'indicator',
	'emote1',
	'emote2'
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
#	[KEY, KEY_2],
	[KEY, KEY_3],
	[KEY, KEY_4]
]

const joy_actions := [
	[JOY_BUTTON_DPAD_UP, false],
	[JOY_BUTTON_DPAD_LEFT, false],
	[JOY_BUTTON_DPAD_DOWN, false],
	[JOY_BUTTON_DPAD_RIGHT, false],
	[JOY_BUTTON_A, false],
	[JOY_BUTTON_X, false],
	[JOY_BUTTON_B, false],
	[JOY_BUTTON_Y, false],
	[JOY_BUTTON_BACK, false],
	[JOY_BUTTON_RIGHT_SHOULDER, false],
#	[JOY_BUTTON_LEFT_SHOULDER],
	[JOY_AXIS_TRIGGER_LEFT, true],
	[JOY_AXIS_TRIGGER_RIGHT, true]
]

const IGNORED_KEYS := [KEY_CTRL, KEY_SHIFT, KEY_ALT, KEY_ESCAPE, KEY_QUOTELEFT, KEY_TAB, KEY_F1, KEY_F2, KEY_F3, KEY_F4, KEY_F5, KEY_F6, KEY_F7, KEY_F8, KEY_F9, KEY_F10, KEY_F11, KEY_F12, KEY_PRINT, KEY_DELETE, KEY_CAPSLOCK, KEY_INSERT, KEY_PAGEDOWN, KEY_PAGEUP, KEY_HOMEPAGE, KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN, KEY_META]

var keys := {}


func controller_actions(_id:int) -> Array : return []


func key(_keycode:Key) -> InputEventKey : return null

func mouse_button(_btn:MouseButton) -> InputEventMouseButton : return null

func get_key_name(_action:Array) -> String : return String()



func get_inputmap_key_name(_action:String, _id:int) -> String : return String()

func get_action_set(_id:int) -> Array : return []




func change_key(_id:int, _action:String, _array:Array) : pass


const JOY_BUTTON_L2 := JOY_BUTTON_LEFT_SHOULDER + 2
const JOY_BUTTON_R2 := JOY_BUTTON_RIGHT_SHOULDER + 2

#const XBOX_GLYPHS := [
	#"res://Data/Textures/glyphs/xbox_a.png"
#]

func glyph(_controller:int, _steam_action_set:int, _steam_action:int, _godot_button:int) -> Texture : return null

func inputPressed(_c:int, _steam_action:int, _godot_action:String) -> bool : return bool()

func inputJustPressed(_c:int, _steam_action:int, _godot_action:String) -> bool : return bool()

func inputJustReleased(_c:int, _steam_action:int, _godot_action:String) -> bool : return bool()

signal controller_connection(id: int, connected: bool)


func controllers() -> Array : return []

var GODOT_CONTROLLERS := []

func ignored_controller(_id:int) -> bool : return bool()


func __godot_controller(_id:int, _connected:bool) : pass


func _controller(_id:int, _connected:bool) : pass

func setGodotInput(_on:bool) : pass

func setMenu(_boolean:bool) : pass

var previous_mouse_pos := Vector2()
var mouse_moved := false
func _process(_delta:float) : pass

