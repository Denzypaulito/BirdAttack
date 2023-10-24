extends Node2D

static var width = ProjectSettings.get_setting("display/window/size/viewport_width")
static var height = ProjectSettings.get_setting("display/window/size/viewport_height")


# El objeto pájaro que será lanzado desde la resortera
var bird_scene = preload("res://prefabs/bird_prefab.tscn")
var timer = 0
var currentBird = null 
var birds = 4

func instance_bird():
	var instance = bird_scene.instantiate()
	currentBird = instance
	instance.offset  = get_position()
	self.add_child(instance)
	
	
func _ready():
	instance_bird()
	
func _process(_delta):
	if not $"/root/Score/".is_paused:
		timer += _delta
		if currentBird == null and timer > 3 and birds >= 2:
			birds -= 1
			instance_bird()
			# Concatena el nombre del nodo dinámicamente
			var birdName = "blueBird" + str(birds)
			# Busca el nodo con el nombre generado y lo elimina
			var birdNode = get_node(birdName)
			if birdNode:
				birdNode.queue_free()
		if birds < 2 and currentBird == null and timer > 6:
			$"/root/Score/CanvasLayer3".visible = true
			$"/root/Score/CanvasLayer".visible = false
		
		
func _on_button_button_down():
	if currentBird:
		currentBird.fshooting()
		

func _on_button_button_up():
	if currentBird:
		currentBird.fshot()
		currentBird = null 
		timer = 1

