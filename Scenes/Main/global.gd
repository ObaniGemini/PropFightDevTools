extends Node


const plyColors := [
	Color8(255, 25, 25), #red
	Color8(255, 140, 0), #darkorange
	Color8(255, 220, 100), #yellow
	Color8(75, 255, 75), #limegreen
	Color8(200, 255, 100), #limegreen
	Color8(176, 224, 255), #powderblue
	Color8(25, 100, 255), #royalblue
	Color8(180, 60, 255), #blueviolet
	Color8(255, 140, 220), #hotpink
	Color8(255, 255, 255), #lightgray
	Color8(125, 125, 125), #darkgray
]

const WIDTH := 1280
const HEIGHT := 720
const center := Vector2(WIDTH, HEIGHT)/2.0

var paused := false

var CONTROLLERS := {}


###players
var players := {}

@onready var IS_EDITOR : bool = OS.has_feature("editor")
@onready var STEAM : bool = true && !IS_EDITOR
@onready var ADDON_CREATOR := global.STEAM and OS.get_cmdline_user_args().has("--addon-creator")

@onready var MASTER_BUS := AudioServer.get_bus_index("Master")
@onready var MAIN_BUS := AudioServer.get_bus_index("Main")
@onready var MUSIC_BUS := AudioServer.get_bus_index("Music")

func _ready() : pass
class Player:
	var id := -1
	var colorID := -1
	var score := 0
	var instances : Array[Character] = []
	var disconnected := false
	var action_set : Array[String] = []
	
	func _init(ID : int):
		id = ID
		action_set = controls.get_action_set(ID)
	
	func add_instance(instance):
		instances.push_back(instance)
	
	func remove_instance(instance):
		var idx : int = instances.find(instance)
		if idx != -1:
			instances[idx].queue_free()
			instances.pop_at(idx)
	
	func random_instance():
		if instances.size() == 0:
			return null
		return instances.pick_random()
	
	func is_instanced() -> bool:
		for i in instances.size():
			if !is_instance_valid(instances[i]):
				continue
			return true
		return false
	
	func free_instances():
		for i in instances.size():
			if is_instance_valid(instances[i]):
				instances[i].queue_free()
		instances.clear()

func getPlayers() -> Array : return Array()
func playerIds() -> Array : return Array()
func playerColor(_id:int) -> Color : return Color()
func playersNumber() -> int : return int()
func playersAlive() -> int : return int()
func winnerInstances() -> Array : return Array()
func add_player(_id) : pass
func remove_player(_id) : pass
func switch_color(_id) : pass
func mainListEmpty(_n:String, _a:Array) -> bool : return bool()
func check_exists(_path:String, _should_create:bool) -> bool : return bool()
func list_file_pathes(_folder:String, _extensions:PackedStringArray) -> Array[String] : return Array[String]()
func clear_players() : pass
func get_file_name(_path:String) -> String : return String()
func get_file_names(_scenesPathes:Array) -> Array[String] : return Array[String]()
func pause(_p) : pass
func is_paused() -> bool : return bool()
var _time_scale_tween : Tween
var _goal_time_scale := 1.0
func set_time_scale(_time:float, _override:=-1.0) : pass
