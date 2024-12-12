class_name Game extends Node2D


const stateUpdate := 10

### initialized with config
var powerupSpawn := 0.0
var eventSpawn := 0
var killscreenTimer := 0
var winPoints := 0


const FOLDERS := ["Backgrounds", "Events", "Props", "Levels", "Killscreens", "Powerups"]
const BACKGROUNDS := FOLDERS[0]
const EVENTS := FOLDERS[1]
const PROPS := FOLDERS[2]
const LEVELS := FOLDERS[3]
const KILLSCREENS := FOLDERS[4]
const POWERUPS := FOLDERS[5]
const NAMES := "Names"
const IDX := "Idx"

const HIDDEN := ["Levels/EndingLevels", "Levels/Lobby", "Backgrounds/Ending"]
const ENDING_LEVELS := HIDDEN[0]
const LOBBY_LEVELS := HIDDEN[1]
const ENDING_BACKGROUNDS := HIDDEN[2]

const COSMETICS := ["Cosmetics/EmoteHappy", "Cosmetics/EmoteSad", "Cosmetics/TeamIndicators"]
const EMOTES_HAPPY := COSMETICS[0]
const EMOTES_SAD := COSMETICS[1]
const TEAM_INDICATORS := COSMETICS[2]

enum Mode { Melee, Duel, Teams, Max }

### equals to -1 on init because it needs to have a value different from any enum to be properly initialized
var mode : Mode = Mode.Max

signal mode_changed(m: Mode)
func update_mode(_m:Mode) : pass
var modpacks := {}
var _files := {}
var _filtered := {}
var _filteredOut := {}

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
func _remove_filtered(_pack:String, _idx:int) : pass
func modpack_switch(_pack:String, _idx:int) : pass
func modpack_enabled(_pack:String, _idx:int) -> bool : return bool()
func _reset_modpack_folder(_folder:String) : pass
var _packs : PackedStringArray = []
func _add_pack(_p:String) : pass
var _prop_types := {}
var _prop_actions := {}
func init_properties() : pass
func get_prop_type(_prop:String) -> int : return int()
func get_prop_actions(_prop:String) -> Array : return Array()
# sort properly numbers in names
func sort_items(_a:String, _b:String) : pass
const SCENE_EXTENSIONS : PackedStringArray = [".scn", ".tscn"]
func init_scenes() : pass
var dice := false
var gravity := Vector2(0, 1)

var num_round := 0

@onready var powerup_timer := Timer.new()
@onready var powerups_holder := Node.new()

func init_powerup_scene() : pass
func _ready() : pass
func update_powerup(_should_cancel:bool) : pass
var event = null
var event_charge := 0
var event_round := 0

func free_event() : pass
func load_event(_e:String) : pass
func update_event(_should_cancel:bool) : pass
func get_max_score() -> int : return int()
func check_end() -> bool : return bool()
func update() : pass
func set_score(_element, _points) : pass
func update_score(_element, _points) : pass
func reset_players() : pass
func return_best(_content:Array, _alive:bool) -> Array : return Array()
func best_players(_alive:=true) -> Array : return Array()
var state := Game.State.Max
func set_game_state(_s:State) : pass
func add_xp() : pass
func set_gravity(_vec) : pass
var _time_scale_tween : Tween
var _goal_time_scale := 1.0
func set_time_scale(_time:float, _override:=-1.0) : pass
func add_emote(_type:String, _player:Character) : pass
