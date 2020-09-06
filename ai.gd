extends KinematicBody
onready var timer = get_node("Timer")
var moveSpeed  = 5.0
var gravity = Vector3()

# Use this varible whenever you want to lock position.
var canMove = true

# components
onready var player = $Player
func _ready():
	pass
func _physics_process(delta):
	gravity.y += -1 * delta
	# calculate the direction to the player
	var dir = (player.translation - translation).normalized()
	dir.y = 0
	if canMove == true:
		look_at(Vector3(player.global_transform.origin.x, global_transform.origin.y, player.global_transform.origin.z), Vector3(0,1,0))
	# move the AI towards the player
	if translation.distance_to(player.translation) > attackDist and canMove:
		move_and_slide(dir * moveSpeed, Vector3.UP)
		move_and_slide(gravity)
