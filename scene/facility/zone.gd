extends Button

var myStylebox
enum tempAlarm { thermometer , thermometer_low, thermometer_half , thermometer_high }
enum hazardAlarm { cloud_haze , fire , cloud_haze_fill}


@onready var alarmsVbox = $VBox/alarms
@onready var shipPanel = $VBox/Panel

@export var zoneTitle : String = "ZONE"

@export var corner_radius = {"top_left":0,"bottom_left":0,"top_right":0,"bottom_right":0}
@export var border_width = { "left": 5 , "top" : 5 , "right" : 5 , "bottom" : 5}

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBox/alarms/dropdown.options = [ "NML" , "REST" , "EVAC"]
	setupAlarm(alarmsVbox.get_node("Button_S_TempAlarm") , tempAlarm , 2)
	setupAlarm(alarmsVbox.get_node("Button_S_HazardAlarm") , hazardAlarm , 0)
	
	
	myStylebox = StyleBoxFlat.new()
	myStylebox.bg_color = Color(0,0,0)
	myStylebox.border_color = Color(1,1,1)
	
	for i in corner_radius: myStylebox["corner_radius_" + i] = corner_radius[i]
	for i in border_width: myStylebox["border_width_" + i] = border_width[i]

	shipPanel.add_theme_stylebox_override("panel" , myStylebox)

	$VBox/Label.text = "[b]" + zoneTitle + "[/b]"


func setupAlarm(node , alarmStateEnum , state):
	node.addIcon("res://texture/icon/"+ alarmStateEnum.find_key(state).replace("_","-") +".svg" , false)
	node.get_node("VBox/TextureRect").modulate = G.colors.find_key(12)
	node.self_modulate = Color(0,0,0,0)
