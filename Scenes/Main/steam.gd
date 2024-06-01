extends Node

const AppId := 2881590

signal initialized
var INITIALIZED := false

var ACTIONS_GAME : int
var ACTIONS_MENU : int

var GAME_MOVE : int
var GAME_CROSS : int
var GAME_SQUARE : int
var GAME_CIRCLE : int
var GAME_TRIANGLE : int
var GAME_EMOTE1 : int
var GAME_EMOTE2 : int
var GAME_COLOR_SWITCH : int
var GAME_MENU : int

var MENU_UP : int
var MENU_DOWN : int
var MENU_LEFT : int
var MENU_RIGHT : int
var MENU_SELECT : int
var MENU_CANCEL : int

func _ready() : pass
var PRESSED_DEFAULT := {}

var CONTROLLERS := {}
var CONTROLLERS_RELEASE := {}

var inMenu := false
func setInputMenu() : pass
func setInputGame() : pass
var _vibration_timeouts

func reset_vibration(_id:int) : pass
func set_vibration(_id:int, _power:int) : pass
func vibrate(_id:int, _power:int, _time:float) : pass
func __add_controller(_id:int) : pass
func __remove_controller(_id:int) : pass
func __config_loaded(__app_id:int, _controller_id:int, _data:Dictionary) : pass
const DISABLED := -1
func inputInit() : pass
func initWorkshop() : pass
func inputPressed(_c:int, _action:int) -> bool : return bool()
func inputJustPressed(_c:int, _action:int) -> bool : return bool()
func inputJustReleased(_c:int, _action:int) -> bool : return bool()
func inputAnalog(_c:int, _action:int) -> Vector2 : return Vector2()
func _exit_tree() : pass
func _process(__delta) : pass
