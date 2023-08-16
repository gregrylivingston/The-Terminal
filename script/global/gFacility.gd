extends Node

enum facilityType {  SHIP , STATION , BASE }
enum facilitySize { TINY ,  SMALL , MEDIUM , LARGE }

var myType = "SHIP"
var myFacilitySize = "TINY"
var myFacilityName = "HELLO WORLD"

var myZones = []
var numberOfZones : int
#tiny / small = +1, medium + 2, large +3, very_large +4, giant +5
#base + 2 / station + 1 / ship + 0

func createMyZones():
	numberOfZones = facilitySize[myFacilitySize] + 3
	myZones = []
	#if gFacility.myType == gFacility.facilityType.find_key(gFacility.facilityType.STATION):addAirlock()
	for i in numberOfZones:createZone(i)
	#if gFacility.myType == gFacility.facilityType.find_key(gFacility.facilityType.STATION):addAirlock()
	


func createZone( zoneNumber ):
	var newZone
	var myZoneType
	match(myType):
		"SHIP": myZoneType = setShipZoneType(newZone , zoneNumber)
		"BASE": myZoneType = setBaseZoneType(newZone , zoneNumber)
		"STATION": myZoneType  = setStationZoneType(newZone , zoneNumber)
	print(myZoneType)
	newZone = getZoneResource(myZoneType)
	newZone.zoneNumber = zoneNumber
	myZones.push_back(newZone)

func getZoneResource(type):
	return load("res://script/class/zones/" + type + ".tscn").instantiate()

func setShipZoneType(newZone, zoneNumber):
	if zoneNumber == 0: return "ENG"
	if zoneNumber == 2: return "HAB"
	
	if zoneNumber == 1:
		match (gScenario.myScenarioType):
			"EXPLORATION": return "CARGO"
			"EXTRACTION": return "CARGO"
			"MILITARY":  return "ARM"
			"SCIENCE": return "LAB"
			"TOURISM": return "HAB"
			"TRADE":  return "HUB"
			
	if zoneNumber == 3:
		match (gScenario.myScenarioType):
			"EXPLORATION":  return "COMMS"
			"EXTRACTION": return "EQUIP"
			"MILITARY": return "HOSP"
			"SCIENCE": return "HUB"
			"TOURISM": return "SPA"
			"TRADE": return "CARGO"

	if zoneNumber == 4:
		match (gScenario.myScenarioType):
			"EXPLORATION": return "HAB"
			"EXTRACTION": return "WKSHP"
			"MILITARY": return "HUB"
			"SCIENCE":  return "SENSOR"
			"TOURISM": return "HUB"
			"TRADE": return "HAB"

	if numberOfZones > 3:
		if zoneNumber == numberOfZones - 1: return "BRIDGE"

func setBaseZoneType(newZone, zoneNumber):
	if zoneNumber == 0: return "ENG"
	if zoneNumber == 2: return "HAB"
	
	if zoneNumber == 1:
		match (gScenario.myScenarioType):
			"EXPLORATION":return"CARGO"
			"EXTRACTION":return"CARGO"
			"MILITARY":return"ARM"
			"SCIENCE":return"LAB"
			"TOURISM":return"HAB"
			"TRADE":return"HUB"
			
	if zoneNumber == 3:
		match (gScenario.myScenarioType):
			"EXPLORATION":return"COMMS"
			"EXTRACTION":return"EQUIP"
			"MILITARY":return"HOSP"
			"SCIENCE":return"HUB"
			"TOURISM":return"SPA"
			"TRADE":return"CARGO"

	if zoneNumber == 4:
		match (gScenario.myScenarioType):
			"EXPLORATION":return"HAB"
			"EXTRACTION":return"WKSHP"
			"MILITARY":return"HUB"
			"SCIENCE":return"SENSOR"
			"TOURISM":return"HUB"
			"TRADE":return"HAB"

	if numberOfZones > 3:
		if zoneNumber == numberOfZones - 1: return "BRIDGE"

func setStationZoneType(newZone, zoneNumber):
	if zoneNumber == 0: return "ENG"
	if zoneNumber == 2:"HAB"
	
	if zoneNumber == 1:
		match (gScenario.myScenarioType):
			"EXPLORATION":return "HUB"
			"EXTRACTION":return "DOCK"
			"MILITARY":return "OPS"
			"SCIENCE":return"HUB"
			"TOURISM":return"HAB"
			"TRADE":return"HUB"
	
	if zoneNumber == 2:
		match (gScenario.myScenarioType):
			"EXPLORATION":return "SENSOR"
			"EXTRACTION":return "CARGO"
			"MILITARY":return "ARM"
			"SCIENCE":return "LAB"
			"TOURISM":return "HAB"
			"TRADE":return  "DOCK"
		
	if zoneNumber == 3:
		match (gScenario.myScenarioType):
			"EXPLORATION":return"COMMS"
			"EXTRACTION":return"EQUIP"
			"MILITARY":return"HOSP"
			"SCIENCE":return"SENSOR"
			"TOURISM":return"SPA"
			"TRADE":return"CARGO"

	if zoneNumber == 4:
		match (gScenario.myScenarioType):
			"EXPLORATION":return"HAB"
			"EXTRACTION":return"WKSHP"
			"MILITARY":return"HUB"
			"SCIENCE":return "REACTOR"
			"TOURISM":return "DOME"
			"TRADE":"HAB"

	if numberOfZones > 3:
		if zoneNumber == numberOfZones - 1: 
			match (gScenario.myScenarioType):
				"EXPLORATION":return"HAB"
				"EXTRACTION":return"WKSHP"
				"MILITARY":return "SHIELD"
				"SCIENCE":return "REACTOR"
				"TOURISM":return"HUB"
				"TRADE":return"HAB"





# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
