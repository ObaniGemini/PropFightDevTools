class_name util

class TimeOutTimer:
	var _t: SceneTreeTimer
	var node: Node
	var time: float
	
	func _init(_n:Node, _t:float) : pass
	
	func timedOut() -> bool : return bool()

static func rot_diff(angle1: float, angle2: float):
	var r : float = (angle1 - angle2)
	return r - TAU if r > PI \
		else r + TAU if r < -PI \
		else r

static func color_normalize(c: Color) -> Color:
	var MAX := absf(maxf(maxf(c.r, c.g), c.b))
	return Color() if MAX == 0.0 else Color(c.r/MAX, c.g/MAX, c.b/MAX)

static func ground_hit(sound, velocity : float, max_volume : float, min_volume : float):
	sound.stop()
	
	if velocity > 0:
		sound.volume_db = max_volume + (min_volume / velocity)
	else:
		sound.volume_db = min_volume
	
	sound.play()


static func shoot_entity_simple(node, start_pos : Vector2, rot: float, offset : Vector2, h_vel : float, v_vel : float, c : Color):
	var dir1 := Vector2(cos(rot), sin(rot))
	var dir2 := Vector2(cos(rot + PI/2), sin(rot + PI/2))
	
	node.position = start_pos + dir1 * offset.x + dir2 * offset.y
	node.modulate = c
	node.linear_velocity = Vector2(h_vel, v_vel)
	global.WORLD.ENTITIES.add_child(node) #not static
	return node

static func shoot_entity(shooter, node, start_pos : Vector2, rot : float, object_rot : float, offset : Vector2, velocity : float, recoil : float, c : Color):
	var dir1 := Vector2(cos(rot), sin(rot))
	var dir2 := Vector2(cos(rot + PI/2), sin(rot + PI/2))
	
	node.position = start_pos + dir1 * offset.x + dir2 * offset.y
	node.rotation = object_rot
	node.modulate = c
	node.linear_velocity = dir1 * velocity
	global.WORLD.ENTITIES.add_child(node) #not static
	
	shooter.apply_impulse(-dir1 * recoil, Vector2(0, 0))
	return node



static func make_two_sided_polygon(node, PolygonNode : CollisionPolygon2D):
	var parent := Node2D.new()
	var polygon1 := CollisionPolygon2D.new()
	var polygon2 := CollisionPolygon2D.new()
	
	parent.name = "two_sided"
	polygon1.name = "1"
	polygon2.name = "-1"
	
	polygon1.polygon = PolygonNode.polygon
	polygon2.polygon = PolygonNode.polygon
	
	for i in polygon2.polygon.size():
		polygon2.polygon[i].x = -polygon2.polygon[i].x
	
	parent.add_child(polygon1)
	parent.add_child(polygon2)
	node.add_child(parent)


static func rands() -> float:
	return signf((randi() % 2) * 2 - 1)


static func rotate(ent, force : float):
	ent.apply_torque_impulse(force * sign(game.gravity.y)) #not static

static func push(ent, vforce : float, hforce : float, rotforce : float):
	ent.apply_impulse(Vector2(hforce, vforce * sign(game.gravity.y)), Vector2(0, 0)) #not static
	rotate(ent, rotforce)


static func area_explosion(_body, node, force_player : float, force : float):
	if node.body_entered.is_connected(util.area_explosion):
		node.body_entered.disconnect(util.area_explosion)
	if node.has_node("Timer") and node.get_node("Timer").timeout.is_connected(util.area_explosion):
		node.get_node("Timer").timeout.disconnect(util.area_explosion)
	node.set_physics_process(false)
	
	#for id in node.get_shape_owners():
	#	node.remove_shape_owner( id )
	
	var radius = node.get_node("Area2D/CollisionShape2D").get_shape().radius * 2
	for body in node.get_node("Area2D").get_overlapping_bodies():
		if body is RigidBody2D:
			var imp : Vector2 = node.global_position.direction_to(body.global_position) * (radius - body.global_position.distance_to(node.global_position))/radius
			if player(body):
				imp *= force_player
			else:
				imp *= force
			body.apply_impulse(imp, Vector2(0, 0))
	
	
	node.linear_velocity = Vector2()
	node.collision_mask = 0
	node.collision_layer = 0
	node.get_node("AnimationPlayer").stop()
	node.get_node("AnimationPlayer").animation_finished.connect(util.free_anim.bind(node))
	node.get_node("AnimationPlayer").play("destroy")
	
	node.get_node("AudioStreamPlayer2D").play()
	
	var dist : float = node.global_position.distance_to(camera.global_position) / (global.WIDTH * 0.5)
	var shake_force := force * 0.000003 / (1.0 + dist * dist)
	camera.screenshake(camera.ROT, rands() * shake_force, 0.75)
	camera.screenshake(camera.SHAKE, shake_force * 2.0, 1.0)
	camera.abberation += shake_force


