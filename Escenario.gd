extends Node2D

@onready var ball = preload("res://Elementos/ball.tscn")
# Called when the node enters the scene tree for the first time.
#func _ready():
		#var b = ball.instantiate()
		#b.id = i
		#b.place_ball()
		# b.set_position(Vector2(x*100 + 100, 0))
		#add_child(b)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		var b = ball.instantiate()
		b.place_ball()
		add_child(b)

