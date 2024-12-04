extends Node

@export var level_name = "Level 1"

func _ready():
	SignalBus.level_loaded.emit(level_name)
