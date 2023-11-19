extends TabContainer

@onready var Loader = $"../.."
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_dinner_category_pressed():
	self.current_tab = 0
	Loader.requestDinner()


func _on_delivery_category_pressed():
	self.current_tab = 1
	Loader.requestDelivery()

func _on_in_fridge_category_pressed():
	self.current_tab = 2
	Loader.requestFridge()


func _on_search_text_text_changed():
	if(current_tab == 0):
		Loader.filterDinner()
	if(current_tab == 1):
		Loader.filterDelivery()
	if(current_tab == 2):
		Loader.filterFridge()


func _on_favourites_button_pressed():
	self.current_tab = 3
	Loader.requestFavourite()
