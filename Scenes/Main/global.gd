extends Node

const MAX_TEAMS := 6
const MAX_PLAYERS := 8

const plyColors := [
	Color8(255, 0, 0), #red
	Color8(255, 140, 0), #darkorange
	Color8(255, 240, 0), #yellow
	Color8(0, 255, 0), #green
	Color8(80, 255, 255), #light blue
	Color8(25, 120, 255), #blue
	Color8(180, 25, 255), #violet
	Color8(255, 140, 200), #pink
	Color8(255, 255, 255), #white
	Color8(150, 150, 150), #gray
	Color(-5, -5, -5),
	Color(7, 0, 0),
	Color(0, 5, 0),
	Color(0, 0, 8),
	Color(4, 4, 4)
]

const FOLDERS := ["Backgrounds", "Events", "Props", "Levels", "Killscreens", "Powerups"]
const BACKGROUNDS := FOLDERS[0]
const EVENTS := FOLDERS[1]
const PROPS := FOLDERS[2]
const LEVELS := FOLDERS[3]
const KILLSCREENS := FOLDERS[4]
const POWERUPS := FOLDERS[5]


const BASE_NUM_COLORS := 10

const WIDTH := 1280
const HEIGHT := 720
const center := Vector2(WIDTH, HEIGHT)/2.0

var paused := false

var CONTROLLERS := {}

var WORLD : Node2D

###players
var players := {}

const CUSTOM_MODPACKS_FOLDER := "custom-modpack="

@onready var IS_EDITOR : bool = OS.has_feature("editor")
@onready var STEAM : bool = true && !IS_EDITOR
@onready var SANDBOX : bool = STEAM and OS.get_cmdline_user_args().has("sandbox")
@onready var ADDON_CREATOR : bool = STEAM and !SANDBOX and OS.get_cmdline_user_args().has("addon-creator")
@onready var SKIP_MODS_CHECK : bool = OS.get_cmdline_args().has("skip-check")

@onready var MASTER_BUS := AudioServer.get_bus_index("Master")
@onready var SFX_BUS := AudioServer.get_bus_index("SFX")
@onready var MUSIC_BUS := AudioServer.get_bus_index("Music")

func load_packs(_folder:String) : pass
func _ready() : pass
class Player:
	var id := -1
	var team : Team
	var colorID := -1
	var score := 0
	var instances : Array[Prop] = []
	var disconnected := false
	var action_set : Array = []
	var stats := game.PLAYER_STATS.duplicate()
	
	
	func _init(_ID:int=-1) : pass
	func add_instance(_instance) : pass
	func remove_instance(_instance) : pass
	func random_instance() : pass
	func is_instanced() -> bool : return bool()
	func free_instances() : pass
class Team:
	var id: int
	var modulate: Color
	var instances : Array[Player] = []
	var score := 0
	
	func _init(_i:int, _m:Color) : pass
	func indicator(_p:Prop) -> TeamIndicator : return null
	func remove_player(_ply:Player) : pass
	func add_player(_ply:Player) : pass
var teams := [
	Team.new(0, Color8(255, 30, 100)),
	Team.new(1, Color8(40, 150, 255)),
	Team.new(2, Color8(50, 255, 100)),
	Team.new(3, Color8(240, 255, 50)),
	Team.new(4, Color8(200, 50, 255)),
	Team.new(5, Color8(255, 255, 255)),
]

func playerStats(_playerID:int) -> Dictionary : return {}
var num_players := 0
var _internal_players := {}
func _update_players_list() : pass
func getPlayers() -> Array : return []
func playerIds() -> Array : return []
func playerColor(_id:int) -> Color : return Color()
func playersNumber() -> int : return int()
func playersAlive() -> int : return int()
func winnerInstances() -> Array : return []
func add_player(_id) -> Player : return null
func remove_player(_id:int) -> Player : return null
func switch_color(_id) : pass
func mainListEmpty(_n:String, _a:Array) -> bool : return bool()
func check_exists(_path:String, _should_create:bool) -> bool : return bool()
func list_file_pathes(_folder:String, _extensions:PackedStringArray) -> Array : return []
func clear_players() : pass
func get_file_name(_path:String) -> String : return String()
func get_file_names(_scenesPathes:Array) -> Array : return []
func pause(_p) : pass
func is_paused() -> bool : return bool()
