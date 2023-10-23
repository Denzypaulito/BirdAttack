extends Node

var levels = [
	"res://Levels/escenario.tscn",
	"res://Levels/escenario2.tscn",
	"res://Levels/escenario3.tscn",
	"res://Levels/escenario4.tscn"
]

var enemiesInLevel = [
	1,
	3,
	10
]

var curr = -1

func getTotalEnemiesInLevel():
	return enemiesInLevel[curr]
	
func getNextLevel():
	curr += 1
	return levels[curr]
	
func loadCurrentLevel():
	Score.reset_enemy_kills()
	get_tree().change_scene_to_file(levels[curr])
	if enemiesInLevel[curr] >= 5:
		Score.time = 180
		
func loadNextLevel():
	Score.reset_enemy_kills()
	Score.level += 1
	get_tree().change_scene_to_file(getNextLevel())
	
func loadFirstLevel():
	curr = -1
	loadNextLevel()
