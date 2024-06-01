extends Camera2D

enum { ZOOM, SHAKE, ROT, COLOR }

const property := ["custom_zoom", "shake", "rotation"]

var paused := false
var fallback := [Vector2(1, 1), 0.0, 0.0]
var center : Vector2 = position
var custom_zoom : Vector2 = fallback[ZOOM]
var shake : float = fallback[SHAKE]

func _ready() : pass
func pause(_boolean) : pass
var t := [null, null, null, null]
func screenshake(_type, _force, _length, _tween_curve=Tween.TRANS_ELASTIC) : pass
func distort(_to:Vector2, _length:float) : pass
const d := 1.0/1280.0
func place_camera() : pass
func _process(__delta) : pass
