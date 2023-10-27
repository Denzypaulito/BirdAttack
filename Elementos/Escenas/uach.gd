extends RigidBody2D
@export var health = 20
@export var maxHealth = 20
var sprite : Sprite2D 
var mats = "BoxWood"
var action = false


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = $Sprite2D 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if health <= 0:
		$"/root/Score".on_score()
		queue_free()
	#print(linear_velocity.length())


func _on_body_entered(body):
	if "isShot" in body:
		health -= 5
	if linear_velocity.length() >= 150:
		health -= 5
	if linear_velocity.length() >= 200:
		health -= 7.5
