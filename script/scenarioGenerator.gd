extends Panel

var scenarioChoiceButton = preload("res://scene/scenarioChoiceButton.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	addScenarioChoice("SPACE STATION", "res://texture/icon/Icon_SpaceStation.png")
	addScenarioChoice("SPACESHIP", "res://texture/icon/Icon_rocket.png")
	addScenarioChoice("PLANETARY BASE", "res://texture/icon/Icon_PlanetStation.png")


func addScenarioChoice(title, texture):
	var newButton = scenarioChoiceButton.instantiate()
	newButton.get_node("Button_S").myLabel = title
	newButton.get_node("TextureRect").texture = load(texture)
	$GridContainer.add_child(newButton)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
