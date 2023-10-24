extends RigidBody2D

var isShot = true;
var doShot = false;
var shooting = false;

var triple_bird_scene = load("res://prefabs/triple_bird.tscn");
var pole_position;
var offset;
var prev_position;
var collisionCount;
var power;

func instance_bird():
	var instance = triple_bird_scene.instantiate()
	$"BlueBirdTriple".play()
	instance.global_position = global_position 
	var bird_container = $BirdContainer  # Reemplaza "$BirdContainer" con el nombre correcto del nodo.
	
	if bird_container:
		bird_container.add_child(instance)
	else:
		pass
	# Si no se encuentra el contenedor, agrega el pájaro a la raíz.
		#get_tree().get_root().add_child(instance)

func _ready():
	pole_position = Vector2(0,0);
	prev_position = global_position
	freeze = true;
	collisionCount = 0;
	power = false;
	
func _process(_delta):
	#if not $"/root/Score/".is_paused:
		if shooting:
			var mp = get_viewport().get_mouse_position() - offset
			var b_pos = pole_position + (mp - Vector2(pole_position)).normalized()*50;
			set_position(b_pos);
		else:
			if doShot:
				power = true
				freeze = false
				var mp = get_viewport().get_mouse_position() - offset
				var imp = (mp - Vector2(pole_position)).normalized()*-800*mass;
				apply_impulse(imp)
				$"BlueBirdFly".play()
				$"/root/Score".birds -= 1
			if Input.is_action_just_pressed("triple") and collisionCount == 0 and power == true:
				power = false
				instance_bird()
			doShot = false
			#isShot = true


func fshooting():
	shooting = true


func fshot():
	shooting = false
	doShot = true


func _on_body_entered(_body):
	collisionCount+=1;
		
