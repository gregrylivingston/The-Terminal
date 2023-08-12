extends Button

@export var myLabel: String
@export var myColor: G.colors 



func _ready():
	$Label.set_text(myLabel)
	self_modulate = G.colors.find_key(myColor)
	connect("mouse_entered",_button_hovered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _button_hovered():
	$AudioStreamPlayer.play()
	

func setupCharacter(char):
	myLabel = char.get_button_label()
	myColor = char.color
		
