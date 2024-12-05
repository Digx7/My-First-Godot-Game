extends Node

# Stores global variables
# Stores active game state

var game_state: Constants.GameStateTypes = Constants.GameStateTypes.MAIN_MENU

var score = 0 

func _ready():
	SignalBus.coin_picked_up.connect(add_point)
	SignalBus.level_reloaded.connect(reset)
	SignalBus.level_loaded.connect(on_new_level)
	reset()

func update_game_state(new_state:Constants.GameStateTypes) -> bool:
	if not game_state == new_state:
		game_state = new_state
		SignalBus.game_state_changed.emit(new_state)
		return true
	else:
		return false

func reset():
	if not SaveManager.does_entry_exist_in_cache(Constants.save_coin_key):
		score = 0
	else: 
		score = SaveManager.get_entry_from_cache(Constants.save_coin_key)

func add_point():
	score += 1 
	SignalBus.coin_count_updated.emit(score)
	
func on_new_level(name):
	SaveManager.update_entry_in_cache(Constants.save_coin_key, score)
