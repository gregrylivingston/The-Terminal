extends Node

var alertScene = preload("res://scene/alert.tscn")
var activeAlerts = []

var alertVbox

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func startAlerts():
	createAlert("question_10_whoAreYou")
	createAlert("request_10_temperature")
	createAlert("request_5_yellowAlert")
	createAlert("anomaly_5_fight")



func createAlert(alertDialogue : String):
	var newAlert = alertScene.instantiate()
	var title = alertDialogue.split("_")[0].to_upper()
	var button = newAlert.get_node("Button_S")
	button.myLabel = title
	button.myColor = int( alertDialogue.split("_")[1])
	alertVbox.add_child(newAlert)
	button.connect("pressed",gAlert.showDialogue.bind(alertDialogue , newAlert))

func showDialogue(dialogueTitle, button):
	button.queue_free()
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/" + dialogueTitle +".dialogue"), "Temperature Request")
