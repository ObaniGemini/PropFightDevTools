extends Prop

const ROT_FORCE := 50000.0
const AIR_ROT_FORCE := 2000.0

const JUMP_MOVE_FORCE := 400.0
const JUMP_ROT_FORCE := 300.0
const JUMP_FORCE := 700.0

func _ready():
	body_entered.connect(hit)


func _physics_process(delta: float):
	if land_or_water():
		rotate_player(movement.x * delta * ROT_FORCE)
		
		if jumping:
			jump(-JUMP_FORCE, movement.x * JUMP_MOVE_FORCE, movement.x * JUMP_ROT_FORCE, true)
	else:
		rotate_player(movement.x * delta * AIR_ROT_FORCE)

const HIT_FORCE := 35.0
func hit(body):
	if body is RigidBody2D and _last_hit_angle_vel != body.angular_velocity:
		if !stronger_than(body):
			body.hit_rotate(self, body.linear_velocity.length() * sign(body.linear_velocity.x) * HIT_FORCE, 0.00002)
		hit_rotate(body, linear_velocity.length() * sign(linear_velocity.x) * HIT_FORCE, 0.00002)

var tween_press : Tween
func press(t: String):
	$Signal.text = t
	util.clean_tween(tween_press)
	tween_press = util.make_tween(self)
	$Signal.modulate.a = 1.0
	tween_press.tween_property($Signal, "modulate:a", 0.0, 1.0)

func cross(): press("cross")
func uncross(): press("uncross")

func square(): press("square")
func unsquare(): press("unsquare")

func circle(): press("circle")
func uncircle(): press("uncircle")

func triangle(): press("triangle")
func untriangle(): press("untriangle")
