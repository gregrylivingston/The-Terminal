extends Panel

var scenarioChoiceButton = preload("res://scene/scenarioChoiceButton.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer.visible = false
	showFacilityTypes()

func showFacilityTypes():
	for i in gFacility.facilityType:
		createScenarioButton(i, "res://texture/icon/Icon_"+i+".png").get_node("Button_S").connect("pressed",saveFacilityType.bind(i))

func saveFacilityType(choice):
	gFacility.myType = choice
	for child in $GridContainer.get_children():child.queue_free()
	for i in gScenario.scenarioLocation:
		createScenarioButton(i, "res://texture/icon/Icon_"+i+".png").get_node("Button_S").connect("pressed",saveScenarioLocation.bind(i))
	
func saveScenarioLocation(choice):
	gScenario.myScenarioLocation = choice
	for child in $GridContainer.get_children():child.queue_free()
	for i in gScenario.scenarioType:
		createScenarioButton(i, "res://texture/icon/Icon_"+i+".png").get_node("Button_S").connect("pressed",saveScenarioType.bind(i))

func saveScenarioType(choice):
	gScenario.myScenarioType = choice
	for child in $GridContainer.get_children():child.queue_free()
	for i in gFacility.facilitySize:
		createScenarioButton(i, "res://texture/icon/Icon_"+i+".png").get_node("Button_S").connect("pressed",saveFacilitySize.bind(i))

func saveFacilitySize(choice):
	gFacility.myFacilitySize = choice
	for child in $GridContainer.get_children():child.queue_free()
	loadProposedScenario()
	
func loadProposedScenario():
	$VBoxContainer.visible = true
	$VBoxContainer/Label.text = "[i]" + shipNames[gFacility.facilityType.find_key(gFacility.myType)][gScenario.scenarioType.find_key(gScenario.myScenarioType)][0] + "[/i]"

func createScenarioButton(title, texture):
	var newButton = scenarioChoiceButton.instantiate()
	newButton.get_node("Button_S").myLabel = str(title).replace("_"," ")
	newButton.get_node("TextureRect").texture = load(texture)
	$GridContainer.add_child(newButton)
	return newButton




const shipNames = {
	"SHIP":{
		"EXPLORATION":[ "THE NEXT FRONTIER" , "THE INTREPID"], 
		"EXTRACTION":[ "TITANMUNCHER B-572" ],
		"MILITARY":[ "THE JOLLY ROGER" ,  "WHETHER-BE-WITH-US"],
		"SCIENCE":[ "STARLAB-7" ],
		"TOURISM":[ "THE HOLY RESONANCE ORBITER" ],
		"TRADE":[ "FASTLANE EXPRESS 202"]
	},
	"BASE":{
		"EXPLORATION":[ "THE NEXT FRONTIER" , "THE INTREPID"], 
		"EXTRACTION":[ "TITANMUNCHER B-572" ],
		"MILITARY":[ "THE JOLLY ROGER" ,  "WHETHER-BE-WITH-US"],
		"SCIENCE":[ "STARLAB-7" ],
		"TOURISM":[ "THE HOLY RESONANCE ORBITER" ],
		"TRADE":[ "FASTLANE EXPRESS 202"]
	},
	"STATION":{
		"EXPLORATION":[ "THE NEXT FRONTIER" , "THE INTREPID"], 
		"EXTRACTION":[ "TITANMUNCHER B-572" ],
		"MILITARY":[ "THE JOLLY ROGER" ,  "WHETHER-BE-WITH-US"],
		"SCIENCE":[ "STARLAB-7" ],
		"TOURISM":[ "THE HOLY RESONANCE ORBITER" ],
		"TRADE":[ "FASTLANE EXPRESS 202"]
	}
}
