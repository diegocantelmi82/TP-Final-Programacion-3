extends Node

var spawnerClass = load("res://common/Spawner.gd")
var spawner: Spawner
var ps: Resource
var playerShip: Ship
var shipInitPos = Vector2(-45, 1005)
var bossShip: Ship

func _ready():
	$Timer.connect("timeout", self, "onTimeout")
	$TextTimer.connect("timeout", self, "onTextTimeout")
	loadPlayerShip()
	playerShip.connect("dead", self, "on_ship_destroy")
	#bossShip.connect("dead", self, "on_boss_destroy")
	AudioManager.play("blitz", true)
	spawner = spawnerClass.new()
	add_child(spawner)
	$TextTimer.start()
	AudioManager.play("ready")
	
func loadPlayerShip():
	if Player.main_ship == Player.player_ship.AVENGER:
		ps = ResourceLoader.load("res://scenes/avenger/Avenger.tscn")
	elif Player.main_ship == Player.player_ship.DEFENDER:
		ps = ResourceLoader.load("res://scenes/defender/Defender.tscn")
		shipInitPos = Vector2(-45, 1150)
	elif Player.main_ship == Player.player_ship.STRIKER:
		ps = ResourceLoader.load("res://scenes/striker/Striker.tscn")
		shipInitPos = Vector2(0, 1300)
		
	playerShip = ps.instance()
	playerShip.global_position = shipInitPos
	playerShip.hp = Player.ships[Player.main_ship].hp
	playerShip.shield = Player.ships[Player.main_ship].shield
	self.add_child(playerShip)
	
func on_ship_destroy():
	if !Player.ships[Player.player_ship.AVENGER].is_alive && !Player.ships[Player.player_ship.DEFENDER].is_alive && !Player.ships[Player.player_ship.STRIKER].is_alive:
		Player.game_state = Player.game_status.GAMEOVER
	
	get_tree().change_scene("res://scenes/gameStatus/GameStatus.tscn")
	
func on_boss_destroy():
	AudioManager.stopAllStreamPlayers()
	Player.current_level += 1
	if Player.current_level > 4:
		Player.game_state = Player.game_status.END
	
	get_tree().change_scene("res://scenes/gameStatus/GameStatus.tscn")
	
func onTimeout():
	spawner.active = false
	
	$Ui/Status.text = "Warning"
	$Ui/Status.show()
	$TextTimer.start()
	AudioManager.play("warning")
	# Crear Boss
	# Switch musica
	# Descomentar boss connect
	
func onTextTimeout():
	$Ui/Status.hide()
