extends RigidBody2D


export var jumpForce=200
var dead=false
var onTheGround=true
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused=true
	yield(get_tree().create_timer(1),"timeout")
	get_tree().paused=false
	get_node("AnimatedSprite").play("Run")
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	if !dead&&onTheGround:
		set_axis_velocity(Vector2(0,-jumpForce))
		get_node("AnimatedSprite").play("Jump")
		onTheGround=false


func _on_Player_body_entered(body):
	print(body.get_parent().name)
	if body.get_parent().name=="Ground"&&!dead:
		get_node("AnimatedSprite").play("Run")
		onTheGround=true
		
	if body.get_parent().is_in_group("Obstacles"):
		get_node("AnimatedSprite").play("Dead")
		dead=true
		yield(get_tree().create_timer(1),"timeout")
		get_tree().paused=true

	
