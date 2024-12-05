extends Node

@export var level_name = "Level 1"
@export var ui_on_load = "Game"

func _ready():
	SignalBus.level_loaded.emit(level_name)
	Ui.try_load_ui(ui_on_load)
