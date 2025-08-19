class_name Game extends MainNode

signal powerup_added(p: Powerup)
signal event_added(e: Event)

#const stateUpdate := 10

### initialized with config
var powerupSpawn := 0.0
var eventSpawn := 0
var killscreenTimer := 0
var winPoints := 0

enum Mode { Melee, Duel, Teams, Max }

### equals to -1 on init because it needs to have a value different from any enum to be properly initialized
var mode : Mode = Mode.Max

const PLAYER_STATS := {
	"time_alive": 0.0,
	"streak": 0,
	"max_streak": 0,
	"num_inputs": 0,
	"distance": 0.0,
	"powerups": 0,
	"emotes": 0,
}

signal mode_changed(m: Mode)
func update_mode(_m:Mode) : pass

var dice := false
var gravity := Vector2(0, 1)

var num_round := 0

@onready var powerup_timer := Timer.new()

func init_powerup_scene() : pass





func add_powerup() : pass

func update_powerup(_should_cancel:bool) : pass

var event : Event = null
var event_charge := 0
var event_round := 0

func free_event() : pass

func load_event(_e:Event) : pass

func update_event(_should_cancel:bool) : pass


func get_max_score() -> int : return int()


func check_end() -> bool : return bool()

signal event_new_round
func update() : pass


func set_score(_element, _points:int) : pass


func update_score(_element, _points:int) : pass


func reset_players() : pass


func return_best(_content:Array, _alive:bool) -> Array : return []


func best_players(_alive:=true) -> Array : return []


enum State { Normal, Tutorial, Sandbox, Lobby, Ending, Max }
var state := Game.State.Max
func set_game_state(_s:State) : pass

func add_xp() : pass

func set_gravity(_vec:Vector2) : pass

var _time_scale_tween : Tween
var _goal_time_scale := 1.0
var _transition_time_scale := 1.0
var time_scale := 1.0
func _transition_time(_time:float, _override:=-1.0) : pass

func _process(_delta:float) -> void : return 

func kill(_p:Prop) : pass

