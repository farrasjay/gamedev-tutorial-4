extends Area2D

func _on_FinishFlag_body_entered(body : KinematicBody2D):
	if body.get_name() == "Player":
		get_tree().change_scene("res://scenes/WinScreen.tscn")
