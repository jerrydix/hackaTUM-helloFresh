extends Control

@onready var httpController = self.get_parent().get_child(2)
@onready var naming = $PanelContainer/ScrollContainer/VBoxContainer/Name
@onready var image = $PanelContainer/ScrollContainer/VBoxContainer/TextureRect
@onready var descript = $PanelContainer/ScrollContainer/VBoxContainer/Description
@onready var Ingredients = $PanelContainer/ScrollContainer/VBoxContainer/Ingredients/HBoxContainer/Ingredient
@onready var Amount = $PanelContainer/ScrollContainer/VBoxContainer/Ingredients/HBoxContainer/Amount
@onready var Instructions = $PanelContainer/ScrollContainer/VBoxContainer/Instructions/HBoxContainer/Label
var id
var title
var description
var instructions
var tags
var imaging
var ingredients


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func updateSelf():
	naming.text = title
	image.texture = imaging
	descript.text = description
	Instructions.text = instructions
	for i in ingredients:
		Ingredients.text += i.ingredientType + "\n"
		Amount.text += str(i.quantity) +" " +i.unit + "\n"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	self.queue_free()
