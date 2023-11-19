shader_type canvas_item;
uniform float Green = 0.4;

void fragment() {
	COLOR = texture(TEXTURE,UV);
	COLOR += dot(vec4(0.1,0.4,0.1,0.5),vec4(COLOR.r,COLOR.g,COLOR.b,0.1));
}