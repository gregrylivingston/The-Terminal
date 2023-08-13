extends Control


var selectedOption
var button = preload("res://scene/button_s.tscn")
signal newSelection

func _ready():
	connect("mouse_entered" , showOptions)
	connect("mouse_exited" , hideOptions)

func addOption( title ):
	var newButton = button.instantiate()
	newButton.myLabel = title
	#newButton.myColor = color
	$VBoxContainer.add_child(newButton)
	return newButton
	
func selectOption(selection):
	selectedOption = selection
	emit_signal("newSelection")


func showOptions():
	$VBoxContainer.visible = true
	
func hideOptions():
	$VBoxContainer.visible = false
