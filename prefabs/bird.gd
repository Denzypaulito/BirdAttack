extends RigidBody2D

var isShot = false;
var doShot = false;
var shooting = false;

var pole_position;
var offset;

func _ready():
	pole_position = Vector2(0,0);
	freeze = true;
	
	
func _process(delta):
	if not isShot:
		if shooting:
			var mp = get_viewport().get_mouse_position() - offset
			var b_pos = pole_position + (mp - Vector2(pole_position)).normalized()*50;
			set_position(b_pos);
		else:
			if doShot:
				freeze = false
				var mp = get_viewport().get_mouse_position() - offset
				var imp = (mp - Vector2(pole_position)).normalized()*-800*mass;
				apply_impulse(imp)
				doShot = false
				isShot = true


func fshooting():
	shooting = true


func fshot():
	shooting = false
	doShot = true
