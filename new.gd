extends KinematicBody2D

const UP = Vector2(0,-1)
const SPEED = 50
const JUMPHEIGHT = -550
const GRAVITY = 20

var motion = Vector2()


var timeToMoveCounter = 2
var timeToMoveFor = 2

func _ready():
	add_to_group("baddies")


func _physics_process(delta):
	#detect collisions
	var player = 0
	var collided_with = 0
	var slideCount = get_slide_count()
	if (slideCount > 0):
		for x in slideCount:
			var kc = get_slide_collision(x)
			print("x:",kc.get_class())
			if (kc.collider.is_in_group("players")):
				print("you hit a player")
				
	#motion
	timeToMoveCounter += delta
	if (timeToMoveCounter > timeToMoveFor):
		#$AnimatedSprite.play("up")
		var randomNumber = randi()%2+1
		print  (randomNumber)
		timeToMoveCounter = 0
		if (randomNumber == 1):
			motion.y = JUMPHEIGHT * -1
		else:
			motion.y = JUMPHEIGHT * 1
	motion.y += GRAVITY
	
	motion = move_and_slide(motion)
	
