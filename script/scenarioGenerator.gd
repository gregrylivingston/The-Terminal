extends Panel

var scenarioChoiceButton = preload("res://scene/dropdown.tscn")
var colorMap = {
	"SHIP":7,"STATION":12,"BASE":4,
	"EARTH_SYSTEM":12,"SOLAR_SYSTEM":6,"DISTANT_STAR":6,"ANOTHER_DIMENSION":0,
	"EXPLORATION":14,"TRADE":11,"SCIENCE":12,"MILITARY":0,"EXTRACTION":4,"TOURISM":9,
}
var button_facilityType
var button_scenarioLocation
var button_scenarioType
var button_facilitySize


func beginGame():
	get_tree().change_scene_to_file("res://scene/terminal.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	#$summary.visible = false
	$summary/Button_S.connect("pressed",beginGame)

	button_facilityType = createScenarioButton("BASE")

	$VBox/HBox/VBox1.add_child(button_facilityType)
	for i in gFacility.facilityType:button_facilityType.addOption(i)

	button_scenarioLocation = createScenarioButton("EARTH_SYSTEM")
	$VBox/HBox/VBox2.add_child(button_scenarioLocation)
	for i in gScenario.scenarioLocation:button_scenarioLocation.addOption(i)
	
	button_scenarioType = createScenarioButton("SCIENCE")
	$VBox/HBox/VBox3.add_child(button_scenarioType)
	for i in gScenario.scenarioType:button_scenarioType.addOption(i)

	button_facilitySize = createScenarioButton("TINY")
	$VBox/HBox/VBox4.add_child(button_facilitySize)
	for i in gFacility.facilitySize:button_facilitySize.addOption(i)

	button_facilityType.connect("newSelection" , loadProposedScenario)
	button_scenarioLocation.connect("newSelection" , loadProposedScenario)
	button_scenarioType.connect("newSelection" , loadProposedScenario)
	button_facilitySize.connect("newSelection" , loadProposedScenario)

#		createScenarioButton(i, "res://texture/icon/Icon_"+i+".png").get_node("Button_S").connect("pressed",saveFacilitySize.bind(i))

func saveFacilitySize(choice):
	gFacility.myFacilitySize = choice

	loadProposedScenario()
	
func loadProposedScenario():
	
	gFacility.myType = button_facilityType.selectedOption
	gScenario.myScenarioLocation = button_scenarioLocation.selectedOption
	gScenario.myScenarioType = button_scenarioType.selectedOption
	gFacility.myFacilitySize = button_facilitySize.selectedOption

	gFacility.myFacilityName = "[i]" + shipNames[gFacility.myType][gScenario.myScenarioType][0] + "[/i]"
	$summary/Label_FacilityName.text = gFacility.myFacilityName
	$summary/HBox1/Label_FacilityType.text = gFacility.myType.replace("_"," ")
	$summary/HBox1/Icon_FacilityType.texture = load("res://texture/icon/Icon_"+gFacility.myType+".png")
	$summary/HBox2/Label.text = gScenario.myScenarioLocation.replace("_"," ")
	$summary/HBox2/Icon.texture = load("res://texture/icon/Icon_"+gScenario.myScenarioLocation+".png")
	$summary/HBox3/Label.text = gScenario.myScenarioType.replace("_"," ")
	$summary/HBox3/Icon.texture = load("res://texture/icon/Icon_"+gScenario.myScenarioType+".png")
	$summary/HBox4/Label.text = gFacility.myFacilitySize.replace("_"," ")
	$summary/HBox4/Icon.texture = load("res://texture/icon/Icon_"+gFacility.myFacilitySize+".png")


func createScenarioButton(title):
	var newButton = scenarioChoiceButton.instantiate()
	newButton.selectedOption = title
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
		"EXPLORATION":[ "FRONTIER-ALPHA 1" , "FAR HORIZON PLANET-BASE"], 
		"EXTRACTION":[ "FORZEK TITANIUM MINE" ],
		"MILITARY":[ "SPARTA-NINE MILITARY BASE" ,  "OMEGA FRONTIER STATION"],
		"SCIENCE":[ "PLANETARYSCIENCE-7" , "CORE DISCOVERY PROJECT" ],
		"TOURISM":[ "ELRA LOW GRAVITY SPA" ],
		"TRADE":[ "GROUND STATION ALPHA" ]
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
