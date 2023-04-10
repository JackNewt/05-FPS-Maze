extends Spatial

onready var Enemy = preload("res://Enemy/Enemy.tscn")

func _ready():
	var enemy = Enemy.instance()
	add_child(enemy)
	enemy.translate(Vector3(-20, .2, 4))
	enemy = Enemy.instance()
	add_child(enemy)
	enemy.translate(Vector3(11, .2, -20))
	enemy = Enemy.instance()
	add_child(enemy)
	enemy.translate(Vector3(2, .2, -13))
