extends Button

@export var myLabel: String
@export var myColor: G.colors 
@export var myIcon : String



func _ready():
	connect("mouse_entered",_button_hovered)
	setupButtonStyle()

func setupButtonStyle():
	$VBox/Label.set_text(myLabel.replace("_"," "))
	$VBox/TextureRect.texture = load("res://texture/icon/Icon_" + myIcon  + ".png")
	self_modulate = G.colors.find_key(myColor)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _button_hovered():
	$AudioStreamPlayer.play()
	

func setupCharacter(char):
	myLabel = char.get_button_label()
	myColor = char.color
		
