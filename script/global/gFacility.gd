extends Node

enum facilityType {  SHIP , STATION , BASE }
enum facilitySize { TINY ,  SMALL , MEDIUM , LARGE }
enum zoneType { HAB , BRIDGE , ENG , COMM , HUB , AIRLOCK }

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
	

	
	
var zoneResource = preload("res://script/class/zone.gd")

func createZone( zoneNumber ):
	var newZone = zoneResource.new()
	newZone.zoneNumber = zoneNumber
	newZone.zoneType = "A NEW ZONE"
	match(myType):
		"SHIP":setShipZoneType(newZone , zoneNumber)
		"BASE":setBaseZoneType(newZone , zoneNumber)
		"STATION":setStationZoneType(newZone , zoneNumber)

	myZones.push_back(newZone)

func setShipZoneType(newZone, zoneNumber):
	if zoneNumber == 0: newZone.zoneType = "ENG"
	if zoneNumber == 2:newZone.zoneType = "HAB"
	
	if zoneNumber == 1:
		match (gScenario.myScenarioType):
			"EXPLORATION":newZone.zoneType = "CARGO"
			"EXTRACTION":newZone.zoneType = "CARGO"
			"MILITARY":newZone.zoneType = "ARM"
			"SCIENCE":newZone.zoneType = "LAB"
			"TOURISM":newZone.zoneType = "HAB"
			"TRADE":newZone.zoneType = "HUB"
			
	if zoneNumber == 3:
		match (gScenario.myScenarioType):
			"EXPLORATION":newZone.zoneType = "COMMS"
			"EXTRACTION":newZone.zoneType = "EQUIP"
			"MILITARY":newZone.zoneType = "HOSP"
			"SCIENCE":newZone.zoneType = "HUB"
			"TOURISM":newZone.zoneType = "SPA"
			"TRADE":newZone.zoneType = "CARGO"

	if zoneNumber == 4:
		match (gScenario.myScenarioType):
			"EXPLORATION":newZone.zoneType = "HAB"
			"EXTRACTION":newZone.zoneType = "WKSHP"
			"MILITARY":newZone.zoneType = "HUB"
			"SCIENCE":newZone.zoneType = "SENSOR"
			"TOURISM":newZone.zoneType = "HUB"
			"TRADE":newZone.zoneType = "HAB"

	if numberOfZones > 3:
		if zoneNumber == numberOfZones - 1: newZone.zoneType = "BRIDGE"

func setBaseZoneType(newZone, zoneNumber):
	if zoneNumber == 0: newZone.zoneType = "ENG"
	if zoneNumber == 2:newZone.zoneType = "HAB"
	
	if zoneNumber == 1:
		match (gScenario.myScenarioType):
			"EXPLORATION":newZone.zoneType = "CARGO"
			"EXTRACTION":newZone.zoneType = "CARGO"
			"MILITARY":newZone.zoneType = "ARM"
			"SCIENCE":newZone.zoneType = "LAB"
			"TOURISM":newZone.zoneType = "HAB"
			"TRADE":newZone.zoneType = "HUB"
			
	if zoneNumber == 3:
		match (gScenario.myScenarioType):
			"EXPLORATION":newZone.zoneType = "COMMS"
			"EXTRACTION":newZone.zoneType = "EQUIP"
			"MILITARY":newZone.zoneType = "HOSP"
			"SCIENCE":newZone.zoneType = "HUB"
			"TOURISM":newZone.zoneType = "SPA"
			"TRADE":newZone.zoneType = "CARGO"

	if zoneNumber == 4:
		match (gScenario.myScenarioType):
			"EXPLORATION":newZone.zoneType = "HAB"
			"EXTRACTION":newZone.zoneType = "WKSHP"
			"MILITARY":newZone.zoneType = "HUB"
			"SCIENCE":newZone.zoneType = "SENSOR"
			"TOURISM":newZone.zoneType = "HUB"
			"TRADE":newZone.zoneType = "HAB"

	if numberOfZones > 3:
		if zoneNumber == numberOfZones - 1: newZone.zoneType = "BRIDGE"

func setStationZoneType(newZone, zoneNumber):
	if zoneNumber == 0: newZone.zoneType = "HAB"
	#if zoneNumber == 2:newZone.zoneType = "HAB"
	
	if zoneNumber == 1:
		match (gScenario.myScenarioType):
			"EXPLORATION":newZone.zoneType = "HUB"
			"EXTRACTION":newZone.zoneType = "DOCK"
			"MILITARY":newZone.zoneType = "OPS"
			"SCIENCE":newZone.zoneType = "HUB"
			"TOURISM":newZone.zoneType = "HAB"
			"TRADE":newZone.zoneType = "HUB"
	
	if zoneNumber == 2:
		match (gScenario.myScenarioType):
			"EXPLORATION":newZone.zoneType = "SENSOR"
			"EXTRACTION":newZone.zoneType = "CARGO"
			"MILITARY":newZone.zoneType = "ARM"
			"SCIENCE":newZone.zoneType = "LAB"
			"TOURISM":newZone.zoneType = "HAB"
			"TRADE":newZone.zoneType = "DOCK"
		
	if zoneNumber == 3:
		match (gScenario.myScenarioType):
			"EXPLORATION":newZone.zoneType = "COMMS"
			"EXTRACTION":newZone.zoneType = "EQUIP"
			"MILITARY":newZone.zoneType = "HOSP"
			"SCIENCE":newZone.zoneType = "SENSOR"
			"TOURISM":newZone.zoneType = "SPA"
			"TRADE":newZone.zoneType = "CARGO"

	if zoneNumber == 4:
		match (gScenario.myScenarioType):
			"EXPLORATION":newZone.zoneType = "HAB"
			"EXTRACTION":newZone.zoneType = "WKSHP"
			"MILITARY":newZone.zoneType = "HUB"
			"SCIENCE":newZone.zoneType = "REACTOR"
			"TOURISM":newZone.zoneType = "DOME"
			"TRADE":newZone.zoneType = "HAB"

	if numberOfZones > 3:
		if zoneNumber == numberOfZones - 1: 
			match (gScenario.myScenarioType):
				"EXPLORATION":newZone.zoneType = "HAB"
				"EXTRACTION":newZone.zoneType = "WKSHP"
				"MILITARY":newZone.zoneType = "SHIELD"
				"SCIENCE":newZone.zoneType = "REACTOR"
				"TOURISM":newZone.zoneType = "HUB"
				"TRADE":newZone.zoneType = "HAB"





# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
