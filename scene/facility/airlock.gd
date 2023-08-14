extends Button

var myStylebox
var isOpen = true

# Called when the node enters the scene tree for the first time.
func _ready():
	myStylebox = StyleBoxFlat.new()
	myStylebox.bg_color = Color(0,0,0)
	myStylebox.border_color = Color(1,1,1)
	myStylebox.border_width_top = 3
	myStylebox.border_width_bottom = 3
	add_theme_stylebox_override("normal" , myStylebox)
	add_theme_stylebox_override("pressed" , myStylebox)
	add_theme_stylebox_override("hover" , myStylebox)
	add_theme_stylebox_override("focus" , myStylebox)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func openAirlock():
	myStylebox.border_width_left = 0
	myStylebox.border_width_right = 0
	isOpen = true

func closeAirlock():
	myStylebox.border_width_left = 3
	myStylebox.border_width_right = 3
	isOpen = false


func _on_pressed():
	if isOpen:closeAirlock()
	else: openAirlock()
