## Tile map layer containing grass graphics.
extends TileMapLayer
class_name TileMapLayerGrass

## Connects to the [signal _GroundEventBus.tile_grid_generated] signal to create new graphics for the Tile grid.
func _ready() -> void:
	GroundEventBus.tile_grid_generated.connect(_on_tile_grid_generated)

## Creates new graphics for newly generated Tile grid.
## [param rows] Number of rows in new grid.[br]
## [param columns] Number of columns in new grid.
func _on_tile_grid_generated(rows: int, columns: int) -> void:
	# Clear previous graphics for the grid
	clear()

	# Get length of tile set tiles (should have only one row)
	var tile_set_length: int = tile_set.get_source(0).get_tiles_count()
	
	for row in range(rows):
		for column in range(columns):
			# Get random tile from tile set and set grid tile graphics
			var random_tile: int = randi() % tile_set_length
			set_cell(Vector2i(column, row), 0, Vector2i(random_tile, 0))