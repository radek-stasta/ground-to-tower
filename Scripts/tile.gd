## Represents a tile in the grid.
extends Resource
class_name Tile

## Enum containing possible states of highlights. Corresponds to graphics position in [TileMapLayerHighlights] TileSet.[br][br]
## [member HighlightState.NONE] No highlight, no TileSet graphic.[br]
## [member HighlightState.FOCUSED] Currently focused tile under mouse cursor.[br]
## [member HighlightState.SELECTED] Selected tile.[br]
## [member HighlightState.ADDED] Tile will be added to selection.[br]
## [member HighlightState.REMOVED] Tile will be removed from selection.
enum HighlightState {
	NONE = -1,
	FOCUSED = 0,
	SELECTED = 1,
	ADDED = 2,
	REMOVED = 3
}

## Row index of the tile.
var row: int = 0

## Column index of the tile.
var column: int = 0

## Current state of highlight of the tile
var highlight_state: HighlightState = HighlightState.NONE

## Initializes the tile with the given row and column.[br]
## [param tile_row] Row index for initialization.[br]
## [param tile_column] Column index for initialization.
func _init(tile_row: int, tile_column: int) -> void:
	row = tile_row
	column = tile_column
	
## Function to print out Tile in human readable form
func _to_string() -> String:
	return "(%d, %d)" % [row, column]
