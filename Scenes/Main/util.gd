extends Node


func ground_hit(_sound, _velocity:float, _max_volume:float, _min_volume:float) : pass
func shoot_entity(_shooter, _node, _start_pos:Vector2, _rot:float, _object_rot:float, _offset:Vector2, _velocity:float, _recoil:float, _c:Color) : pass
func make_two_sided_polygon(_node, _PolygonNode:CollisionPolygon2D) : pass
func rands() -> float : return float()
func rotate(_ent, _force:float) : pass
func push(_ent, _vforce:float, _hforce:float, _rotforce:float) : pass
func area_explosion(__body, _node, _force_player:float, _force:float) : pass
func clean_tween(_t) : pass
func make_tween(_bound:Node, _t:=Tween.TRANS_LINEAR, _e:=Tween.EASE_OUT, _p:=false, _m:=Tween.TWEEN_PROCESS_IDLE) -> Tween : return create_tween()
func tween_sound(_node:AudioStreamPlayer, _volume:float, _time:float) -> Tween : return create_tween()
func free_anim(__anim_name:String, _node) : pass
func time_to(_pos:Vector2, _pos_to:Vector2, _pps:float) -> float : return float()
const PLAYER_GROUP := "player"
func player(_body) -> bool : return bool()
const BULLET_GROUP := "bullet"
func bullet(_body) -> bool : return bool()
func set_bullet(_body) : pass
const FLYING_GROUP := "flying"
func flying(_body) -> bool : return bool()
func set_flying(_body) : pass
