extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $AnimatedSprite2D


func _physics_process(delta):
	# Handle Pause.
	if Input.is_action_just_pressed("pause"):
		if GameManager.game_state == Constants.GameStateTypes.GAMEPLAY:
			Ui.force_unload_all_ui()
			Ui.try_load_ui(Ui.PAUSE_MENU_KEY)
			GameManager.update_game_state(Constants.GameStateTypes.PAUSE_MENU)
		elif GameManager.game_state == Constants.GameStateTypes.PAUSE_MENU:
			Ui.force_unload_all_ui()
			Ui.try_load_ui(Ui.GAME_UI_KEY)
			GameManager.update_game_state(Constants.GameStateTypes.GAMEPLAY)
	
	if not GameManager.game_state == Constants.GameStateTypes.GAMEPLAY:
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")
	
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
