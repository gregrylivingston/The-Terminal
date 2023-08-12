extends ColorRect

var nodes = {}


# Called when the node enters the scene tree for the first time.
func _ready():
	
	gAlert.alertVbox = $Panel/alertVbox
	gAlert.startAlerts()
	
	nodes.officerButton = $VBoxContainer3/HBoxContainer3/Button_Officers
	nodes.crewButton = $VBoxContainer3/HBoxContainer3/Button_Crew
	nodes.passengerButton = $VBoxContainer3/HBoxContainer3/Button_Passengers
	nodes.personListHeader = $VBoxContainer2/PersonListHeader
	nodes.personListVbox = $VBoxContainer2/VBoxContainer
	
	nodes.officerButton.connect("pressed",showCharacters.bind(G.characterClass.OFFICER))
	nodes.crewButton.connect("pressed",showCharacters.bind(G.characterClass.CREWMEMBER))
	nodes.passengerButton.connect("pressed",showCharacters.bind(G.characterClass.PASSENGER))

	var charStats = G.getCharacterStats()
	nodes.officerButton.text = str(charStats[G.characterClass.OFFICER]) + "      "
	nodes.crewButton.text = str(charStats[G.characterClass.CREWMEMBER]) + "      "
	nodes.passengerButton.text = str(charStats[G.characterClass.PASSENGER]) + "        "
	
	
func showCharacters(characterClass):
	nodes.personListHeader.text = "[i]"+ G.characterClass.find_key(characterClass)+"S[/i]"
	for i in nodes.personListVbox.get_children(): i.queue_free()
	for char in G.characterList:if char.characterClass == characterClass: addCharacterButton(char)

func addCharacterButton(char):
	var newButton = G.button_s.instantiate()
	newButton.setupCharacter(char)
	nodes.personListVbox.add_child(newButton)
	
