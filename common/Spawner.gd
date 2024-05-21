class_name Spawner

extends Node

enum enemies {ENEMY1, ENEMY2, ENEMY3}

var enemy1: Resource = ResourceLoader.load("res://scenes/enemies/Enemy1/Enemy1.tscn")
var enemy2: Resource = ResourceLoader.load("res://scenes/enemies/Enemy2/Enemy2.tscn")
var enemy3: Resource = ResourceLoader.load("res://scenes/enemies/Enemy3/Enemy3.tscn")

var active: bool = true
var spawnTimer: Timer
var enemy: Enemy

var spawnTime = {
	1: 5,
	2: 4,
	3: 3,
	4: 2
}

func _ready():
	spawnTimer = Timer.new()
	get_tree().get_current_scene().add_child(spawnTimer)
	spawnTimer.wait_time = spawnTime[Player.current_level]
	spawnTimer.start()
	spawnTimer.connect("timeout", self, "onTimeout")

func onTimeout():
	randomize()
	var enemyType = randi() % 3
	spawnEnemy(enemyType)
	
	if !active:
		spawnTimer.stop()
	
func spawnEnemy(enemyType):
	if enemyType == enemies.ENEMY1:
		enemy = enemy1.instance()
	elif enemyType == enemies.ENEMY2:
		enemy = enemy2.instance()
	elif enemyType == enemies.ENEMY3:
		enemy = enemy3.instance()
		
	randomize()
	var posX = randi() % 950 + 50
	enemy.global_position = Vector2(posX, 20)
	get_tree().get_current_scene().add_child(enemy)