extends Node

var menu = null
var ammo = 6
var health = 10
var score = 0

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS

func _unhandled_input(_event):
	if Input.is_action_pressed("menu"):
		if menu == null:
			menu = get_node_or_null("/root/Game/UI/Menu")
		if menu != null:
			if not menu.visible:
				get_tree().paused = true
				menu.show()
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			else:
				get_tree().paused = false
				menu.hide()
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


