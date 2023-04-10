extends Control

var playing = 0

func _ready():
	pass

func _physics_process(delta):
	if visible == true and playing == 0:
		$AudioStreamPlayer.play()
		playing = 1
	if visible == false and playing == 1:
		$AudioStreamPlayer.stop()
		playing = 0

func _on_Quit_pressed():
	get_tree().quit()
