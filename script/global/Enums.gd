extends Node

enum zoneTypes { ARM , 
				BRIDGE, 
				CARGO , 
				COMMS ,  
				DISH , 
				DOCK, 
				ENG , 
				EQUIP ,
				HAB , 
				HOLE , 
				HOSP, 
				HUB , 
				LAB , 
				OPS, 
				MINE , 
				REACTOR , 
				PAD , 
				SENSOR , 
				SHIELD ,  
				SPA , 
				WORKSHOP
				}
enum characterClass { OFFICER , CREWMEMBER , PASSENGER , STOWAWAY, ROBOT, ALIEN }
enum characterProfession { CAPTAIN , ENGINEER , DOCTOR , MAINTENANCE}

const professionOfficerTitle = {
	characterProfession.CAPTAIN:"CAPTAIN",
	characterProfession.ENGINEER:"CHEIF ENGINEER",
	characterProfession.DOCTOR:"DOCTOR",
	characterProfession.MAINTENANCE:"SUPPLY OFFICER",
}

const professionCrewTitle = {
	characterProfession.CAPTAIN:"SEARGANT",
	characterProfession.ENGINEER:"ENGINEER",
	characterProfession.DOCTOR:"NURSE",
	characterProfession.MAINTENANCE:"CREWMEMBER",
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
