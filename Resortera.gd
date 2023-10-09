extends Node2D

static var width = ProjectSettings.get_setting("display/window/size/viewport_width")
static var height = ProjectSettings.get_setting("display/window/size/viewport_height")


# El objeto pájaro que será lanzado desde la resortera
var bird_scene = preload("res://prefabs/bird_prefab.tscn")

var currentBird = null 

func instance_bird():
	var instance = bird_scene.instantiate()
	currentBird = instance
	instance.offset  = get_position()
	self.add_child(instance)
	
func _ready():
	instance_bird()
	
func _process(delta):
	if currentBird == null and Input.is_action_just_pressed("test"):
		instance_bird()
		
func _on_button_button_down():
	if currentBird:
		currentBird.fshooting()


func _on_button_button_up():
	if currentBird:
		currentBird.fshot()
		currentBird = null 

