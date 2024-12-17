extends Label

const MAX_LINES := 1000

const cursorH := global.HEIGHT
const cursorW := 8
var pos := 0.0

@onready var cursor := Polygon2D.new()

func _ready():
	cursor.polygon = PackedVector2Array([Vector2(0, -cursorH/2), Vector2(0, cursorH/2), Vector2(cursorW, cursorH/2), Vector2(cursorW, -cursorH/2)])
	cursor.modulate = Color(0.5, 0.5, 0.5, 0.5)
	cursor.global_position = Vector2(global.WIDTH - cursorW, cursorH/2)
	add_child(cursor)

func _process(_delta: float):
	position.y = global.HEIGHT - size.y + pos
	cursor.scale.y = cursorH/size.y
	cursor.global_position.y = cursorH - (cursorH/2.0 + pos) * cursor.scale.y

func add_line(s: String):
	print(s)
	if get_line_count() > MAX_LINES:
		for _i in maxi(0, get_line_count() - MAX_LINES):
			var idx : int = text.find("\n", 1)
			if idx != -1:
				text = text.erase(0, idx)
	text += "\n" + s

func clear():
	text = ""
	pos = 0.0
	size.y = global.HEIGHT
	debug.dbg("CONSOLE: cleared")

func move_cursor(speed: float):
	pos = clampf(pos + speed, 0.0, size.y - global.HEIGHT)

const CURSOR_SPEED := 40.0
func _input(event: InputEvent):
	if !visible:
		return
	
	if event.is_action_pressed("ui_text_delete"):
		clear()
	elif event.is_action_pressed("ui_page_up"):
		move_cursor(global.HEIGHT)
	elif event.is_action_pressed("ui_page_down"):
		move_cursor(-global.HEIGHT)
	elif event.is_action_pressed("ui_up"):
		move_cursor(CURSOR_SPEED)
	elif event.is_action_pressed("ui_down"):
		move_cursor(-CURSOR_SPEED)
	elif event.is_action_pressed("ui_end"):
		pos = 0.0
	elif event.is_action_pressed("ui_home"):
		pos = size.y - global.HEIGHT
