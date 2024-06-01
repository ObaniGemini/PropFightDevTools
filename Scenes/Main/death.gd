extends Node2D


@onready var limit1 := $Limits/Position2D1
@onready var limit2 := $Limits/Position2D2

func in_bounds(_pos:Vector2) -> bool : return bool()
func death_fx(_oob:bool, _pos:Vector2, _c:Color) : pass
