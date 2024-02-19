extends Node2D


export var time = 0
export var height = 200
export var period = 2
var startY = 0
var prevY = 0
export (Curve) var posCurve

# Called when the node enters the scene tree for the first time.
func _ready():
	startY = position.y
	prevY = startY
	print("Platform initialized")
	print(startY)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	time = fmod(time, period)
	
	var y_pos = startY - height * posCurve.interpolate(time/period)
	
	var diff = y_pos - prevY
	move_local_y(diff)
	prevY = y_pos
