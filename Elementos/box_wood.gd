extends RigidBody2D

var health = 20
var sprite : Sprite2D 
# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = $Sprite2D 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 18:
		sprite.set_texture(load("res://Elementos/BoxWoodDamaged.png"))
	if health <= 10:
		sprite.set_texture(load("res://Elementos/BoxWoodBroken.png"))
	if health <= 0:
		queue_free()
	#print(linear_velocity.length())


func _on_body_entered(body):
	if "isShot" in body:
		health -= 6
	if linear_velocity.length() >= 150:
		health -= 8
	if linear_velocity.length() >= 200:
		health -= 13
