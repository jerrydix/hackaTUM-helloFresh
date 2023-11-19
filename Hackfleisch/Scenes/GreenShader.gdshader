shader_type canvas_item;
uniform float Green = 0.4;

void fragment() {
	COLOR = texture(TEXTURE, UV);
	COLOR.g = Green;
}

