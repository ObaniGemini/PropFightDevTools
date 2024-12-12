shader_type canvas_item;

global uniform float abberation;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	float posX = (SCREEN_UV.x - 0.5) * 1.5;
	float abb = abberation * (posX * posX + 0.2);

	float r = texture(screen_texture, vec2(SCREEN_UV.x, clamp(SCREEN_UV.y + abb, 0.0, 1.0))).r;
	float g = texture(screen_texture, vec2(SCREEN_UV.x, clamp(SCREEN_UV.y + abb * 0.66, 0.0, 1.0))).g;
	float b = texture(screen_texture, vec2(SCREEN_UV.x, clamp(SCREEN_UV.y + abb * 0.33, 0.0, 1.0))).b;

	COLOR = mix(texture(screen_texture, SCREEN_UV), vec4(r, g, b, 1.0), 0.4);
}