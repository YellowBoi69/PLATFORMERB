extends Area2D

export(String, FILE ,"*.tscn") var world_scene

#func _ready():
	#add_to_group("ememies",true)

func _physics_process(delta):
	var bodies = get_overlapping_bodies() 
	for body in bodies:
		if body. name =="player":
			get_tree().change_scene( world_scene)
		
func _process(delta):
	$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("walk")
	
	#var playerx = 0
	#var players = get_tree().get_nodes_in_group("players")
	#for player in players:
		#playerx = player.motion.x
		 
	#print("playerx:",playerx)
	
	

