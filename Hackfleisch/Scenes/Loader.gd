extends Control

@onready var tabs = %Tabs
@onready var diningbox = $VBoxContainer/Tabs/RecipesDining/DiningVBox
@onready var deliverybox = $VBoxContainer/Tabs/RecipesDelivery/DeliveryVBox
@onready var fridgebox = $VBoxContainer/Tabs/RecipesFridge/FridgeVBox
@onready var favouritebox = $VBoxContainer/Tabs/RecipesFavourite/FavouriteVBox
@onready var httpControl = %HttpController
@onready var text = $VBoxContainer/SearchBar/SearchText
@onready var fridge = $VBoxContainer/Tabs/RecipesFridge/FridgeVBox/Fridge
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func requestFavourite():
	httpControl.request_all_recipes(loadFavourite)
func requestDinner():
	httpControl.request_all_recipes(loadDinner)

func requestDelivery():
	httpControl.request_all_recipes(loadDelivery)

func requestFridge():
	httpControl.request_all_recipes(loadFridge)
	
func loadFavourite(result, response_code, headers, body):
	var jsonInst = JSON.new()
	var json = JSON.parse_string(body.get_string_from_utf8())
	for i in json:
		var slot = load("res://Scenes/recipe_slot.tscn").instantiate()
		favouritebox.add_child(slot)
		slot.imageUrl = i.imgUrl
		slot.steps = i.instructions
		slot.naming = i.title
		slot.time = i.duration
		slot.ingredients = i.ingredients
		slot.vitamins = i.vitamins
		slot.fibers = i.fiberPerUnit
		slot.calories = i.caloriesPerUnit
		slot.proteins = i.proteinsPerUnit
		slot.carbohydrates = i.carbsPerUnit
		slot.minerals = i.minerals
		slot.fats = i.fatsPerUnit
		slot.utensils = i.utensils
		slot.allergens = i.allergyBits
		slot.description = i.description
		slot.difficulty = i.difficulty
		slot.id = i.id
		slot.updateSlot()
		if(!slot.favourite):
			slot.visible=false
	
func loadDinner(result, response_code, headers, body):
	var jsonInst = JSON.new()
	var json = JSON.parse_string(body.get_string_from_utf8())
	for i in json:
		var slot = load("res://Scenes/recipe_slot.tscn").instantiate()
		diningbox.add_child(slot)
		slot.imageUrl = i.imgUrl
		slot.steps = i.instructions
		slot.naming = i.title
		slot.time = i.duration
		slot.ingredients = i.ingredients
		slot.vitamins = i.vitamins
		slot.fibers = i.fiberPerUnit
		slot.calories = i.caloriesPerUnit
		slot.proteins = i.proteinsPerUnit
		slot.carbohydrates = i.carbsPerUnit
		slot.minerals = i.minerals
		slot.fats = i.fatsPerUnit
		slot.utensils = i.utensils
		slot.allergens = i.allergyBits
		slot.description = i.description
		slot.difficulty = i.difficulty
		slot.id = i.id
		slot.updateSlot()
		
func loadDelivery(result, response_code, headers, body):
	var jsonInst = JSON.new()
	var json = JSON.parse_string(body.get_string_from_utf8())
	for i in json:
		var slot = load("res://Scenes/recipe_slot.tscn").instantiate()
		deliverybox.add_child(slot)
		slot.imageUrl = i.imgUrl
		slot.steps = i.instructions
		slot.naming = i.title
		slot.time = i.duration
		slot.ingredients = i.ingredients
		slot.vitamins = i.vitamins
		slot.fibers = i.fiberPerUnit
		slot.calories = i.caloriesPerUnit
		slot.proteins = i.proteinsPerUnit
		slot.carbohydrates = i.carbsPerUnit
		slot.minerals = i.minerals
		slot.fats = i.fatsPerUnit
		slot.utensils = i.utensils
		slot.allergens = i.allergyBits
		slot.description = i.description
		slot.difficulty = i.difficulty
		slot.updateSlot()
		
	
func loadFridge(result, response_code, headers, body):
	var jsonInst = JSON.new()
	var json = JSON.parse_string(body.get_string_from_utf8())
	for i in json:
		var slot = load("res://Scenes/recipe_slot.tscn").instantiate()
		fridgebox.add_child(slot)
		slot.imageUrl = i.imgUrl
		slot.steps = i.instructions
		slot.naming = i.title
		slot.time = i.duration
		slot.ingredients = i.ingredients
		slot.vitamins = i.vitamins
		slot.fibers = i.fiberPerUnit
		slot.calories = i.caloriesPerUnit
		slot.proteins = i.proteinsPerUnit
		slot.carbohydrates = i.carbsPerUnit
		slot.minerals = i.minerals
		slot.fats = i.fatsPerUnit
		slot.utensils = i.utensils
		slot.allergens = i.allergyBits
		slot.description = i.description
		slot.difficulty = i.difficulty
		slot.updateSlot()
		slot.visible=false
		fridge.check(slot)

func filterDinner():
	var searchable = text.text
	var children = diningbox.get_children()
	for i in children:
		if !(searchable in i.naming)and searchable.length() != 0:
			i.visible = false
		else:
			i.visible = true
	
func filterDelivery():
	var searchable = text.text
	var children = deliverybox.get_children()
	for i in children:
		if !(searchable in i.naming)and searchable.length() != 0:
			i.visible = false
		else:
			i.visible = true
	
func filterFridge():
	var searchable = text.text
	var children = fridgebox.get_children()
	for i in children:
		if !i.has_method("thisIsFridge") and !(searchable in i.naming) and searchable.length() != 0 :
			i.visible = false
		else:
			i.visible = true
	
