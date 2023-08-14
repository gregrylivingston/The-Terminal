extends Control

@export var selectedOption: String
#@onready var dropdownList = $Panel/VBoxContainer
var button = preload("res://scene/button_s.tscn")
signal newSelection
signal dropdownOpen
signal dropdownClosed

var dropdownPanel
var dropdownPanelScene = preload("res://scene/dropdownPanel.tscn")
var options = []

func _ready():
	setupButton($Button_S , selectedOption)
	$Button_S.connect("mouse_entered" , showOptions)


	
func setupButton(button, title):
	button.myLabel = title
	button.myIcon = title
	if G.colorMap.has(title):
		button.myColor = G.colorMap[title]
	button.setupButtonStyle()
	
func addOption(title):
	options.push_back(title)
	
func addOptionButton( title ):
	var newButton = button.instantiate()
	setupButton(newButton , title)
	newButton.mouse_filter = MOUSE_FILTER_PASS
	dropdownPanel.get_node("VBoxContainer").add_child(newButton)
	newButton.connect("pressed" , selectOption.bind(title))
	dropdownPanel.size.y = 	dropdownPanel.get_node("VBoxContainer").get_child_count() * 35
	return newButton
	
func selectOption(selection):
	selectedOption = selection
	setupButton($Button_S , selection)
	dropdownPanel.queue_free()
	emit_signal("newSelection")

func showOptions():
	dropdownPanel = dropdownPanelScene.instantiate()
	for i in options: addOptionButton(i)
	emit_signal("dropdownOpen")
	dropdownPanel.connect("mouse_exited" , hideOptions)
	G.terminalNode.add_child(dropdownPanel)
	dropdownPanel.size.x = size.x
	dropdownPanel.position = get_screen_position()


	
func hideOptions():
	if not Rect2(dropdownPanel.get_global_rect()).has_point(get_global_mouse_position()):
		dropdownPanel.queue_free()
