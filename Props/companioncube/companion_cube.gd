extends Prop

const ROT_FORCE := 50000.0
const AIR_ROT_FORCE := 2000.0

const JUMP_MOVE_FORCE := 1200.0
const JUMP_ROT_FORCE := 400.0
const JUMP_FORCE := 1400.0

func _ready():
	body_entered.connect(hit)

func update_color():
	$Sprite2D2.modulate = self_color

func _physics_process(delta: float):
	if land_or_water():
		rotate_player(movement.x * delta * ROT_FORCE)
		
		if jumping:
			crate_jump()
	else:
		rotate_player(movement.x * delta * AIR_ROT_FORCE)

const HIT_FORCE := 4.0
const HIT_ROT_FORCE := 20.0
const MAX_VOLUME := -10.0
const JUMP_VOLUME := 2.0
const MIN_VOLUME := -2000.0

func crate_jump():
	jump(-JUMP_FORCE, movement.x * JUMP_MOVE_FORCE, movement.x * JUMP_ROT_FORCE, true)
	if !water():
		$jump.volume_db = JUMP_VOLUME
		$jump.play()

func hit(body):
	if body is RigidBody2D and _last_hit_angle_vel != body.angular_velocity:
		if !stronger_than(body):
			body.hit_rotate(self, body.linear_velocity.length() * sign(body.linear_velocity.x) * HIT_ROT_FORCE, 0.00002)
			body.hit_push(self, body.linear_velocity * maxf(0.0, body.force - 1.0) * HIT_FORCE, 0.00002)
		hit_rotate(body, linear_velocity.length() * sign(linear_velocity.x) * HIT_ROT_FORCE, 0.00002)
		hit_push(body, linear_velocity * maxf(0.0, force - 1.0) * HIT_FORCE, 0.00002)
	
	util.ground_hit($ground, linear_velocity.length(), MAX_VOLUME, MIN_VOLUME)
