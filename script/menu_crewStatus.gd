extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	$dropdown_passengerStatus.addOption("NORMAL")
	$dropdown_passengerStatus.addOption("QUARTERS")
	$dropdown_passengerStatus.addOption("LOCKDOWN")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
