extends Node2D
class_name Ground

## EXPORTED VARIABLES
## Rows of ground tiles
@export var rows: int = 0

## Columns of ground tiles
@export var columns: int = 0

## PRIVATE FUNCTIONS
func _ready() -> void:
	# Emit initial dimensions of ground tiles
	GroundEventBus.ground_dimensions_changed.emit(rows, columns)
