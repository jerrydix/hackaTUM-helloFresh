extends Control
@onready var Loader = $"../../../../.."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		

func thisIsFridge():
	var children = get_parent().get_children()
	for i in children:
		if(i != self):
			i.queue_free()

func check(recipe_slot):
	var children = get_child(0).get_children()
	var requested
	var found = 0;
	for i in recipe_slot.ingredients:
		requested = 0;
		for j in children:
			if(j.changeColorToGreenAnim == true):
				requested+=1
			if i.ingredientType == j.name and j.changeColorToGreenAnim == true:
				found+=1
				#recipe_slot.visible = true
	if requested <= found and found!= 0:
		#print(str(requested)+" "+str(found)+"ya\n")
		recipe_slot.visible = true
	else:
		recipe_slot.visible = false
		#print(str(requested)+" "+str(found)+"no\n")


func _on_avocado_toggled(button_pressed):
	thisIsFridge()
	Loader.requestFridge()
	


func _on_tomato_toggled(button_pressed):
	thisIsFridge()
	Loader.requestFridge()


func _on_meat_toggled(button_pressed):
	thisIsFridge()
	Loader.requestFridge()


func _on_egg_toggled(button_pressed):
	thisIsFridge()
	Loader.requestFridge()


func _on_carrot_toggled(button_pressed):
	thisIsFridge()
	Loader.requestFridge()


func _on_cheese_toggled(button_pressed):
	thisIsFridge()
	Loader.requestFridge()


func _on_flour_toggled(button_pressed):
	thisIsFridge()
	Loader.requestFridge()


func _on_citrus_toggled(button_pressed):
	thisIsFridge()
	Loader.requestFridge()


func _on_milk_toggled(button_pressed):
	thisIsFridge()
	Loader.requestFridge()


func _on_potato_toggled(button_pressed):
	thisIsFridge()
	Loader.requestFridge()


func _on_garlic_toggled(button_pressed):
	thisIsFridge()
	Loader.requestFridge()


func _on_butter_toggled(button_pressed):
	thisIsFridge()
	Loader.requestFridge()
