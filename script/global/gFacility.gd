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
	numberOfZones = facilityType.keys().find(myType) + facilitySize.keys().find(myFacilitySize) + 1
	


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
