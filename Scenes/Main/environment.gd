extends WorldEnvironment

@onready var base_viewport := get_viewport()
@onready var outline := $LevelOutline/ColorRect
@onready var abberations := $Abberations/ColorRect
@onready var OPENGL3 := RenderingServer.get_rendering_device() == null
var level_viewport : SubViewport = null

func get_deform() -> float : return float()

func set_deform(_v:float) : pass

func set_colorblind(_v:config.Colorblind) : pass

func set_high_quality(_b:bool) : pass



func set_viewport(_viewport:SubViewport) : pass

func update_size() : pass


