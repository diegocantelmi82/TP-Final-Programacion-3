extends Node

var spawnerClass = load("res://common/Spawner.gd")
var spawner: Spawner
var ps: Resource
var playerShip: Ship
var shipInitPos = Vector2(-45, 1005)

func _ready():
	$Timer.connect("timeout", self, "onTimeout")
	loadPlayerShip()
	playerShip.connect("dead", self, "on_ship_destroy")
	AudioManager.play("blitz", true)
	spawner = spawnerClass.new()
	add_child(spawner)
	
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
	
func on_ship_destroy():
	if !Player.ships[Player.player_ship.AVENGER].is_alive && !Player.ships[Player.player_ship.DEFENDER].is_alive && !Player.ships[Player.player_ship.STRIKER].is_alive:
		Player.game_state = Player.game_status.GAMEOVER
	
	get_tree().change_scene("res://scenes/gameStatus/GameStatus.tscn")
	
func onTimeout():
	spawner.active = false
	Player.current_level += 1
	Player.current_level = clamp(Player.current_level, 1, 4)
	get_tree().change_scene("res://scenes/gameStatus/GameStatus.tscn")
