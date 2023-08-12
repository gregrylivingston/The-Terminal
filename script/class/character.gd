class_name Character extends Resource


var firstName: String
var lastName: String
var birthday: int #day of year
var age: int
var characterClass: G.characterClass
var profession: G.characterProfession
var color


func initialize():
	if characterClass == G.characterClass.OFFICER: color = G.colors.darkorchid
	elif characterClass == G.characterClass.CREWMEMBER: color = G.colors.mediumorchid
	else: color = G.colors.aquamarine

func get_button_label():
	if characterClass == G.characterClass.OFFICER:return G.professionOfficerTitle[profession] + " " + lastName.to_upper()
	if characterClass == G.characterClass.CREWMEMBER:return G.professionCrewTitle[profession] + " " + lastName.to_upper()
	else: return firstName.to_upper() + " " + lastName.to_upper()
