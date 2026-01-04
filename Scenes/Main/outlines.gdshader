shader_type canvas_item;

uniform sampler2D outlined_texture : filter_nearest, repeat_enable;
uniform float precision : hint_range(1.0, 8.0, 1.0);

const vec2 OUTLINE_SIZE = vec2(4.0)/vec2(1280.0, 720.0);
const float ALPHA_THRESHOLD = 0.0001;


float ign_noise(vec2 pos) {
	return mod(52.9829189 * mod(0.06711056 * pos.x + 0.00583715 * pos.y, 1.0), 1.0) - 0.5;
}

const float rate = 5.0;

vec2 ign_offset(vec2 uv, vec2 pixel_size, vec2 shift) {
	return uv + ign_noise(uv/pixel_size + shift) * 0.002;
}

vec4 TEX(sampler2D tex, vec2 uv, vec2 pixel_size, vec2 shift) {
	uv = ign_offset(uv, pixel_size, shift);
	return (uv.x < 0.0 || uv.y < 0.0 || uv.x > 1.0 || uv.y > 1.0) ?
		vec4(0.0) :
		texture(tex, uv);
}

void fragment() {
	vec2 off = SCREEN_PIXEL_SIZE;
	float alpha = max(
					max(texture(outlined_texture, SCREEN_UV + off).a,
						texture(outlined_texture, SCREEN_UV - off).a),
					max(texture(outlined_texture, SCREEN_UV + vec2(-off.x, off.y)).a,
						texture(outlined_texture, SCREEN_UV + vec2(off.x, -off.y)).a));
	
	
	vec2 offset = max(SCREEN_PIXEL_SIZE, OUTLINE_SIZE/precision);
	vec2 shift = vec2(floor(TIME * rate));
	
	COLOR.a = 0.0;
	if (alpha > ALPHA_THRESHOLD) {
		for(float x = offset.x, y = offset.y; x <= OUTLINE_SIZE.x || y <= OUTLINE_SIZE.y; x += offset.x, y += offset.y) {
			if( TEX(outlined_texture, SCREEN_UV + vec2(-x, -y), SCREEN_PIXEL_SIZE, shift).a < ALPHA_THRESHOLD ||
				TEX(outlined_texture, SCREEN_UV + vec2(x, -y), SCREEN_PIXEL_SIZE, shift).a < ALPHA_THRESHOLD ||
				TEX(outlined_texture, SCREEN_UV + vec2(-x, y), SCREEN_PIXEL_SIZE, shift).a < ALPHA_THRESHOLD ||
				TEX(outlined_texture, SCREEN_UV + vec2(x, y), SCREEN_PIXEL_SIZE, shift).a < ALPHA_THRESHOLD) {
				COLOR.a = alpha;
				break;
			}
		}
	} else {
		off = SCREEN_PIXEL_SIZE * 2.0;
		float alpha2 = max(
					max(texture(outlined_texture, ign_offset(SCREEN_UV + off, SCREEN_PIXEL_SIZE, shift)).a,
						texture(outlined_texture, ign_offset(SCREEN_UV - off, SCREEN_PIXEL_SIZE, shift)).a),
					max(texture(outlined_texture, ign_offset(SCREEN_UV + vec2(-off.x, off.y), SCREEN_PIXEL_SIZE, shift)).a,
						texture(outlined_texture, ign_offset(SCREEN_UV + vec2(off.x, -off.y), SCREEN_PIXEL_SIZE, shift)).a));
		
		COLOR.a = alpha + alpha2;
	}
}
