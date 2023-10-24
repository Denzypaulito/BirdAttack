extends Node



var levels = [
	"res://Levels/escenario.tscn",
	"res://Levels/escenario2.tscn",
	"res://Levels/escenario3.tscn",
	"res://Levels/escenario4.tscn",
	"res://Levels/Win.tscn"
]


var enemiesInLevel = [
	2,
	1,
	1,
	4,
	1
]

var curr = -1

var enemyCount = getTotalEnemiesInLevel() 


		
func enemyDeath():
	enemyCount -= 1
	print(enemyCount)
	if enemyCount == 0:
		get_tree().paused = true
		Score.is_paused = true
		$"/root/Score/CanvasLayer4".visible = true
		$"/root/Score/CanvasLayer".visible = false
		
func getTotalEnemiesInLevel():
	return enemiesInLevel[curr+1]
	
func getNextLevel():
	curr += 1
	return levels[curr]
	
func loadCurrentLevel():
	get_tree().paused = false
	Score.reset_enemy_kills()
	get_tree().change_scene_to_file(levels[curr])

		
func loadNextLevel():
	get_tree().paused = false
	Score.is_paused = false
	$"/root/Score/CanvasLayer4".visible = false
	$"/root/Score/CanvasLayer".visible = true
	enemyCount = getTotalEnemiesInLevel() 
	Score.reset_enemy_kills()
	Score.level += 1
	Score.birds = 4
	get_tree().change_scene_to_file(getNextLevel())
	
func loadFirstLevel():
	get_tree().paused = false
	curr = -1
	Score.level = 1
	Score.score = 0
	loadNextLevel()

#func _on_pressed():
	#$"/root/Score/CanvasLayer".visible = true
	#loadNextLevel()
