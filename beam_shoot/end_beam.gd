extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var time = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	rotation += delta
	time += delta
	scale += 0.6*scale*Vector2(sin(time),sin(time))
	

func _on_Timer_timeout():
	queue_free()
