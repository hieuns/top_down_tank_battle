extends CanvasLayer

var red_bar = preload("res://assets/UI/barHorizontal_red_mid 200.png")
var green_bar = preload("res://assets/UI/barHorizontal_green_mid 200.png")
var yellow_bar = preload("res://assets/UI/barHorizontal_yellow_mid 200.png")
var bar_texture

func update_healthbar(value):
	bar_texture = green_bar
	if value < 60:
		bar_texture = yellow_bar
	if value < 25:
		bar_texture = red_bar
	$Margin/Container/HealthBar.texture_progress = bar_texture
	$Margin/Container/HealthBar/Tween.interpolate_property(
		$Margin/Container/HealthBar, "value", $Margin/Container/HealthBar.value, value, 0.2,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$Margin/Container/HealthBar/Tween.start()
	$AnimationPlayer.play("healthbar_flash")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "healthbar_flash":
		$Margin/Container/HealthBar.texture_progress = bar_texture
