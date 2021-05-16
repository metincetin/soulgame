shader_type canvas_item;
uniform sampler2D noise_tex;
uniform vec4 flame_col:hint_color;
void fragment(){
	vec2 uv2 = UV;
	uv2.y += TIME;
	vec4 noise = texture(noise_tex, uv2) * .2 * flame_col;
	vec4 def = texture(TEXTURE,UV) * vec4(1.0,0.0,0.0,1.);
	COLOR = def + noise * def.a;
}