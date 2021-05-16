shader_type canvas_item;
uniform sampler2D noise_tex;
uniform vec4 noise_color:hint_color;
uniform vec4 overlay_color:hint_color;

uniform float creation_time = 0;

void fragment(){
	vec2 uv2 = UV;
	uv2.y += TIME * .6;
	vec4 noise = texture(noise_tex, uv2) * .2 * noise_color;
	vec4 def = texture(TEXTURE,UV) * overlay_color;
	COLOR = def + noise * def.a;
}