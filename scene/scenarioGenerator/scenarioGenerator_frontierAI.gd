extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Button_S.connect("pressed",beginGame)
	
	
	
func beginGame():
	G.buildingScenario = false
	get_tree().change_scene_to_file("res://scene/terminal.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
