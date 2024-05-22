extends Node

var spawnerClass = load("res://common/Spawner.gd")
var spawner: Spawner
var ps: Resource
var playerShip: Ship
var shipInitPos = Vector2(-45, 1005)

func _ready():
	$Timer.connect("timeout", self, "onTimeout")
	$TextTimer.connect("timeout", self, "onTextTimeout")
	$BossSpawnTimer.connect("timeout", self, "onBossSpawnTimeout")
	$BossDestroyTimer.connect("timeout", self, "onBossDestroyTimeout")
	loadPlayerShip()
	playerShip.connect("dead", self, "on_ship_destroy")
	AudioManager.play(AudioManager.levelMusic[Player.current_level], true)
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
	$Ui/Complete.show()
	AudioManager.play("mission_complete")
	$BossDestroyTimer.start()
	
func onTimeout():
	AudioManager.stopAllStreamPlayers()
	spawner.active = false
	
	$Ui/Status.text = "Warning"
	$Ui/Status.show()
	$TextTimer.start()
	AudioManager.play("warning")
	$BossSpawnTimer.start()
	
func onTextTimeout():
	$Ui/Status.hide()
	
func onBossSpawnTimeout():
	AudioManager.play("machine_paradigm")
	spawner.spawnBoss()
	
func onBossDestroyTimeout():
	Player.current_level += 1
	if Player.current_level > 4:
		Player.game_state = Player.game_status.END
		
	get_tree().change_scene("res://scenes/gameStatus/GameStatus.tscn")
