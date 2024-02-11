extends Node

enum player_ship {AVENGER, DEFENDER, STRIKER}

var main_ship: int = player_ship.AVENGER
var current_level: int = 1
var secondary_ammo: int = 3

var ships = {
			player_ship.AVENGER: 
								{
								"is_alive": 1,
								"secondary_ammo": secondary_ammo
								},
			player_ship.DEFENDER: 
								{
								"is_alive": 1,
								"secondary_ammo": secondary_ammo
								},
			player_ship.STRIKER: 
								{
								"is_alive": 1,
								"secondary_ammo": secondary_ammo
								}
			}
