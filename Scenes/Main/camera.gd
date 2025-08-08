class_name Camera extends Camera2D

enum { ZOOM, SHAKE, ROT, COLOR }

const property := ["custom_zoom", "shake", "rotation"]

var fallback := [Vector2(1.0, 1.0), 0.0, 0.0]
var center : Vector2 = position
var custom_zoom : Vector2 = fallback[ZOOM]
var shake : float = fallback[SHAKE]
var abberation : float = 0.0

@onready var cams : Array[Camera2D] = []

var level_zoom := Vector2(1.0, 1.0)

func level_rescale() -> Vector2 : return Vector2()

var t := [null, null, null, null]
func screenshake(_type:int, _force, _length, _tween_curve=Tween.TRANS_ELASTIC) : pass


func distort(_to:Vector2, _length:float) : pass


const d := 1.0/global.WIDTH
func place_camera(_internal_zoom:Vector2) -> Vector2 : return Vector2()

var zoom_inertia := zoom
var zoom_speed := Vector2(0.0, 0.0)
var zoom_normalized := Vector2(1.0, 1.0)
func _process(_delta:float) : pass


