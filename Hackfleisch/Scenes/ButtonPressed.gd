extends TextureButton

var changeColorToGreenAnim
var shader = preload("res://Shaders/GreenShaderMat.tres")
# Called when the node enters the scene tree for the first time.
func _ready():
	self.changeColorToGreenAnim = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(changeColorToGreenAnim)
	if (changeColorToGreenAnim):
		if (shader.get_shader_parameter("Green")<0.4):
			shader.set_shader_parameter("Green", shader.get_shader_parameter("Green")+0.03);
			#print(shader.get_shader_parameter("Green"))


func _on_toggled(button_pressed):
	if self.button_pressed:
		self.material = shader
		self.changeColorToGreenAnim = true
	else:
		self.material = null
		self.changeColorToGreenAnim = false
		shader.set_shader_parameter("Green", 0);
