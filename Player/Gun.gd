extends Spatial


func _ready():
	pass

func shoot():
	$Idle.hide()
	$Shoot.show()
	$Timer.start()

func _on_Timer_timeout():
	$Idle.show()
	$Shoot.hide()
