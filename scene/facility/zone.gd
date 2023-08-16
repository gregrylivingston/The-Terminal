extends Button

var myStylebox
enum tempAlarm { thermometer , thermometer_low, thermometer_half , thermometer_high }
enum hazardAlarm { cloud_haze , fire , cloud_haze_fill}

@export var zoneType : Enums.zoneTypes

@onready var alarmsVbox = $VBox/alarms
@onready var shipPanel = $VBox/Panel

var myZone : Zone


# Called when the node enters the scene tree for the first time.
func _ready():
	setupAlarm(alarmsVbox.get_node("Button_S_TempAlarm") , tempAlarm , 2)
	setupAlarm(alarmsVbox.get_node("Button_S_HazardAlarm") , hazardAlarm , 0)
	
	
	myStylebox = StyleBoxFlat.new()
	myStylebox.bg_color = Color(0,0,0,0)
	myStylebox.border_color = Color(1,1,1)
	
	for i in myZone.corner_radius: myStylebox["corner_radius_" + i] = myZone.corner_radius[i]
	for i in myZone.border_width: myStylebox["border_width_" + i] = myZone.border_width[i]

	shipPanel.add_theme_stylebox_override("normal" , myStylebox)
	shipPanel.add_theme_stylebox_override("pressed" , myStylebox)
	shipPanel.add_theme_stylebox_override("hover" , myStylebox)
	shipPanel.add_theme_stylebox_override("focus" , myStylebox)
	$VBox/Panel/Label.text = Enums.zoneTypes.find_key(zoneType)
	
	if G.buildingScenario: $VBox/alarms.visible = false

	$VBox/Panel/Label.text = Enums.zoneTypes.find_key(myZone.zoneType)

func setupAlarm(node , alarmStateEnum , state):
	node.addIcon("res://texture/icon/"+ alarmStateEnum.find_key(state).replace("_","-") +".svg" , false)
	node.get_node("VBox/TextureRect").modulate = G.colors.find_key(12)
	node.self_modulate = Color(0,0,0,0)
