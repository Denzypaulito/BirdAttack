extends Line2D

@export var resortera: Resortera

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var cbird = resortera.last_bird
	if cbird:
		visible = true
		set_point_position(1,cbird.get_global_position())
	else:
		visible = false
