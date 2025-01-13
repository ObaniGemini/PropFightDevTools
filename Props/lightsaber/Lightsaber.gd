extends Character

const FLY_FORCE := 3000.0
const CONSTANT_ROT_FORCE := 40000.0
const ROT_FORCE := 10000.0

const JUMP_ROT_FORCE := 1000.0
const JUMP_MOVE_FORCE := 1000.0
const JUMP_FORCE := 1000.0

const HIT_FORCE := 200000.0
const HIT_ROT_FORCE := 400000.0

const HIT_PLAYER := 40000.0
const HIT_PLAYER_ROT := 100000.0

const HPI := PI/2.0

var opened := false
var flying := false
var constant_rot_accel := false

var glyph : Node2D

func _ready():
	glyph = util.make_glyph_display(playerID, 48.0, Glyph.Type.CIRCLE, Vector2(0.0, -96.0))
	glyph.hide()
	add_child(glyph)
	
	rotation -= HPI
	$hum.volume_db = -50
	$hum.play()
	$whoosh/Timer.timeout.connect(whoosh_play)
	$ForcePush/Reload.play("reload")
	$ForcePush/Reload.animation_finished.connect(func(_anim_name:String): glyph.show())
	
	update_color() #color the glyph correctly

func hit(body, delta, is_player):
	var vel = position.direction_to(body.position) * delta
	var angle_vel = sign(fmod(position.angle_to(body.position) - rotation + PI, TAU) - PI) * delta
	if is_player:
		vel *= HIT_PLAYER
		angle_vel *= HIT_PLAYER_ROT
	else:
		vel *= HIT_FORCE
		angle_vel *= HIT_ROT_FORCE
	
	hit_push(body, vel)
	hit_rotate(body, angle_vel)

func hit_play():
	if $Timer.time_left == 0.0:
		$Timer.start()
		$hit.play()

func whoosh_play():
	if opened and absf(angular_velocity) > 15:
		$whoosh.play()
	$whoosh/Timer.wait_time = randf_range(0.25, 0.3)
	$whoosh/Timer.start()

func update_color():
	$Node2D/fade.modulate = self_color
	$Node2D/light.modulate = self_color * 2
	$ForcePush/Sprite2D.modulate = self_color
	glyph.modulate = self_color

const ANGLE_ROT_MAX := PI/8
func physics(delta: float):
	if opened:
		var play_hit := false
		for body in $saber.get_overlapping_bodies():
			if body != self and body is RigidBody2D:
				play_hit = true
				hit(body, delta, util.player(body))
		
		for area in $saber.get_overlapping_areas():
			if area.is_in_group("lightsaber"):
				play_hit = true
				var parent = area.get_parent()
				if parent.opened:
					hit(parent, delta, true)
		
		if play_hit:
			hit_play()
	
	var av := 0.0
	if constant_rot_accel:
		av = movement.x * CONSTANT_ROT_FORCE * delta
	elif movement.x or movement.y:
		av = movement.x * ANGLE_ROT_MAX - HPI - rotation
		if rotation > HPI:
			av += TAU 
		av *= ROT_FORCE * delta
	
	push(delta * movement.y * FLY_FORCE, delta * movement.x * FLY_FORCE, av)

func cross():
	$whoosh/Timer.start()
	constant_rot_accel = true
	if land():
		jump(-JUMP_FORCE, movement.x * JUMP_MOVE_FORCE, movement.x * JUMP_ROT_FORCE)

func uncross():
	$whoosh/Timer.stop()
	constant_rot_accel = false

var ts : Tween
func square():
	util.clean_tween(ts)
	ts = util.make_tween(self, Tween.TRANS_SINE, Tween.EASE_OUT)
	if opened:
		opened = false
		$off.play()
		$AnimationPlayer.play("close")
		ts.tween_property($hum, "volume_db", -50, 0.5)
	else:
		$on.play()
		$AnimationPlayer.play("open")
		ts.tween_property($hum, "volume_db", -8, 0.15)
		ts.tween_callback(set.bind("opened", true))

const FORCE_PUSH_HIT_PLAYER := 2500.0
const FORCE_PUSH_HIT := 40000.0
func circle():
	if $ForcePush/Reload.is_playing():
		return
	
	$ForcePush/Sound.play()
	$ForcePush/AnimationPlayer.play("push")
	$ForcePush/Reload.play("reload")
	glyph.hide()
	camera.screenshake(camera.SHAKE, 10.0, 1)
	
	for body in $ForcePush.get_overlapping_bodies():
		if body is RigidBody2D and !(body == self):
			var vel = position.direction_to(body.position) / (position.distance_to(body.position) * 0.001 + 1.0)
			if util.player(body):
				vel *= FORCE_PUSH_HIT_PLAYER
			else:
				vel *= FORCE_PUSH_HIT
			hit_push(body, vel)
