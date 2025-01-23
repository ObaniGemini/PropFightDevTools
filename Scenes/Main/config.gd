extends Node

signal locale_update

const default_config := {
	"volume" : 100.0,
	"music" : 70.0,
	"fullscreen" : true,
	"crt" : false,
	"graphics": true,
	
	###Game
	"gamemode": Game.Mode.Melee,
	"powerupSpawn" : 10.0,
	"eventSpawn" : 10,
	"killscreenTimer" : 15,
	"winPoints" : 30,
	"points" : true,
	"colorswap" : false,
	"show_actions": true,
	"tutorial": true,
	"language": "undefined",
	
	###Test room
	global.BACKGROUNDS: "",
	global.EVENTS: "",
	global.KILLSCREENS: "",
	global.LEVELS: "",
	global.POWERUPS: "",
	global.PROPS: ""
}

const default_save := {
	"level": 0,
	"coins": 0,
	"xp": 0,
	"playercolor": 0,
	"sandbox": false,
}

const MAX_XP := 30
const COINS_PER_LEVEL := 10

var cfg := {}
var save := {}

func _ready() : pass
func progress(_p:String) : pass
func set_progress(_p:String, _v) : pass
func param(_p:String) : pass
func change(_p:String, _v) : pass
func _notification(_what) : pass
func get_unlockables(_folder:String) -> int : return int()
func get_unlocked(_folder:String) -> int : return int()
func unlock(_folder:String) -> int : return int()
class XPData:
	var scores : Array[int] = []
	var total_xp := 0
	var start_xp := 0
	var start_level := 0
	var end_xp := 0
	var end_level := 0
	var start_coins := 0
	var end_coins := 0 
	
	func _init(_s:Array[int], _sxp:int, _slvl:int, _scoins:int) : pass
const VOLUME_LIMIT := 10.0
func get_bus_config(_volume:float, _bus_id:int, _min_db:float) -> float : return float()
var old_locale = TranslationServer.get_locale()
func change_locale(_l:String) : pass
var coins := -1
var tmp_cfg := {}
var startup := true
func check_state(_p:String, _f:Callable) : pass
func update_state() : pass
const CFG_USER := "user://PropFight.config"
const CFG_MODS := "user://PropFight.mods"
const CFG_SAVE := "user://PropFight.save"

func reset_config() : pass
func set_dictionary(_c:Dictionary, _default:Dictionary) : pass
func load_config() : pass
func save_config() : pass
func _exit_tree() : pass
