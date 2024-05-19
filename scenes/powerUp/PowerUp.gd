extends Node

enum power_ups {AMMO, SHIELD}
var type = "power_up"
var specialAmmoPowerUp = load("res://assets/menu/damage_icon.png")
var shieldPowerUp = load("res://assets/menu/shield.png")
var powerUpType = {
	power_ups.AMMO: specialAmmoPowerUp,
	power_ups.SHIELD: shieldPowerUp
}
var power_up
export var shieldPwr = 20
export var ammoQty = 1

func _ready():
	self.connect("area_entered", self, "_on_powerup_area_entered")
	
func initPowerUp(enemyPosition):
	randomize()
	power_up = randi() % 2
	$Sprite.texture = powerUpType[power_up]
	self.global_position = enemyPosition
	
func _on_powerup_area_entered(area):
	if power_up == power_ups.AMMO:
		area.setAmmo(ammoQty)
	elif power_up == power_ups.SHIELD:
		area.setShield(shieldPwr)
		
	AudioManager.play("power_up")
	queue_free()
