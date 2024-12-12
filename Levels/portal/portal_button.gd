extends Node2D

var pressed := false
signal button_pressed


func _ready():
	$RigidBody2D.add_collision_exception_with($StaticBody2D)
	$RigidBody2D.body_entered.connect(press)
	$RigidBody2D.body_exited.connect(unpress)

var t : Tween
func press(body=null):
	if !(body is RigidBody2D):
		return
	
	if !pressed:
		pressed = true
		button_pressed.emit(true)
		
		util.clean_tween(t)
		t = util.make_tween(self, Tween.TRANS_SINE, Tween.EASE_OUT, true)
		t.tween_property($RigidBody2D, "position:y", 3, 0.125)
		t.tween_property($RigidBody2D/Sprite2, "modulate:a", 0.0, 0.125)
		
		if $RigidBody2D.position.y < 1:
			$AudioStreamPlayer2D.play()


func unpress(body):
	var colliding = $RigidBody2D.get_colliding_bodies()
	if !(body is RigidBody2D):
		return
	
	colliding.remove_at(colliding.find(body))
	
	if pressed && colliding.size() == 0:
		pressed = false
		button_pressed.emit(false)
		
		util.clean_tween(t)
		t = util.make_tween(self, Tween.TRANS_SINE, Tween.EASE_OUT, true, Tween.TWEEN_PROCESS_PHYSICS)
		t.tween_property($RigidBody2D, "position:y", 0, 0.125)
		t.tween_property($RigidBody2D/Sprite2, "modulate:a", 1.0, 0.125)
