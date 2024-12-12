extends Node

const AppId := 2881590
@onready var INPUT := global.STEAM and !OS.get_cmdline_user_args().has("--godot-input")

signal initialized
var INITIALIZED := false

var ACTIONS_GAME : int
var ACTIONS_MENU : int

var GAME_MOVE : int
var GAME_CROSS : int
var GAME_SQUARE : int
var GAME_CIRCLE : int
var GAME_TRIANGLE : int
var GAME_COLOR_SWITCH : int
var GAME_TEAM_SWITCH : int
var GAME_TEAM_INDICATOR : int
var GAME_EMOTE1 : int
var GAME_EMOTE2 : int
var GAME_MENU : int

var MENU_UP : int
var MENU_DOWN : int
var MENU_LEFT : int
var MENU_RIGHT : int
var MENU_SELECT : int
var MENU_CANCEL : int
var MUSIC_PAUSE : int
var MUSIC_NEXT : int

func _ready() : pass
var PRESSED_DEFAULT := {}

var CONTROLLERS := {}
var CONTROLLERS_RELEASE := {}

var inMenu := false
func setInputMenu() : pass
func setInputGame() : pass
func glyph(_controller:int, _action_set:int, _action:int) -> String : return String()
var _vibration_timeouts

func reset_vibration(_id:int) : pass
func set_vibration(_id:int, _power:int) : pass
func vibrate(_id:int, _power:int, _time:float) : pass
const SURVIVOR := "SURVIVOR"
const RAMPAGE := "RAMPAGE"
const ANYONE_PLAYING := "ANYONE_PLAYING"
const LONELY := "LONELY"

const ROLEPLAY := "ROLEPLAY"
const STILL_ALIVE := "STILL_ALIVE"
const TRYHARD := "TRY_HARD"
const FUELED_UP := "FUELED_UP"
const HOTFIX := "HOTFIX"

const BFF := "BFF"
const BULLET_HELL := "BULLET_HELL"
const TOASPER := "TOASPER"

const ECLECTIC := "ECLECTIC"
const COMEBACK := "COMEBACK"
const AFK := "AFK"

const TUNING := "TUNING"
const CRAFTER := "CRAFTER"

const ACHIEVEMENT_NAMES := [SURVIVOR, RAMPAGE, ANYONE_PLAYING, LONELY, ROLEPLAY, STILL_ALIVE, TRYHARD, FUELED_UP, HOTFIX, BFF, TOASPER, ECLECTIC, COMEBACK, AFK, TUNING, CRAFTER]

var ACHIEVEMENTS: Dictionary = {
	SURVIVOR:false,
	RAMPAGE:false,
	ANYONE_PLAYING:false,
	LONELY: false,
	
	ROLEPLAY: false,
	STILL_ALIVE: false,
	TRYHARD: false,
	FUELED_UP: false,
	HOTFIX: false,
	
	BFF: false,
	BULLET_HELL: false,
	TOASPER: false,
	
	ECLECTIC: false,
	COMEBACK: false,
	AFK: false,
	
	TUNING: false,
	CRAFTER: false
}

func get_achievement(_value:String) : pass
func _steam_stats_ready(_game:int, _result:int, _user:int) : pass
func __add_controller(_id:int) : pass
func __remove_controller(_id:int) : pass
func __config_loaded(_app_id:int, _controller_id:int, _data:Dictionary) : pass
const DISABLED := -1
func initControllers() : pass
func inputInit() : pass
func initWorkshop() : pass
func inputPressed(_c:int, _action:int) -> bool : return bool()
func inputJustPressed(_c:int, _action:int) -> bool : return bool()
func inputJustReleased(_c:int, _action:int) -> bool : return bool()
func inputAnalog(_c:int, _action:int) -> Vector2 : return Vector2()
func _exit_tree() : pass
func _physics_process(_delta) : pass
