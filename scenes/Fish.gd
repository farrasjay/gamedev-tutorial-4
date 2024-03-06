extends Area2D

func _ready():
	$AnimationPlayer.play("idle")

func _on_Fish_body_entered(body : KinematicBody2D):
	if body.get_name() == "Player":
		get_tree().change_scene(str("res://scenes/LoseScreen.tscn"))
