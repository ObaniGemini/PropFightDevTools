class_name Character extends RigidBody2D

signal die
signal shoot
signal switch

const BASE_STATS := {
	"time_alive": 0.0, #implemented
	"streak": 0, #implemented
	"max_streak": 0, #implemented
	"num_inputs": 0, #implemented
	"distance": 0.0,
	"powerups": 0,
	"emotes": 0,
}

const Flying := 1 << 0
const Big := 1 << 1

@export_flags("Flying:1", "Big:2") var prop_type := 0

@export var CROSS := false
@export var SQUARE := false
@export var CIRCLE := false
@export var TRIANGLE := false

var self_color := Color()
var colorID := 0


var playerID := 1


var dead := false
var is_asleep := false
var jumping := false
var in_liquid := false


var jump_force := 1.0
var reverted := 1.0


var movement := Vector2(0, 0)
var actions := []
var dirs : Array[float] = [0.0, 0.0, 0.0, 0.0]

var team_indicator : TeamIndicator

const ALIVE_TIMER := 10.0
var _timer : Timer
func _add_time_alive() : pass
func _add_time_left() : pass
# Called when the node enters the scene tree for the first time.
func spawn(_pos:Vector2, _data:global.Player) : pass
func add_team_indicator() : pass
func push(_vforce:float, _hforce:float, _rotforce:float) : pass
func rotate_player(_f:float) : pass
func stronger_than(_b) -> bool : return bool()
### Reduce power
#@onready var JUMP_FORCE_BOOST = config.param("jumpForce")
const JUMP_FORCE_BOOST := 1.4
var force := 1.0
var force_tween : Tween
func force_reduce(_f:float) : pass
func jump(_vforce:float, _hforce:float, _rotforce:float, _apply_force_boost:=false) : pass
var _last_hit_vel := Vector2()
func hit_push(_body, _vel, _reduce=0.0) : pass
var _last_hit_angle_vel := 0.0
func hit_rotate(_body, _vel, _reduce=0.0) : pass
var scale_tween : Tween
var tween_nodes := {}
func tween_scale(_from:Vector2) : pass
func restart_tween() : pass
func set_color() : pass
func _spawn_character() : pass
func update_color() : pass
var _fx_timer : SceneTreeTimer
func _make_fx_timer(_fx, _time:int) : pass
func add_fx(_fx, _can_duplicate:=true, _time:=0) : pass
func remove_fx(_fx) : pass
func _give_input() : pass
func _cross() : pass
func cross() : pass
func _uncross() : pass
func uncross() : pass
func _square() : pass
func square() : pass
func unsquare() : pass
func _circle() : pass
func circle() : pass
func uncircle() : pass
func _triangle() : pass
func triangle() : pass
func untriangle() : pass
func check_dir(_event, _dir:int) -> bool : return bool()
func jump_fx() : pass
func kill(_oob:=false) : pass
func set_side(_obj, _side:int) : pass
func crush() : pass
func _notification(_what:int) : pass
func physics(_delta:float) : pass#to override
var _physics_on := true
func is_physics() -> bool : return bool()
func set_physics(_boolean:bool) : pass
@onready var previous_pos = global_position
func _physics_process(_delta:float) : pass
func fastfall(_vel) -> float : return float()
func water() -> bool : return bool()
func on_player() -> bool : return bool()
func land(_on_ply=true) -> bool : return bool()
func land_or_water(_on_ply=true) -> bool : return bool()
###emotes
var currEmote = null
func emote(_type:String) : pass
