extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _physics_process(_delta):
	$Sprite.position.x += 1
	if $Sprite.position.x > 1300:
		$Sprite.position.x = -150

func _on_Play_pressed():
	Global.health = 10
	Global.ammo = 6
	Global.score = 0 
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game/Level1.tscn")


func _on_Quit_pressed():
	get_tree().quit()
