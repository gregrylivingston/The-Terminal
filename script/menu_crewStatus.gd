extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	$dropdown_passengerStatus.addOption("NORMAL")
	$dropdown_passengerStatus.addOption("QTRS")
	$dropdown_passengerStatus.addOption("LCKDWN")

	$dropdown_crewmemberStatus.addOption("NORMAL")
	$dropdown_crewmemberStatus.addOption("STNS")
	$dropdown_crewmemberStatus.addOption("ALERT")

	$dropdown_officerStatus.addOption("NORMAL")
	$dropdown_officerStatus.addOption("CONF")
	$dropdown_officerStatus.addOption("ALERT")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
