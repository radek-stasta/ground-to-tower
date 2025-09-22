## Tile map layer containing grid graphics.
extends TileMapLayer
class_name TileMapLayerGrid

## Connects to the [signal _GroundEventBus.tile_grid_generated] signal to create new graphics for the grid.
func _ready() -> void:
	GroundEventBus.tile_grid_generated.connect(_on_tile_grid_generated)

## Creates new graphics for newly generated grid.
## [param rows] Number of rows in new grid.[br]
## [param columns] Number of columns in new grid.
func _on_tile_grid_generated(rows: int, columns: int) -> void:
	# Clear previous graphics for the grid
	clear()
	
	for row in range(rows):
		for column in range(columns):
			# Set grid graphics (only one possible now)
			set_cell(Vector2i(column, row), 0, Vector2i(0, 0))
			
