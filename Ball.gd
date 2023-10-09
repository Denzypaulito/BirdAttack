extends RigidBody2D
static var width= ProjectSettings.get_setting("display/window/size/viewport_width")
static var height= ProjectSettings.get_setting("display/window/size/viewport_height")

@onready var id = 0
# Called when the node enters the scene tree for the first time.
#func _ready():



func place_ball():
	set_position(Vector2(width/9, height/1.5))
	#apply_central_impulse(Vector2(100,-30))
