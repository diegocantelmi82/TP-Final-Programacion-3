class_name playerController

var playerPolling = load("res://common/playerController/playerPolling.gd")

# Instancia de la clase que manejara los eventos input en un momento dado
var inputController = playerPolling.new()

func handleInput(player, delta):
	inputController.getPlayerAction(player, delta)
