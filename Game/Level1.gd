extends Spatial

onready var Enemy = preload("res://Enemy/Enemy.tscn")

func _ready():
	var enemy = Enemy.instance()
	add_child(enemy)
	enemy.translate(Vector3(-20, .2, 4))
	var enemy2 = Enemy.instance()
	add_child(enemy2)
	enemy2.translate(Vector3(11, .2, -20))
	var enemy3 = Enemy.instance()
	add_child(enemy3)
	enemy3.translate(Vector3(2, .2, -13))
