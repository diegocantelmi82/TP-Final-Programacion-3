extends Node

var ps: Resource
var playerShip: Ship
var shipInitPos = Vector2(-45, 1005)

func _ready():
	loadPlayerShip()
	playerShip.connect("dead", self, "on_ship_destroy")

func _process(delta):
	pass
	
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
	self.add_child(playerShip)
	
	# Codigo de prueba para testear colisiones
	ps = ResourceLoader.load("res://scenes/enemies/Enemy1/Enemy1.tscn")
	var enemy = ps.instance()
	enemy.global_position = Vector2(500, 200)
	self.add_child(enemy)
	
	ps = ResourceLoader.load("res://scenes/enemies/Enemy2/Enemy2.tscn")
	enemy = ps.instance()
	enemy.global_position = Vector2(500, 200)
	self.add_child(enemy)
	
	ps = ResourceLoader.load("res://scenes/enemies/Enemy3/Enemy3.tscn")
	enemy = ps.instance()
	enemy.global_position = Vector2(800, 200)
	self.add_child(enemy)
	# Codigo de prueba para testear colisiones
	
func on_ship_destroy():
	if !Player.ships[Player.player_ship.AVENGER].is_alive && !Player.ships[Player.player_ship.DEFENDER].is_alive && !Player.ships[Player.player_ship.STRIKER].is_alive:
		Player.game_state = Player.game_status.GAMEOVER
	
	get_tree().change_scene("res://scenes/gameStatus/GameStatus.tscn")
