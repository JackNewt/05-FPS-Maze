extends KinematicBody

var Player = null
var health = 10
var reloading = 0
var shooting = 0
onready var rc = $RayCast
onready var s = $Search
var found = 0
var gravity = -30
var max_speed = 8
var velocity = Vector3(0,0,0)

func _ready():
	pass

func _physics_process(_delta):
	$Search.rotation_degrees.y += 5
	if Player == null:
		Player = get_node_or_null("/root/Game/Player")
	if Player != null:
		look_at(Player.global_transform.origin, Vector3.UP)
		if found == 1: 
			velocity.y += gravity
			var desired_velocity = Vector3(Player.translation.x - translation.x, 0, Player.translation.z - translation.z)
			
			velocity.x = desired_velocity.x
			velocity.z = desired_velocity.z
			velocity = move_and_slide(velocity, Vector3.UP, true)

	if rc.is_colliding():
		var c = rc.get_collider()
		if c.name == "Player" and shooting == 0 and reloading == 0:
			shooting = 1
			$Spatial/Idle.hide()
			$Spatial/Shoot.show()
			$Shooting.start()
	if s.is_colliding():
		var sc = s.get_collider()
		if sc.name == "Player" and found == 0:
			found = 1


func _on_Area_body_entered(body):
	if body.name == "Player":
		body.damage(10)
		
func damage(d):
	health -= d
	print(health)
	if health <= 0:
		Global.score += 100
		queue_free()
		



func _on_Shooting_timeout():
	$SpotLight.show()
	$Flash.start()
	$Spatial/Muzzleflash.show()
	$Gunshot.play()
	$Reloading.start()
	if rc.is_colliding():
		var c = rc.get_collider()
		if c.has_method("damage"):
			c.damage(1)
	$Spatial/Idle.show()
	$Spatial/Shoot.hide()
	shooting = 0
	reloading = 1




func _on_Reloading_timeout():
	reloading = 0


func _on_Flash_timeout():
	$SpotLight.hide()
	$Spatial/Muzzleflash.hide()


