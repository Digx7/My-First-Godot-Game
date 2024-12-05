extends Node

# Where all global signals will go

signal game_state_changed(newState:Constants.GameStateTypes)

signal level_reloaded
signal level_loaded(levelName)

signal coin_picked_up
signal coin_count_updated(newScore)

signal player_died
