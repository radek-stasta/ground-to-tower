extends Node
class_name TileManager

## VARIABLES
## Number of ground rows
var rows: int = 0

## Number of ground columns
var columns: int = 0

## PRIVATE FUNCTIONS
func _ready() -> void:
	# Connect to ground_dimensions_changed for initial setup of the grid
	GroundEventBus.ground_dimensions_changed.connect(_on_ground_dimensions_changed)
	
## EVENT BUS CONNECTION FUNCTIONS
## Updates ground rows and columns based on received values
func _on_ground_dimensions_changed(rows: int, columns: int):
	self.rows = rows
	self.columns = columns
