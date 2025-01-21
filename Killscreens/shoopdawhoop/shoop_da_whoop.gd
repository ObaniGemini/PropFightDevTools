extends Killscreen

var detecting := false
@onready var VERTICAL_SPEED := randf_range(180.0, 640.0)
@onready var ROTATION_SPEED := randf_range(1.0, 8.0)

func _ready():
	add_sound($Holder/Face/immafiring)
	add_sound($Holder/Face/baa)
	add_sound($Holder/Face/loop)
	
	set_process(false)
	
	$Holder/Area2D.body_entered.connect(_on_body_entered)
	
	var yPos := randf_range(0.2, 0.8)
	$Holder.scale.x = util.rands()
	$Holder.position.x = 1280.0 * ((1 - $Holder.scale.x)/2)
	$Holder.position.y = yPos * 720.0
	add_sound($Holder/Face/AudioStreamPlayer2D)
	$AnimationPlayer.play("intro")
	await get_tree().create_timer(randf_range(2.0, 8.0)).timeout
	
	
	var rotLimitLow := -(PI/4.0) * yPos
	var rotLimitHigh := rotLimitLow + PI/4.0
	var t := util.make_tween($Holder, Tween.TRANS_SINE, Tween.EASE_OUT)
	t.tween_property($Holder, "rotation", randf_range(rotLimitLow, rotLimitHigh), 0.5)
	$AnimationPlayer.play("preshoot")
	
	await $AnimationPlayer.animation_finished
	detecting = true
	$AnimationPlayer.play("shoot")
	$AnimationPlayer.queue("loop")
	
	for body in $Holder/Area2D.get_overlapping_bodies():
		_on_body_entered(body)
	
	camera.screenshake(camera.ROT, randf_range(-1.0, 1.0) * 0.025, 0.5)
	set_process(true)
	
	move_vertical()
	move_rotation()
	
	var t_loop := util.make_tween($Holder/Face)
	t_loop.set_loops()
	t_loop.tween_property($Holder/Face/eye1, "rotation", -TAU, 0.25).as_relative()
	t_loop.parallel().tween_property($Holder/Face/eye2, "rotation", TAU, 0.25).as_relative()


var t_vertical : Tween
func move_vertical():
	var goalY := 720.0 if $Holder.position.y < 360.0 else 0.0
	util.clean_tween(t_vertical)
	t_vertical = util.make_tween($Holder)
	t_vertical.tween_property($Holder, "position:y", goalY, util.time_to($Holder.position, Vector2($Holder.position.x, goalY), VERTICAL_SPEED))
	t_vertical.tween_callback(move_vertical)

var t_rotation : Tween
func move_rotation():
	var goalA := -PI/4.0 if $Holder.rotation > 0.0 else PI/4.0
	util.clean_tween(t_rotation)
	t_rotation = util.make_tween($Holder)
	t_rotation.tween_property($Holder, "rotation", goalA, ROTATION_SPEED * absf(goalA - $Holder.rotation)/(PI/2.0))
	t_rotation.tween_callback(move_rotation)


func _on_body_entered(body):
	if detecting and body.is_in_group(util.PLAYER_GROUP):
		game.kill(body)


func _process(_delta: float):
	camera.shake = 10.0

func _exit_tree():
	camera.shake = camera.fallback[camera.SHAKE]
