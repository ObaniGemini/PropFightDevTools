class_name Character extends RigidBody2D

signal die
signal shoot
signal switch

const Flying := 1 << 0
const Big := 1 << 1
const All := (1 << 2) - 1

@export_flags("Flying:1", "Big:2") var prop_type := 0

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



# Called when the node enters the scene tree for the first time.
func spawn(_pos:Vector2, _data:global.Player) : pass
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
func spawn_fx() : pass
func update_color() : pass
func add_fx(_fx, _time=0, _variable="", _start_value=null, _end_value=null) : pass
func remove_fx(_fx_path, _variable, _value) : pass
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
func triangle() : pass
func untriangle() : pass
func check_dir(_event, _dir:int) -> bool : return bool()
func jump_fx() : pass
func kill(_oob:=false) : pass
func set_side(_obj, _side:int) : pass
func revert() : pass
func make_sleep() : pass
func _input(_event) : pass
func crush() : pass
func _integrate_forces(_state:PhysicsDirectBodyState2D) : pass
func _process(__delta) : pass
func fastfall(_vel) -> float : return float()
func water() -> bool : return bool()
func on_player() -> bool : return bool()
func land(_on_ply=true) -> bool : return bool()
func land_or_water(_on_ply=true) -> bool : return bool()
###emotes
var currEmote = null
func emote(_emoteNum) : pass
