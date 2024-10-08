extends Node

var button_s = preload("res://scene/button_s.tscn")
var terminalNode
var buildingScenario = true



enum colors { indianred, salmon, lightcoral,  lightsalmon,  
sandybrown, khaki,
moccasin, blanchedalmond, lightyellow, 
paleturquoise, aquamarine, turquoise, 
skyblue, deepskyblue, 
mediumorchid, darkorchid}

var colorMap = {
	"SHIP":7,"STATION":12,"BASE":4,
	"EARTH_SYSTEM":12,"SOLAR_SYSTEM":6,"DISTANT_STAR":6,"ANOTHER_DIMENSION":0,
	"EXPLORATION":14,"TRADE":11,"SCIENCE":12,"MILITARY":0,"EXTRACTION":4,"TOURISM":9,
	"NORMAL":12,"ALERT":0,"CONF":5,"STNS":5,"QTRS":8,"LCKDWN":0,"YELLOW":5,"RED":0,
	"NML":12,"EVAC":0,"REST":4,"OK":12
}





const maleFirstNames = ["ADAM" , "ALAN", "BEN", "BILL", "CLINTON", "CORY"]

var characterList = []

func _init():
	for x in Enums.characterClass.size():
		for y in Enums.characterProfession.size():
			createCharacter(x,y)
	for i in 3: createCharacter(Enums.characterClass.PASSENGER,randi_range(0,Enums.characterProfession.size()-1))
	for i in 3: createCharacter(Enums.characterClass.CREWMEMBER,randi_range(0,Enums.characterProfession.size()-1))

func createCharacter( charClass : Enums.characterClass, charProfession : Enums.characterProfession ):
	var newCharacter = Character.new()
	newCharacter.firstName = maleFirstNames[randi_range(0,maleFirstNames.size() - 1)]
	newCharacter.lastName = Names.lastNames[randi_range(0,Names.lastNames.size() - 1)]
	newCharacter.characterClass = charClass
	newCharacter.age = randi_range(18,65)
	newCharacter.birthday = randi_range(1,365)
	newCharacter.profession = charProfession
	newCharacter.initialize()
	characterList.push_back(newCharacter)
	

func getCharacterStats():
	var charStats = { }
	for charClass in Enums.characterClass.size(): charStats.merge({charClass:0})
	for char in characterList: charStats[char.characterClass] += 1
	return charStats
		
