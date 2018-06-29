extends KinematicBody2D

const UP =Vector2(0,-1)
var motion= Vector2()


const ACCELERATION =50
const GRAVITY=20
var max_speed=150
const JUMP_HEIGHT=-550

func _physics_process(delta):
	if is_on_floor():
		if Input.is_action_pressed("ui_sprint"):
			max_speed = 300
		else:
			max_speed = 150
		
	
	motion.y += GRAVITY
	var friction =false
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, max_speed)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -max_speed)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		$Sprite.play("Idle")
		friction =true
		motion.x = lerp(motion.x, 0, 0.2)

	if is_on_floor():
		if Input.is_action_just_pressed("ui_jump"):
			motion.y= JUMP_HEIGHT
		if friction==true:
			motion.x = lerp(motion.x, 0, 0.2)
		
	else:
		if motion.y<0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if friction==true:
			motion.x = lerp(motion.x, 0, 0.05)
			
	motion = move_and_slide(motion,UP)
	pass
