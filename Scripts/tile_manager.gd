## Manages the tiles in the grid.
extends Node
class_name TileManager

## Number of rows in the grid.
var rows: int = 0

## Number of columns in the grid.
var columns: int = 0

## Connects to the [signal _GroundEventBus.ground_dimensions_changed] signal to get actual ground dimensions.
func _ready() -> void:
	GroundEventBus.ground_dimensions_changed.connect(_on_ground_dimensions_changed)

## Updates the number of rows and columns when the ground dimensions change.[br]
## [param new_rows] New number of rows.[br]
## [param new_columns] New number of columns.
func _on_ground_dimensions_changed(new_rows: int, new_columns: int):
	self.rows = new_rows
	self.columns = new_columns
