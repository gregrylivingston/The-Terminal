extends VBoxContainer

var buttonScene = preload("res://Scene/button_s.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for oneColor in G.colors:
		var newButton = buttonScene.instantiate()
		newButton.myColor = G.colors.get(oneColor)
		newButton.myLabel = oneColor
		add_child(newButton)
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
