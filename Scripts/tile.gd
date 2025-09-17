## Represents a tile in the grid.
extends Node
class_name Tile

## Row index of the tile.
var row: int = 0

## Column index of the tile.
var column: int = 0

## Initializes the tile with the given row and column.[br]
## [param tile_row] Row index for initialization.[br]
## [param tile_column] Column index for initialization.
func _init(tile_row: int, tile_column: int) -> void:
	row = tile_row
	column = tile_column
	
## Function to print out Tile in human readable form
func _to_string() -> String:
	return "(%d, %d)" % [row, column]
