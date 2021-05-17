extends Camera

var noise:OpenSimplexNoise

var shake_time: float = 0.0
var frequency = 0.0
var amplitude = 0.0

var noise_y = 0

func _init():
	noise = OpenSimplexNoise.new()
	noise.seed = randi()
	noise.period = 4
	noise.octaves = 5

func _process(delta):
	if shake_time <= 0:	return
	var clamped = min(shake_time, 1)
	
	var t = OS.get_ticks_msec()
	
	var offset = Vector2(
		noise.get_noise_2d(t * frequency,noise_y),
		noise.get_noise_2d(t * frequency + 145,noise_y)
	) * amplitude * clamped;
	
	
	h_offset = offset.x
	v_offset = offset.y
	shake_time -= delta

func shake(duration, freq, amp):
	noise_y += 1
	shake_time += duration
	frequency = freq
	amplitude = amp
	pass
