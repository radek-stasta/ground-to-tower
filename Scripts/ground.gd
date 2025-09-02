## Represents the ground area in the grid.
extends Node2D
class_name Ground

## Number of rows in the ground grid.
@export var rows: int = 0

## Number of columns in the ground grid.
@export var columns: int = 0

## Emits the [signal _GroundEventBus.ground_dimensions_changed] with the initial rows and columns.
func _ready() -> void:
	GroundEventBus.ground_dimensions_changed.emit(rows, columns)
