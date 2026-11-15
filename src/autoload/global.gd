extends Node

@onready var canvas: TextureRect = $"/root/Main/PixelStorage/TextureRect"
@onready var pixel_storage: Node2D = $"/root/Main/PixelStorage"

var main = null

# just holding onto this shit until i add custom colors
#var defaultcolors:Array[Color] = [
	#Color("000000ff"),
	#Color("282828ff"),
	#Color("636363ff"),
	#Color("707070ff"),
	#Color("888888ff"),
	#Color("939393ff"),
	#Color("c6c6c6ff"),
	#Color("ffffffff")
#]

var colors:Array[Color] = [
	Color("000000ff"),
	Color("282828ff"),
	Color("636363ff"),
	Color("707070ff"),
	Color("888888ff"),
	Color("939393ff"),
	Color("c6c6c6ff"),
	Color("ffffffff")
]

var image = Image.create_empty(64, 64, false, Image.FORMAT_RGBA8)
const PIXEL = preload("uid://dgnps7ogqslxl")

func DrawPixel(x:int, y:int, color:int):
	image.set_pixel(x-1, y-1, colors[color-1])
	'''
	var pixel = get_node("/root/Main/PixelStorage/[%s, %s]" % [x, y])
	if pixel == null:
		var curPixel = PIXEL.instantiate()
		curPixel.position.x = x - 1
		curPixel.position.y = y - 1
		curPixel.name = "[%s, %s]" % [x, y]
		curPixel.update_pixel(colors[color - 1])
		main.pixel_storage.add_child(curPixel)
	else:
		pixel.update_pixel(colors[color - 1])
	'''

func ClearPixels():
	main.ClearScreen()
	
func ShowPixels():
	canvas.texture.update(image)

func setColorPalette(file:String):
	var lines = file.split("\n")
	
	colors = []
	
	for line in lines:
		if line != "":
			print(line)
			var color = Color.from_string(String(line), "282828ff")
			colors.push_back(color)
