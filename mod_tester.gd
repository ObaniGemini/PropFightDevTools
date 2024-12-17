extends Control

const CONFIG := "user://DevTools.config"

var exec_path := ""
var godot_input := false
var autoload := false

func save_config():
	var f := FileAccess.open(CONFIG, FileAccess.WRITE)
	if f != null:
		f.store_var(exec_path)
		f.store_var(godot_input)
		f.store_var(autoload)
		f.close()

func set_exec_path(p: String):
	exec_path = p
	$Label.text = "Current path : \"" + exec_path + "\""
	$FileDialog.current_file = exec_path
	$FileDialog.current_dir = exec_path.get_base_dir()



func update_exec_path(p: String, execute : bool):
	if !FileAccess.file_exists(p):
		var delimiter := '\\' if OS.get_name() == "Windows" else '/'
		for _i in (p.get_slice_count(delimiter) - 1):
			p = p.left(p.get_slice(delimiter, p.get_slice_count(delimiter) - 1).length() + 1)
			if FileAccess.file_exists(p) or DirAccess.dir_exists_absolute(p):
				break
	
	set_exec_path(p)
	save_config()
	
	if execute:
		load_game()



func set_godot_input(b: bool):
	godot_input = b
	save_config()

func set_autoload(b: bool):
	autoload = b
	save_config()

func _ready() -> void:
	debug.queue_free()
	environment.queue_free()
	
	$FileDialog.position = Vector2(0, 0)
	
	$Button.pressed.connect($FileDialog.show)
	$FileDialog.file_selected.connect(update_exec_path.bind(true))
	$Panel/Exit.pressed.connect(thread_exit)
	$HBoxContainer/GodotInput.toggled.connect(set_godot_input)
	$HBoxContainer/Autoload.toggled.connect(set_autoload)
	thread_exit()
	
	var f := FileAccess.open(CONFIG, FileAccess.READ)
	if f != null:
		var p : String = f.get_var()
		godot_input = f.get_var()
		autoload = f.get_var()
		f.close()
		
		$HBoxContainer/GodotInput.button_pressed = godot_input
		$HBoxContainer/Autoload.button_pressed = autoload
		update_exec_path(p, autoload)
	else:
		update_exec_path("C:\\Program Files (x86)\\Steam\\steamapps\\common\\PropFight\\PropFight.exe" if OS.get_name() == "Windows" else OS.get_environment("HOME") + "/.local/share/Steam/steamapps/common/PropFight/PropFight.x86_64", autoload)


var output = []
func thread_open():
	var args := ["--", "sandbox", global.CUSTOM_MODPACKS_FOLDER + ProjectSettings.globalize_path("res://")]
	if godot_input: args.append("godot-input")
	
	process_mode = PROCESS_MODE_DISABLED
	if OS.execute(exec_path, args, output, true, true) == -1:
		print("There was an error loading the executable '" + str(exec_path) + "'")
	process_mode = PROCESS_MODE_INHERIT
	
	for str in output:
		$Panel/Console.add_line(str)
	output = []

func thread_exit():
	$Panel.hide()

func load_game():
	$FileDialog.hide()
	
	if exec_path == "":
		print("Couldn't load the game (empty executable path)")
		return
	
	if !FileAccess.file_exists(exec_path):
		print("Current path isn't a file and couldn't be loaded")
		return
	
	$Panel/Console.clear()
	$Panel.show()
	$Panel/Console.add_line("START DEVTOOLS CONSOLE FEEDBACK\n\n")
	thread_open()
