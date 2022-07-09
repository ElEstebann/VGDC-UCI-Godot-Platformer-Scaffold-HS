extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
export(float, 0, 20, 0.2) var timeout
var started: bool = false
var in_area: bool = false
var player = null
var player_velocity = -1



func _physics_process(delta):
	if(player && !started ):
		player_velocity = player.get("last_touched_ground")
		print(player_velocity)
		if(player_velocity == 0):
			started = true
		
	if(started):
		timeout -= delta
		#print(timeout)
		if(timeout <= 0):
			($CollisionShape2D as CollisionShape2D).disabled = true
			queue_free()
			
		


func _on_Area2D_body_entered(body):
	($CollisionShape2D as CollisionShape2D).disabled = false
	player = body


func _on_Area2D_body_exited(body):
	($CollisionShape2D as CollisionShape2D).disabled = true

	player = null


