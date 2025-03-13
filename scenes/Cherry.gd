extends Area2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var sfx_collect: AudioStreamPlayer2D = $sfx_collect


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		sfx_collect.play()
		anim.play("collected")
		await anim.animation_finished
		queue_free()
