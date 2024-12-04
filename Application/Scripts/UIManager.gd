extends CanvasLayer

# Loads and Unloads UI Scenes

@onready var game_ui_packed = preload("res://Scenes/UI/GameUI.tscn")
@onready var death_msg_packed = preload("res://Scenes/UI/DeathMessage.tscn")

var current_ui
var active_ui = {}

const GAME_UI_KEY = "Game"
const DEATH_UI_KEY = "Death"

func _ready():
	try_load_ui(GAME_UI_KEY, game_ui_packed)
	SignalBus.player_died.connect(on_player_died)
	SignalBus.level_reloaded.connect(on_level_reload)

func try_load_ui(key, packed_node) -> bool:
	if active_ui.has(key):
		return false
	var node = packed_node.instantiate()
	add_child(node)
	active_ui[key] = node
	return true

func try_unload_ui(key) -> bool:
	if active_ui.has(key):
		active_ui[key].queue_free()
		active_ui.erase(key)
		return true
	else:
		return false

func on_level_reload():
	try_load_ui(GAME_UI_KEY, game_ui_packed)
	try_unload_ui(DEATH_UI_KEY)

func on_player_died():
	try_unload_ui(GAME_UI_KEY)
	try_load_ui(DEATH_UI_KEY, death_msg_packed)
