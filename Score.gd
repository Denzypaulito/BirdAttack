extends Node2D

var score  = 0
var level  = 0
var birds = 4
var is_paused = false
var no_mute = true
var enemies_kill = 0
func _ready():
	pass
#func _input(event):
	#if event.is_action_pressed("ui_cancel"):
		#if is_paused:
			#resume_game()
		#else:
			#pause_game()

#func on_player_death():
	#$Song.stop()
	#is_paused = true
	#get_tree().paused = true
	#$CanvasLayer3.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not is_paused:
		$CanvasLayer/birds.text = "BIRDS: " + str(birds)
		$CanvasLayer/score.text = "SCORE: " + str(score)
		$CanvasLayer/level.text = "LEVEL: " + str(level)
		#var total_enemies = LevelManager.getTotalEnemiesInLevel()
		#$CanvasLayer/Enemies.text = "Enemies " + str(enemies_kill) + "/" + str(total_enemies)
	

func increment_enemy_kills():
	enemies_kill += 1

func reset_enemy_kills():
	enemies_kill = 0
	
func pause_game():
	is_paused = true
	get_tree().paused = true
	$CanvasLayer.hide()
	$CanvasLayer2.show() 

func resume_game():
	is_paused = false
	get_tree().paused = false
	$CanvasLayer.show()
	$CanvasLayer2.hide()


func _on_button_pressed():
	resume_game()
	$CanvasLayer3.hide()
	$CanvasLayer.show()
	$Song.play()
	level = 0
	LevelManager.loadFirstLevel()
	
func _on_button_pressed2():
	_on_button_pressed()
	#resume_game()
	#$CanvasLayer3.hide()
	#$Song.play()
	#get_tree().reload_current_scene()
	#birds = 4
	#score  = 0
	

func _on_continue_button_pressed():
	resume_game()


func _on_pause_button_pressed():
	pause_game()
	
func _on_mute_button_pressed():
	if not no_mute:
		no_mute = true
		$"CanvasLayer2/Mute Button".texture_normal = preload("res://Elementos/BirdBlue Sonido .png")  
		$Song.volume_db = 0 
		
	else:
		no_mute = false
		$"CanvasLayer2/Mute Button".texture_normal = preload("res://BirdBlue Mute.png")  # Cambia la textura a la versión silenciada
		$Song.volume_db = -80 

func on_score():
	score += 10
	

func _on_continue_button_2_pressed():
	LevelManager.loadNextLevel()
