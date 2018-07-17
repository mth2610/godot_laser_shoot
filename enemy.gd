extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var t
var px0
var enemy_exposion = preload("res://enemy_exposion.tscn")
var hp
func _ready():
	hp = 1000
	t = 0
	px0 = position.x

func _process(delta):
	t += delta
	position.x = px0 + 400*sin(t)

func take_damage():
	hp -= 10
	if hp <= 0:
		$CollisionPolygon2D.queue_free()
		$Sprite.visible = false
		var explosion = enemy_exposion.instance()
		add_child(explosion)