const FONTS := [
	[preload("res://Data/Fonts/Lato-Light.ttf"), preload("res://Data/Fonts/Chinese/SimplifiedChinese/SourceHanSerifSC-Light.otf"), null],
	[preload("res://Data/Fonts/gnuolane rg.ttf"), preload("res://Data/Fonts/Chinese/SimplifiedChinese/SourceHanSerifSC-Heavy.otf"), null],
	[preload("res://Data/Fonts/MozartNbp-93Ey.ttf"), preload("res://Data/Fonts/Chinese/SimplifiedChinese/SourceHanSerifSC-Medium.otf"), null]
]

enum FontType { Menu, Hud, Tutorial }

static func get_font(font: FontType) -> FontFile:
	if TranslationServer.get_locale() == "cn":
		return FONTS[font][1]
	
	if TranslationServer.get_locale() == "ru":
		return FONTS[font][2]
	
	return FONTS[font][0]

static func set_glyph_sprite(node: Sprite2D, size: Vector2, controller: int, steam_action_set: int, steam_action: int, godot_button: int):
	var im := controls.glyph(controller, steam_action_set, steam_action, godot_button)
	if im == null:
		return
	
	node.texture = im
	var s := Vector2(im.get_width(), im.get_height())
	node.scale = size/s

static func make_glyph_display(playerID: int, size: float, btn: Glyph.Type, offset: Vector2) -> Node2D:
	const glyph_display := preload("res://Scenes/Effects/glyph_display.tscn")
	var d := glyph_display.instantiate()
	d.set_glyph(playerID, size, btn, offset)
	return d

static func clean_tween(t: Tween):
	if t: t.kill()

static func make_tween(bound: Node, t := Tween.TRANS_LINEAR, e := Tween.EASE_OUT, p := false, m := Tween.TWEEN_PROCESS_IDLE) -> Tween:
	return bound.create_tween().set_trans(t).set_ease(e).set_parallel(p).set_process_mode(m)

static func add_audio_effect(effect : AudioEffect, music_bus := false) -> int:
	var bus := global.MUSIC_BUS if music_bus else global.MASTER_BUS
	AudioServer.add_bus_effect(bus, effect)
	return AudioServer.get_bus_effect_count(bus) - 1

static func remove_audio_effect(idx: int, music_bus := false):
	AudioServer.remove_bus_effect(global.MUSIC_BUS if music_bus else global.MASTER_BUS, idx)

static func tween_sound(node: AudioStreamPlayer, volume: float, time: float) -> Tween:
	var t := make_tween(node)
	t.tween_property(node, "volume_db", volume, time)
	return t

static func free_anim(_anim_name : String, node):
	node.queue_free()

static func time_to(pos : Vector2, pos_to : Vector2, pps : float) -> float:
	return maxf(absf(pos_to.x - pos.x), absf(pos_to.y - pos.y))/pps

const PLAYER_GROUP := "player"
static func player(body) -> bool: return body.is_in_group(PLAYER_GROUP)

const BULLET_GROUP := "bullet"
static func bullet(body) -> bool: return body.is_in_group(BULLET_GROUP)
static func set_bullet(body): body.add_to_group(BULLET_GROUP)

const FLYING_GROUP := "flying"
static func flying(body) -> bool: return body.is_in_group(FLYING_GROUP)
static func set_flying(body): body.add_to_group(FLYING_GROUP)

