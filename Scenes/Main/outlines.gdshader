shader_type canvas_item;

uniform sampler2D outlined_texture : filter_nearest, repeat_enable;
uniform float precision : hint_range(1.0, 8.0, 1.0);

const vec2 OUTLINE_SIZE = vec2(4.0)/vec2(1280.0, 720.0);
const float ALPHA_THRESHOLD = 0.001;

vec4 TEX(sampler2D tex, vec2 uv) {
	return (uv.x < 0.0 || uv.y < 0.0 || uv.x > 1.0 || uv.y > 1.0) ?
		vec4(0.0) :
		texture(tex, uv);
}

void fragment() {
	float alpha = texture(outlined_texture, SCREEN_UV).a;
	vec2 offset = max(SCREEN_PIXEL_SIZE, OUTLINE_SIZE/precision);

	COLOR.a = 0.0;
	if (alpha > ALPHA_THRESHOLD) {
		for(float x = offset.x, y = offset.y; x <= OUTLINE_SIZE.x || y <= OUTLINE_SIZE.y; x += offset.x, y += offset.y) {
			if( TEX(outlined_texture, SCREEN_UV + vec2(-x, -y)).a < ALPHA_THRESHOLD ||
				TEX(outlined_texture, SCREEN_UV + vec2(x, -y)).a < ALPHA_THRESHOLD ||
				TEX(outlined_texture, SCREEN_UV + vec2(-x, y)).a < ALPHA_THRESHOLD ||
				TEX(outlined_texture, SCREEN_UV + vec2(x, y)).a < ALPHA_THRESHOLD) {
				COLOR.a = alpha;
				break;
			}
		}
	}
}
