shader_type canvas_item;

uniform bool shield;
uniform vec4 color = vec4(0.0, 0.7, 1.0, 1.0);
uniform float outer_radius : hint_range(0,0.7,0.005) = 0.35;
uniform float inner_radius : hint_range(0,0.7,0.005) = 0.275;
uniform float fade_effect_amount : hint_range(0,0.1,0.005) = 0.01;

float circle(vec2 position, float radius, float feather) {
	return smoothstep(radius, radius + feather, length(position - vec2(0.5)));
}

void fragment() {
	if (shield) {
		float outer = circle(vec2(UV.x, UV.y), outer_radius, 0.01);
		float fade_effect = sin(TIME) * fade_effect_amount;
		float inner = 1.0 - circle(vec2(UV.x, UV.y), inner_radius, 0.1 - fade_effect);

		COLOR = color;
		COLOR.a -= outer + inner;
	} else {
		COLOR.a = 0.0;
	}
}