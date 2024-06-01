extends Node2D


const stateUpdate := 10

### initialized with config
var powerupSpawn := 0.0
var eventSpawn := 0
var killscreenTimer := 0
var winPoints := 0


var event = null
var event_charge := 0

const FOLDERS := ["Backgrounds", "Events", "Props", "Levels", "Killscreens", "Powerups", "Levels/EndingLevels", "Levels/Lobby", "Backgrounds/Ending"]
const BACKGROUNDS := FOLDERS[0]
const EVENTS := FOLDERS[1]
const PROPS := FOLDERS[2]
const LEVELS := FOLDERS[3]
const KILLSCREENS := FOLDERS[4]
const POWERUPS := FOLDERS[5]
const ENDING_LEVELS := FOLDERS[6]
const LOBBY_LEVELS := FOLDERS[7]
const ENDING_BACKGROUNDS := FOLDERS[8]
const NAMES := "Names"


var modpacks := {}
var _files := {}
var _filtered := {}

func events() -> Array : return Array()
func events_names() -> Array : return Array()
func backgrounds() -> Array : return Array()
func backgrounds_names() -> Array : return Array()
func props() -> Array : return Array()
func props_names() -> Array : return Array()
func all_props() -> Array : return Array()
func all_props_names() -> Array : return Array()
func levels() -> Array : return Array()
func levels_names() -> Array : return Array()
func killscreens() -> Array : return Array()
func killscreens_names() -> Array : return Array()
func powerups() -> Array : return Array()
func powerups_names() -> Array : return Array()
func ending_levels() -> Array : return Array()
func ending_levels_names() -> Array : return Array()
func lobby_levels() -> Array : return Array()
func lobby_levels_names() -> Array : return Array()
func ending_backgrounds() -> Array : return Array()
func ending_backgrounds_names() -> Array : return Array()
func get_file_names(_n:String) -> Array : return Array()
func _add_filtered(_pack:String, _idx:int) : pass
func modpack_switch(_pack:String, _idx:int) -> bool : return bool()
func modpack_enabled(_pack:String, _idx:int) -> bool : return bool()
func _reset_modpack_folder(_folder:String) : pass
var _packs : PackedStringArray = []
func _add_pack(_p:String) : pass
var _prop_types := {}
func init_properties() : pass
func get_prop_type(_prop:String) -> int : return int()
const SCENE_EXTENSIONS : PackedStringArray = [".scn", ".tscn"]
func init_scenes() : pass
var dice := false
var gravity := Vector2(0, 1)

var num_round := 0

@onready var powerup_timer := Timer.new()
@onready var powerups_holder := Node.new()

func init_powerup_scene() : pass
func _ready() : pass
func update_powerup(_end:bool) : pass
func update_event(_end:bool) : pass
func get_max_score() -> int : return int()
func check_end() -> bool : return bool()
func update() -> bool : return bool()
func set_score(_id, _points) : pass
func update_score(_id, _points) : pass
func reset_scores() : pass
func best_score() -> int : return int()
func set_gravity(_vec) : pass
