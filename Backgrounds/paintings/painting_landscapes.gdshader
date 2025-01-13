shader_type canvas_item;

void fragment() {
	float div = 300.0;
	float div2 = 200.0;
	float time = TIME * 0.5;
	
	COLOR = texture( TEXTURE, vec2( UV.x + sin( time + UV.y * 29.0 ) / div, UV.y + cos( time + UV.x * 13.0 ) / div2 ) );
	COLOR.b *= 1.0 + sin( time * 0.1 ) * 0.5;
}