extends RigidBody2D

@onready var start_pos := global_position
@onready var pos := start_pos

func _integrate_forces(state: PhysicsDirectBodyState2D):
	state.transform.x = Vector2(1, 0)
	state.transform.y = Vector2(0, 1)
	state.linear_velocity = Vector2(0, 0)
	state.angular_velocity = 0.0
	state.transform.origin = pos
	state.integrate_forces()
