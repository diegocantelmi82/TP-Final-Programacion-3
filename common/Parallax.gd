extends Node

export var speed = 100
export var background: Texture

func _ready():
	loadSprite()

func _process(delta):
	self.scroll_offset.y += speed * delta
	
func loadSprite():
	if background:
		var spriteNode = Sprite.new()
		spriteNode.texture = background
		spriteNode.centered = 0
		spriteNode.centered = 0
		$ParallaxLayer.add_child(spriteNode)
