extends CanvasLayer

var PocketItemUI = preload("res://entites/gui/PocketItemUI.tscn")

onready var inventory = get_parent().get_node("King/Inventory")
onready var pocket_items = $MarginContainer/PoketItems

var max_items = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	EventBus.connect("inventory_modified",self,"on_inventory_modified")


func on_inventory_modified():
	print("on_inventory_modified")
	var items = pocket_items.get_child_count()
	print("items {0} to delete".format({0:pocket_items.get_child_count()}))
	while pocket_items.get_child_count()>0:
		print("{1}".format({1:items}))
		var item = pocket_items.get_child(0)
		pocket_items.remove_child(item)
		item.queue_free()
		
	print("items {0} left".format({0:pocket_items.get_child_count()}))	
	print("Creating {0} items".format({0:inventory.get_child_count()}))
	for i in range(inventory.get_child_count()):
		print("{0}/{1}".format({0:i,1:inventory.get_child_count()}))
		var inventory_item = inventory.get_child(i)
		
		var pocket_item = PocketItemUI.instance()
		
		var pos=pocket_items.get_global_rect().size.x / max_items * i
		#pocket_item.position.x= pos
		#pocket_item.position.y= pocket_items.get_global_rect().position.y
		
		pocket_item.texture = inventory_item.icon
		pocket_items.add_child(pocket_item)
		
		 
	
	
	
