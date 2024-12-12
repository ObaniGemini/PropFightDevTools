shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

const vec2 DIMENSIONS = vec2(1280.0, 720.0)/4.0;
const vec2 BAND_DIMENSION = vec2(1280.0, 720.0)/4.0;
const float CRT_MIX = 0.5;

void fragment() {
	vec2 uv = SCREEN_UV;

	uv -= vec2(0.5, 0.5);
	uv *= 0.95 + distance(uv, vec2(0, 0)) * 0.05;
	uv += vec2(0.5, 0.5);

	float band = sqrt(1.0 - abs(uv.y * BAND_DIMENSION.y - round(uv.y * BAND_DIMENSION.y)) * 1.25);

	vec2 ptmp = uv * DIMENSIONS;
	vec2 rounded = round(ptmp);
	vec2 delta = ptmp - rounded;
	vec4 deltaX = texture(screen_texture, (rounded + vec2(sign(delta.x), 0.0))/DIMENSIONS) * 1.25;
	vec4 deltaY = texture(screen_texture, (rounded + vec2(0.0, sign(delta.y)))/DIMENSIONS) * 1.25;

	vec2 pos = rounded/DIMENSIONS;
	vec4 PIXELIZE_OUT = mix(mix(textureLod(screen_texture, pos, 0.0), deltaX, 2.0 * (delta.x * delta.x)), deltaY, 2.0 * (delta.y * delta.y));

	COLOR.rgb = mix(texture(screen_texture, uv).rgb, PIXELIZE_OUT.rgb, CRT_MIX) * band;
}