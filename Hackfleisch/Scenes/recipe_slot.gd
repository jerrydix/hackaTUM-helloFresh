extends Control
@onready var title = $VBoxContainer/Name/Label
@onready var fitness = $VBoxContainer/Image/Image/HBoxContainer/FitnessLabel
@onready var imaging = $VBoxContainer/Image/Image
@onready var Difficulty = $VBoxContainer/Image/Image/HBoxContainer/Difficulty
@onready var Description = $VBoxContainer/Details/Description
@onready var Duration = $VBoxContainer/Details/Duration
@onready var httpControl = %HttpController
@onready var root = self.get_parent().get_parent().get_parent().get_parent().get_parent()
var id
var steps
var imageUrl
var naming 
var time
var ingredients
var vitamins
var fibers
var calories
var proteins
var carbohydrates
var minerals
var fats
var utensils
var recipe
var allergens
var description
var difficulty
var favourite
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func updateSlot():
	if proteins > 10:
		fitness.visible=true
	else:
		fitness.visible=false
	title.text = naming
	self.Difficulty.text=difficulty
	if(difficulty == "Easy"):
		Difficulty.set("font_color", Color(0.22,0.75,0.25,1.00))
	elif(difficulty == "Medium"):
		Difficulty.set("theme_override_colors/font_color", Color(0.76,0.54,0.11,1.00))
	else:
		Difficulty.set("theme_override_colors/font_color", Color(0.69,0.12,0.18,1.00))
	Description.text = description
	Duration.text = str(time)
	httpControl.request_image(getImageFromUrl,imageUrl)

func getImageFromUrl(result, response_code, headers, body):
	var image = Image.new()
	var error = image.load_jpg_from_buffer(body)
	if error != OK:
		push_error("Couldn't load the image.")
	var texture = ImageTexture.new()
	imaging.texture = texture.create_from_image(image)
	#print(texture.get_width())


func _on_texture_button_pressed():
	var menu = load("res://Scenes/recipe_menu.tscn").instantiate()
	root.add_child(menu)
	menu.id = self.id
	menu.description = self.description
	menu.title = self.naming
	menu.instructions = self.steps
	menu.ingredients = self.ingredients
	menu.imaging = self.imaging.texture
	menu.visible = true
	menu.updateSelf()
	


func _on_texture_button_toggled(button_pressed):
	if(button_pressed):
		favourite=true
	else:
		favourite=false
