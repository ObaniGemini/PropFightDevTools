class_name Powerup extends Area2D

const pickup_fx := preload("res://Scenes/Effects/powerup_pickup_fx.tscn")

const MIN_SPEED := 100.0
const MAX_SPEED := 200.0
const MIN_ANGULAR_SPEED := 1.0
const MAX_ANGULAR_SPEED := 3.0

const OFFSET := global.center + Vector2(128.0, 128.0)

var powerup = null
var current_powerup_color : Color

var linear_velocity : Vector2
var angular_velocity : float


func _physics_process(_delta:float) : pass

@onready var sprite_scale = $Sprite2.scale 
func tween(_b:bool) : pass

func destroy() : pass

func active(_id:int) : pass

func pickup(_body) : pass

