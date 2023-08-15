extends HBoxContainer

var zoneScene = preload("res://scene/facility/zone.tscn")
var airlockScene = preload("res://scene/facility/airlock.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	setupZones()


func setupZones():
	if gFacility.myType == gFacility.facilityType.find_key(gFacility.facilityType.STATION):addAirlock()
	for i in gFacility.myZones:addZoneDiagram(i)
	if gFacility.myType == gFacility.facilityType.find_key(gFacility.facilityType.STATION):addAirlock()
	
func addZoneDiagram(i):
	var newZone = addZone(i)
	if i.zoneNumber < gFacility.numberOfZones - 1: var newAirlock = addAirlock()
	elif gFacility.myType == gFacility.facilityType.find_key(gFacility.facilityType.SHIP):
		newZone.myStylebox.corner_radius_top_right = 50
		newZone.myStylebox.corner_radius_bottom_right = 50
	if gFacility.myType == gFacility.facilityType.find_key(gFacility.facilityType.BASE):
		newZone.myStylebox.corner_radius_top_right = 30
		newZone.myStylebox.corner_radius_bottom_right = 30
		newZone.myStylebox.corner_radius_top_left = 30
		newZone.myStylebox.corner_radius_bottom_left = 30


func addZone(i):
	var newZone = zoneScene.instantiate()
	newZone.size_flags_vertical = SIZE_SHRINK_CENTER
	newZone.size_flags_horizontal = SIZE_SHRINK_BEGIN
	newZone.zoneTitle = i.zoneType
	add_child(newZone)
	return newZone

func addAirlock():
	var newAirlock = airlockScene.instantiate()
	newAirlock.size_flags_vertical = SIZE_SHRINK_CENTER
	newAirlock.size_flags_horizontal = SIZE_SHRINK_BEGIN
	add_child(newAirlock)
	return newAirlock

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
