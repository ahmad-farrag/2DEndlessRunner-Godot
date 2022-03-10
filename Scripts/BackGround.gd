extends Sprite

export var speed=300
#limit when looping infinte word 
export var limit=-1175
export var reLoopPos=1220
var obstacles=Array()

var randomX=Array()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	for c in get_children():
		if(c.is_in_group("Obstacles")):
			obstacles.append(c)
			randomX.append(c.position.x)
	RandomizeObstacles()


func _process(delta):
	translate(Vector2(-speed*delta,0))
	if(position.x<=limit):
		position.x=reLoopPos
		RandomizeObstacles()


func RandomizeArray(var arr):
	for i in range(0,obstacles.size()):
		var r=rand_range(0,obstacles.size())
		var temp=arr[i]
		arr[i]=arr[r]
		arr[r]=temp

func RandomizeObstacles():
	RandomizeArray(obstacles)
	for i in range(obstacles.size()):
		obstacles[i].position.x=randomX[i]
	
