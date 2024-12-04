extends Node

# Loads and Unloads the active level scene

@onready var level_1_name = "Level 1"
@onready var level_1_packed = load("res://Scenes/Levels/level_1.tscn")
@onready var level_2_name = "Level 2"
@onready var level_2_packed = load("res://Scenes/Levels/level_2.tscn")

var packed_levels = {}

var current_level
var current_level_packed

func _ready():
	packed_levels[level_1_name] = level_1_packed
	packed_levels[level_2_name] = level_2_packed
	
	load_level(level_2_packed)

func load_level_by_name(name) -> bool:
	if not packed_levels.has(name):
		return false
	load_level(packed_levels[name])
	return true

func load_level(level_packed):
	if not current_level == null:
		unload_level()
	
	current_level_packed = level_packed
	current_level = current_level_packed.instantiate()
	print(current_level.name)
	add_child(current_level)

func unload_level():
	current_level.queue_free()

func reload_current_level():
	current_level.queue_free()
	current_level = current_level_packed.instantiate()
	add_child(current_level)
