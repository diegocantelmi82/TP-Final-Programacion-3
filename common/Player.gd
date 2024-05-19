extends Node

enum player_ship {AVENGER, DEFENDER, STRIKER}
enum game_status {PLAY, GAMEOVER, END}

var game_state: int = game_status.PLAY
var main_ship: int = player_ship.AVENGER
var current_level: int = 1
var secondary_ammo: int = 3

var ships = {
			player_ship.AVENGER: 
								{
								"is_alive": 1,
								"hp": 80,
								"shield": 0,
								"secondary_ammo": secondary_ammo
								},
			player_ship.DEFENDER: 
								{
								"is_alive": 1,
								"hp": 120,
								"shield": 0,
								"secondary_ammo": secondary_ammo
								},
			player_ship.STRIKER: 
								{
								"is_alive": 1,
								"hp": 100,
								"shield": 0,
								"secondary_ammo": secondary_ammo
								}
			}
