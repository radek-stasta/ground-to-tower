## Tile map layer containing highlighting graphics.
extends TileMapLayer
class_name TileMapLayerHighlights

## Enum containing possible types of highlights. Corresponds to graphics position in TileSet[br][br]
## [member HighlightType.BLANK] no highlight, transparent.[br]
## [member HighlightType.FOCUSED] currently focused [Tile] under mouse cursor.[br]
## [member HighlightType.SELECTED] selected [Tile].[br]
## [member HighlightType.ADDING] [Tile] that will be added to selection.[br]
## [member HighlightType.REMOVING] [Tile] that will be removed from selection.
enum HighlightType {
	BLANK = 0,
	FOCUSED = 1,
	SELECTED = 2,
	ADDING = 3,
	REMOVING = 4
}

## Connects to the [signal _GroundEventBus.tile_grid_generated] signal to create new graphics for the highlighting grid.
func _ready() -> void:
	GroundEventBus.tile_grid_generated.connect(_on_tile_grid_generated)

## Creates new blank highlighting graphics for newly generated grid.
## [param rows] Number of rows in new grid.[br]
## [param columns] Number of columns in new grid.
func _on_tile_grid_generated(rows: int, columns: int) -> void:
	# Clear previous graphics for the grid
	clear()
	
	for row in range(rows):
		for column in range(columns):
			# Set grid graphics (only one possible now)
			set_cell(Vector2i(column, row), 0, Vector2i(HighlightType.BLANK, 0))
