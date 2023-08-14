extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer4/dropdown.addOption("NORMAL")
	$HBoxContainer4/dropdown.addOption("YELLOW")
	$HBoxContainer4/dropdown.addOption("RED")

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
