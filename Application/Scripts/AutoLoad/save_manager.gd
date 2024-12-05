extends Node

var active_save_index = 1 

var save_cache = {}

func _ready():
	load_game()

func get_active_path() -> String:
	return "user://save" + str(active_save_index) + ".dat"

func make_new_save():
	save_cache.clear()
	save_cache[Constants.save_coin_key] = -1
	save_game()

func save_game():
	var file = FileAccess.open(get_active_path(), FileAccess.WRITE)
	
	# JSON provides a static method to serialized JSON string.
	var json_string = JSON.stringify(save_cache)
	
	# Store the save dictionary as a new line in the save file.
	file.store_line(json_string)
	SignalBus.game_saved.emit()

func load_game():
	if not FileAccess.file_exists(get_active_path()):
		make_new_save()
		load_game()
	
	var file = FileAccess.open(get_active_path(), FileAccess.READ)
	
	var json_string = file.get_line()
	
	# Creates the helper class to interact with JSON.
	var json = JSON.new()
	
	# Check if there is any error while parsing the JSON string, skip in case of failure.
	var parse_result = json.parse(json_string)
	if not parse_result == OK:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
		return
	
	# Get the data from the JSON object.
	var data = json.data
	
	save_cache = data
	SignalBus.game_loaded.emit()

func delete_save():
	var file_to_remove = get_active_path()
	OS.move_to_trash(ProjectSettings.globalize_path(file_to_remove))

func does_entry_exist_in_cache(key) -> bool:
	return save_cache.has(key)

func get_entry_from_cache(key):
	print("Trying to get " + key + " from cache")
	if not save_cache.has(key):
		print(key + " not found")
		return null
	print(key + " found")
	return save_cache[key]

func update_entry_in_cache(key, value):
	print("Updating entry " + key + " in cache")
	save_cache[key] = value
