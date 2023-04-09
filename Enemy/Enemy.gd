extends KinematicBody

var Player = null
var health = 10

func _ready():
	pass

func _physics_process(_delta):
	if Player == null:
		Player = get_node_or_null("/root/Game/Player")
	if Player != null:
		look_at(Player.global_transform.origin, Vector3.UP)


func _on_Area_body_entered(body):
	if body.name == "Player":
		body.damage(10)
		
func damage(d):
	health -= d
	if health <= 0:
		queue_free()
