class_name playerController

var playerPolling = load("res://common/playerController/playerPolling.gd")
var playerEvent = load("res://common/playerController/playerEvent.gd")
var playerMouse = load("res://common/playerController/playerMouse.gd")
var playerTap = load("res://common/playerController/playerTap.gd")
var playerScreenTouch = load("res://common/playerController/playerScreenTouch.gd")
var playerJoystick = load("res://common/playerController/playerJoystick.gd")
var playerAnalogJoystick = load("res://common/playerController/playerAnalogJoystick.gd")

# Especifica el tipo de movimiento del jugador
# 1 - polling
# 2 - eventos
# 3 - mouse follow
# 4 - tap simple
# 5 - screentouch
# 6 - gamepad D-pad
# 7 - gamepad analog left stick
var mode = 1

# Instancia de la clase que manejara los eventos input en un momento dado
var inputController = playerPolling.new()

func setInputMode(event):
	if event is InputEventKey:
		if event.pressed:
			match(event.scancode):
				KEY_1, KEY_KP_1:
					if mode != 1:
						mode = 1
						inputController = playerPolling.new()
				KEY_2, KEY_KP_2:
					if mode != 2:
						mode = 2
						inputController = playerEvent.new()
				KEY_3, KEY_KP_3:
					if mode != 3:
						mode = 3
						inputController = playerMouse.new()
				KEY_4, KEY_KP_4:
					if mode != 4:
						mode = 4
						inputController = playerTap.new()
				KEY_5, KEY_KP_5:
					if mode != 5:
						mode = 5
						inputController = playerScreenTouch.new()
				KEY_6, KEY_KP_6:
					if mode != 6:
						mode = 6
						inputController = playerJoystick.new()
				KEY_7, KEY_KP_7:
					if mode != 7:
						mode = 7
						inputController = playerAnalogJoystick.new()
				_:
					inputController._input(event)
		else:
			inputController._input(event)
	else:
		inputController._input(event)
				
func handleInput(player, delta):
	inputController.getPlayerAction(player, delta)
