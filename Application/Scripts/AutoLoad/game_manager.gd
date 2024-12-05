extends Node

# Stores global variables
# Stores active game state

var score = 0 

func _ready():
	SignalBus.coin_picked_up.connect(add_point)
	SignalBus.level_reloaded.connect(reset)

func reset():
	score = 0

func add_point():
	score += 1 
	SignalBus.coin_count_updated.emit(score)
