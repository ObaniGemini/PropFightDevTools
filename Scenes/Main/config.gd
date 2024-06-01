extends Node

const default_config = {
	"volume" : 100.0,
	"music" : 70.0,
	"fullscreen" : true,
	"crt" : false,
	
	###Game
	"powerupSpawn" : 10.0,
	"eventSpawn" : 15,
	"killscreenTimer" : 25,
	"winPoints" : 20,
	"points" : true,
}


const VOLUME_LIMIT := 10.0

var cfg = {}

func _ready() : pass
func param(_p) : pass
func change(_p, _v) : pass
func _notification(_what) : pass
func get_bus_config(_volume:float, _bus_id:int, _min_db:float) -> float : return float()
func update_state() : pass
const CFG_USER = "user://PropFight.config"
const CFG_MODS = "user://PropFight.mods"

func load_config() : pass
func save_config() : pass
