 extends KinematicBody

onready var Camera = $Pivot/Camera

var ammo = 6
var reloading = 0

var gravity = -30
var max_speed = 8
var mouse_sensitivity = 0.002
var mouse_range = 1.2
var health = 10
onready var rc = $Pivot/RayCast

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

var velocity = Vector3()

func get_input():
	var input_dir = Vector3()
	if Input.is_action_pressed("forward"):
		input_dir += -Camera.global_transform.basis.z
	if Input.is_action_pressed("back"):
		input_dir += Camera.global_transform.basis.z
	if Input.is_action_pressed("left"):
		input_dir += -Camera.global_transform.basis.x
	if Input.is_action_pressed("right"):
		input_dir += Camera.global_transform.basis.x
	input_dir = input_dir.normalized()
	return input_dir

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		$Pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -mouse_range, mouse_range)
	

func _physics_process(delta):
	velocity.y += gravity * delta
	var desired_velocity = get_input() * max_speed
	
	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)
	
	if Input.is_action_just_pressed("shoot"):
		if ammo != 0:
			ammo -= 1
			print(ammo)
			$Pivot/Camera/Gun.shoot()
			if rc.is_colliding():
				var c = rc.get_collider()
				if c.name == "Enemy":
					c.damage(5)
		elif ammo == 0:
			if reloading == 0:
				$Pivot/Camera/Gun/Reload.start()
				print("reloading")
				reloading = 1

func damage(d):
	health -= d
	if health <= 0:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menus/Main_Menu.tscn")





func _on_Reload_timeout():
	ammo = 6
	reloading = 0
