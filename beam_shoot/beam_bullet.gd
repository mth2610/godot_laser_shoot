extends Node2D

var width
var end_beam = preload("res://beam_shoot/end_beam.tscn")
var overlap_body
var max_beam_witdh
var overlap_polygon
var colliding_point
var expexted_scale
var parent_scale 

func _ready():
	## get width of beam texture
	max_beam_witdh = 2.5
	width = $main/beam.texture.get_width()
	parent_scale = get_parent().scale


func _process(delta):
	if $main.scale.x < 0:
		queue_free()
	
	if $main.scale.x < max_beam_witdh && (overlap_polygon == null):
		$main.scale.x += delta

	if overlap_polygon:
		if colliding_point:
			expexted_scale = sqrt((colliding_point[0] - global_position).dot(colliding_point[0] - global_position))/width	
			$main.scale.x = expexted_scale/parent_scale.x
			var endbeam = end_beam.instance()
			add_child(endbeam)
			endbeam.global_position = colliding_point[0]
			endbeam.position.y = 0
			
			
func _on_main_body_entered(body):
	body.take_damage()
	overlap_polygon = ConvexPolygonShape2D.new()
	overlap_body = body
	overlap_polygon.set_points(overlap_body.get_node("CollisionPolygon2D").get_polygon())
	colliding_point = overlap_polygon.collide_and_get_contacts(
	    overlap_body.get_global_transform(),
	    $main/CollisionShape2D.get_shape(), 
	    $main/CollisionShape2D.get_global_transform()
	)
	

			
func _on_main_body_exited(body):

	overlap_body = null
	overlap_polygon = null
	colliding_point = null
