extends Node

@export var level_name = "Level 1"
@export var ui_on_load = "Game"
@export var game_state_on_load: Constants.GameStateTypes = Constants.GameStateTypes.GAMEPLAY

func _ready():
	SignalBus.level_loaded.emit(level_name)
	Ui.try_load_ui(ui_on_load)
	GameManager.update_game_state(game_state_on_load)
