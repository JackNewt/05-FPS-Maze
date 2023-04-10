extends Spatial

var spin = 0

func _ready():
	pass

func shoot():
	$Idle.hide()
	$Shoot.show()
	$Timer.start()

func _on_Timer_timeout():
	$Idle.show()
	$Shoot.hide()

func reload():
	$SpinTimer.start()
	spin = 1

func _physics_process(_delta):

	if spin != 0:
		if $Idle.rotation_degrees.z < 45:
			$Idle.rotation_degrees.z += 2
		if $Idle.translation.y > -1.5:
			$Idle.translation.y -= .05
	if spin == 0:
		if $Idle.rotation_degrees.z < 10:
			$Idle.rotation_degrees.z += 1
		if $Idle.rotation_degrees.z > 10:
			$Idle.rotation_degrees.z -= 1
		if $Idle.translation.y < 0:
			$Idle.translation.y += .05
		if $Idle.translation.y > 0:
			$Idle.translation.y -= .05

func _on_SpinTimer_timeout():
	spin = 0


