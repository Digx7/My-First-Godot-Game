extends Label

func _ready():
	refresh_score(0)
	SignalBus.coin_count_updated.connect(refresh_score)
	SignalBus.level_reloaded.connect(reset_score)
	
func reset_score():
	text = "0"

func refresh_score(new_score):
	text = str(new_score)
