extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var dr_vector
var beam_shoot = preload("res://beam_shoot/beam_bullet.tscn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	
	var right_rotation = Input.is_action_pressed("ui_right")
	var left_rotation = Input.is_action_pressed("ui_left")
	var move = Input.is_action_pressed("ui_up")
	var shoot = Input.is_action_pressed("shoot")
	var release_shoot = Input.is_action_just_released("shoot")
	
	if right_rotation:
		rotation += 0.008
	
	if left_rotation:
		rotation -= 0.008
	
	if shoot && (get_node("beam_bullet") == null):
		var beam_shoot_instance = beam_shoot.instance()
		add_child(beam_shoot_instance)
		beam_shoot_instance.position = $Position2D.position
	
	if release_shoot:
		get_node("beam_bullet").queue_free()
	
