extends Panel

var scenarioChoiceButton = preload("res://scene/scenarioChoiceButton.tscn")
var colorMap = {
	"SHIP":7,"STATION":12,"BASE":4,
	"EARTH_SYSTEM":12,"SOLAR_SYSTEM":6,"DISTANT_STAR":6,"ANOTHER_DIMENSION":0,
	"EXPLORATION":14,"TRADE":11,"SCIENCE":12,"MILITARY":0,"EXTRACTION":4,"TOURISM":9,
}

func beginGame():
	get_tree().change_scene_to_file("res://scene/terminal.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$summary.visible = false
	showFacilityTypes()
	$summary/Button_S.connect("pressed",beginGame)

func showFacilityTypes():
	for i in gFacility.facilityType:
		createScenarioButton(i, "res://texture/icon/Icon_"+i+".png").get_node("Button_S").connect("pressed",saveFacilityType.bind(i))

func saveFacilityType(choice):
	print(choice)
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
	$summary.visible = true
	$summary/Label_FacilityName.text = "[i]" + shipNames[gFacility.myType][gScenario.myScenarioType][0] + "[/i]"
	$summary/HBox1/Label_FacilityType.text = gFacility.myType.replace("_"," ")
	$summary/HBox1/Icon_FacilityType.texture = load("res://texture/icon/Icon_"+gFacility.myType+".png")
	$summary/HBox2/Label.text = gScenario.myScenarioLocation.replace("_"," ")
	$summary/HBox2/Icon.texture = load("res://texture/icon/Icon_"+gScenario.myScenarioLocation+".png")
	$summary/HBox3/Label.text = gScenario.myScenarioType.replace("_"," ")
	$summary/HBox3/Icon.texture = load("res://texture/icon/Icon_"+gScenario.myScenarioType+".png")
	$summary/HBox4/Label.text = gFacility.myFacilitySize.replace("_"," ")
	$summary/HBox4/Icon.texture = load("res://texture/icon/Icon_"+gFacility.myFacilitySize+".png")


func createScenarioButton(title, texture):
	var newButton = scenarioChoiceButton.instantiate()
	newButton.get_node("Button_S").myLabel = str(title).replace("_"," ")
	newButton.get_node("TextureRect").texture = load(texture)
	if colorMap.has(title):
		newButton.get_node("Button_S").myColor = colorMap[title]
		newButton.get_node("TextureRect").modulate = G.colors.find_key(colorMap[title])
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
