extends Spatial



func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()
