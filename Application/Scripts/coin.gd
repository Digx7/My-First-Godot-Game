extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	# GameManager.add_point()
	SignalBus.coin_picked_up.emit()
	animation_player.play("pickup")
