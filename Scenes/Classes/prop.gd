class_name Prop extends RigidBody2D

const DEFAULT_SIZE := PropSize.Medium
const DEFAULT_MOVEMENT := PropMovement.Normal

enum PropSize { Small = 1, Medium = 2, Big = 4 }
enum PropMovement { Normal = 1, Flying = 2 }

signal on_cross(boolean: bool)
signal on_square(boolean: bool)
signal on_circle(boolean: bool)
signal on_triangle(boolean: bool)

@export var size_type := DEFAULT_SIZE
@export var movement_type := DEFAULT_MOVEMENT

@export var CROSS := false
@export var SQUARE := false
@export var CIRCLE := false
@export var TRIANGLE := false

var self_color := Color()
var playerID := 1

var jumping := false
var input := true
var in_liquid := false

var jump_force := 1.0
var movement_factor := 1.0
var movement := Vector2(0, 0)


func push(vforce : float, hforce : float, rotforce : float):
	util.push(self, vforce * jump_force, hforce * jump_force, rotforce)

func rotate_player(f : float):
	util.rotate(self, f * jump_force)

func stronger_than(b) -> bool:
	if !util.player(b):
		return true
	return _last_linear_velocity.length() * jump_force * force > b._last_linear_velocity.length() * b.jump_force * b.force

### Reduce power
#@onready var JUMP_FORCE_BOOST = config.param("jumpForce")
const JUMP_FORCE_BOOST := 1.4
var force := 1.0
var force_tween : Tween
func force_reduce(f : float):
	util.clean_tween(force_tween)
	force = maxf(0.0, force - sqrt(f))
	force_tween = util.make_tween(self, Tween.TRANS_LINEAR, Tween.EASE_OUT, false, Tween.TWEEN_PROCESS_PHYSICS)
	force_tween.tween_property(self, "force", 1, 0.25)

func jump(vforce : float, hforce : float, rotforce : float, apply_force_boost := false):
	jumping = false
	push(vforce, hforce, rotforce)
	util.clean_tween(force_tween)
	
	if apply_force_boost:
		force *= JUMP_FORCE_BOOST
		force_tween = util.make_tween(self, Tween.TRANS_LINEAR, Tween.EASE_OUT, false, Tween.TWEEN_PROCESS_PHYSICS)
		force_tween.tween_property(self, "force", 1, 0.25)

var _last_linear_velocity := Vector2()

var _last_hit_vel := Vector2()
func hit_push(body, vel: Vector2, reduce := 0.0):
	var f = force * jump_force
	body.apply_impulse(vel * f, Vector2(0, 0))
	if util.player(body):
		body.force_reduce(vel.length() * f * reduce)
		_last_hit_vel = body.linear_velocity

var _last_hit_angle_vel := 0.0
func hit_rotate(body, f: float, reduce := 0.0):
	f *= force * jump_force
	util.rotate(body, f)
	if util.player(body):
		body.force_reduce(absf(f) * reduce)
		_last_hit_angle_vel = body.angular_velocity

var scale_tween : Tween
var tween_nodes := {}
func tween_scale(from : Vector2):
	if is_inside_tree():
		if tween_nodes == {}:
			for node in get_children():
				if node is Node2D:
					tween_nodes[node] = node.scale
		
		for node in tween_nodes:
			node.scale = tween_nodes[node] * from
		restart_tween()

func restart_tween():
	util.clean_tween(scale_tween)
	scale_tween = util.make_tween(self, Tween.TRANS_SINE, Tween.EASE_OUT, true)
	for node in tween_nodes:
		scale_tween.tween_property(node, "scale", tween_nodes[node], 0.25)



func fastfall(vel: float) -> float: return maxf(0, movement.y) * vel
func water() -> bool: return in_liquid 

func on_player() -> bool:
	for body in get_colliding_bodies():
		if util.player(body): #if a player, then it's not ok
			return true
	return false

func land(on_ply := true) -> bool:
	var count := 0
	var bodies := get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("nojump") or (!on_ply and util.player(body)):
			count += 1
	return bodies.size() > count

func land_or_water(on_ply := true) -> bool:
	return land(on_ply) || water() 



func set_side(obj: CanvasItem, side : int):
	obj.scale.x = absf(obj.scale.x) * side
	if tween_nodes.has(obj):
		tween_nodes[obj].x = absf(tween_nodes[obj].x) * side



func update_color():
	modulate = self_color


func cross(): pass
func uncross(): pass

func square(): pass
func unsquare(): pass

func circle(): pass
func uncircle(): pass

func triangle(): pass
func untriangle(): pass


func _physics_process(_delta: float): pass #to override
