shader_type canvas_item;

uniform int shader_color;

void fragment() {
	COLOR = texture(TEXTURE, UV);
	if(shader_color == 1) {
		COLOR.r = abs(sin(TIME*50.0));
	}
}