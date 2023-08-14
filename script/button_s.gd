extends Button

@export var myLabel: String
@export var myColor: G.colors 
@export var myIcon : String



func _ready():
	connect("mouse_entered",_button_hovered)
	setupButtonStyle()

func setupButtonStyle():
	$VBox/Label.set_text(myLabel.replace("_"," "))
	self_modulate = G.colors.find_key(myColor)


func addIcon(icon , isPng = true):
	myIcon = icon
	if isPng == true:$VBox/TextureRect.texture = load("res://texture/icon/Icon_" + myIcon  + ".png")
	else: $VBox/TextureRect.texture = load(myIcon)
	$VBox/TextureRect.visible = true
	$VBox/TextureRect.custom_minimum_size = Vector2(16,16)
	
func _button_hovered():
	$AudioStreamPlayer.play()
	

func setupCharacter(char):
	myLabel = char.get_button_label()
	myColor = char.color
		
