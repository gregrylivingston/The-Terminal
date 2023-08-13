extends Control

@export var selectedOption: String
@onready var dropdownList = $Panel/VBoxContainer
var button = preload("res://scene/button_s.tscn")
signal newSelection
signal dropdownOpen
signal dropdownClosed

func _ready():
#	newButton.get_node("Button_S").myLabel = str(title).replace("_"," ")
#	newButton.get_node("Button_S").myIcon = title
#	if colorMap.has(title):
#		newButton.get_node("Button_S").myColor = colorMap[title]
	setupButton($Button_S , selectedOption)
	$Button_S.connect("mouse_entered" , showOptions)
	$Panel.connect("mouse_exited" , hideOptions)
	hideOptions()

	
func setupButton(button, title):
	button.myLabel = title
	button.myIcon = title
	if G.colorMap.has(title):
		button.myColor = G.colorMap[title]
	button.setupButtonStyle()
	
func addOption( title ):
	var newButton = button.instantiate()
	setupButton(newButton , title)
	newButton.mouse_filter = MOUSE_FILTER_PASS
	dropdownList.add_child(newButton)
	newButton.connect("pressed" , selectOption.bind(title))
	$Panel.size.y = $Panel/VBoxContainer.get_child_count() * 35
	return newButton
	
func selectOption(selection):
	selectedOption = selection
	setupButton($Button_S , selection)
	$Panel.visible = false
	emit_signal("newSelection")

func showOptions():
	$Panel.visible = true
	emit_signal("dropdownOpen")
	
	
func hideOptions():
	if not Rect2($Panel.get_global_rect()).has_point(get_global_mouse_position()):
		$Panel.visible = false
