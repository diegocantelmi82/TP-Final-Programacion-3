class_name playerController

var playerPolling = load("res://common/playerController/playerPolling.gd")

var inputController = playerPolling.new()

func handleInput(player, delta):
	inputController.getPlayerAction(player, delta)
