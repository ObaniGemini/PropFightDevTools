extends WorldEnvironment

@onready var base_viewport := get_viewport()
@onready var outline := $LevelOutline
@onready var OPENGL3 := RenderingServer.get_rendering_device() == null
var level_viewport : SubViewport = null

func get_deform() -> float : return float()
func set_deform(_v:float) : pass
func _ready() : pass
func set_viewport(_viewport:SubViewport) : pass
func set_crt(_visible:bool) : pass
func update_size() : pass
