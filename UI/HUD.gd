extends Control


func _ready():
	pass

func _physics_process(_delta):
	if Global.ammo >= 0:
		$Ammo.text = "      Ammo : "+ str(Global.ammo)
	if Global.ammo < 0:
		$Ammo.text = "      Reloading"


	if Global.health <= 0:
		$Health.text = "You Ded"
	else:
		$Health.text = str(Global.health) + " HP"
