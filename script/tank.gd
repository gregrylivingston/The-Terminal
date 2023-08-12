extends Button

@export var myColor: G.colors 
@export var startingFill: int

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/ProgressBar.modulate = G.colors.find_key(myColor)
	$VBoxContainer/ProgressBar.value = startingFill
	$VBoxContainer/Hbox1/Label.text = str(startingFill) + "%"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
