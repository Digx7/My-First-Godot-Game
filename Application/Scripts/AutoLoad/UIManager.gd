extends CanvasLayer

# Loads and Unloads UI Scenes

const GAME_UI_KEY = "Game"
@onready var game_ui_packed = preload("res://Scenes/UI/GameUI.tscn")
const DEATH_UI_KEY = "Death"
@onready var death_msg_packed = preload("res://Scenes/UI/DeathMessage.tscn")

const MAIN_MENU_KEY = "Main Menu"
@onready var main_menu_packed = preload("res://Scenes/UI/Menus/main_menu.tscn")
const SAVE_SELECT_MENU_KEY = "Save Select Menu"
@onready var save_select_menu_packed = preload("res://Scenes/UI/Menus/save_select_menu.tscn")
const OPTIONS_MENU_KEY = "Options Menu"
@onready var options_menu_packed = preload("res://Scenes/UI/Menus/options_menu.tscn")
const CREDITS_MENU_KEY = "Credits Menu"
@onready var credits_menu_packed = preload("res://Scenes/UI/Menus/credits_menu.tscn")
const QUIT_MENU_KEY = "Quit Menu"
@onready var quit_menu_packed = preload("res://Scenes/UI/Menus/quit_menu.tscn")

var packed_ui = {}
var active_ui = {}



func _ready():
	package_ui()
	setup_signals()

func setup_signals():
	SignalBus.player_died.connect(on_player_died)
	SignalBus.level_reloaded.connect(on_level_reload)

func package_ui():
	packed_ui[GAME_UI_KEY] = game_ui_packed
	packed_ui[DEATH_UI_KEY] = death_msg_packed
	packed_ui[MAIN_MENU_KEY] = main_menu_packed
	packed_ui[SAVE_SELECT_MENU_KEY] = save_select_menu_packed
	packed_ui[OPTIONS_MENU_KEY] = options_menu_packed
	packed_ui[CREDITS_MENU_KEY] = credits_menu_packed
	packed_ui[QUIT_MENU_KEY] = quit_menu_packed

func try_load_ui_explicit(key, packed_node) -> bool:
	if active_ui.has(key):
		return false
	var node = packed_node.instantiate()
	add_child(node)
	active_ui[key] = node
	return true

func try_load_ui(key) -> bool:
	if active_ui.has(key):
		return false
	var node = packed_ui[key].instantiate()
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
	try_load_ui(GAME_UI_KEY)
	try_unload_ui(DEATH_UI_KEY)

func on_player_died():
	try_unload_ui(GAME_UI_KEY)
	try_load_ui(DEATH_UI_KEY)
