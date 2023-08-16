class_name Character extends Resource


var firstName: String
var lastName: String
var birthday: int #day of year
var age: int
var characterClass: Enums.characterClass
var profession:Enums.characterProfession
var color


func initialize():
	if characterClass == Enums.characterClass.OFFICER: color = G.colors.darkorchid
	elif characterClass == Enums.characterClass.CREWMEMBER: color = G.colors.mediumorchid
	else: color = G.colors.aquamarine

func get_button_label():
	if characterClass == Enums.characterClass.OFFICER:return Enums.professionOfficerTitle[profession] + " " + lastName.to_upper()
	if characterClass == Enums.characterClass.CREWMEMBER:return Enums.professionCrewTitle[profession] + " " + lastName.to_upper()
	else: return firstName.to_upper() + " " + lastName.to_upper()
